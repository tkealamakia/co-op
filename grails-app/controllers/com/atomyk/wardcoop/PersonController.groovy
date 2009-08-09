package com.atomyk.wardcoop

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class PersonController {

	def authenticateService

	// the delete, save and update actions only accept POST requests
	//static Map allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']
	static Map allowedMethods = [save: 'POST', update: 'POST', updatePassword: 'POST']

	def index = {
		redirect action: edit, params: params
	}

    @Secured(['ROLE_ADMIN'])
	def list = {
		if (!params.max) {
			params.max = 10
		}
		[personList: Person.list(params)]
	}


	/**
	 * Person delete action. Before removing an existing person,
	 * he should be removed from those authorities which he is involved.
	 */
    @Secured(['ROLE_ADMIN'])
	def delete = {

		def person = Person.get(params.id)
		if (person) {
			def authPrincipal = authenticateService.principal()
			if (!(authPrincipal instanceof String) && authPrincipal.username == person.username) {
				flash.message = "You can not delete yourself, please login as another admin and try again"
			}
			else {
				Authority.findAll().each { it.removeFromPeople(person) }
				person.delete()
				flash.message = "Person $params.id deleted."
			}
		}
		else {
			flash.message = "Person not found with id $params.id"
		}

		redirect action: list
	}

	def edit = {
        // Get current user
        def person = PersonHelper.getCurrentUser(authenticateService)
        
        // This means we are returning from a ward selection page
	    if (params.id != null) {
            def ward = Ward.findById(params.id)
            if (person.ward != ward) {
                // Person is changing groups, so delete all their old posts
                person.posts.each() {
                    def post = Post.get(it.id)

                    person.posts.remove(it)
                    post.ward.posts.remove(it)
                    post.category.posts.remove(it)

                    post.delete(flush:true)
                }
                person.ward = ward
                person.save()
            }
	    }

		if (!person) {
			flash.message = "Person not found with id $params.id"
			redirect action: list
			return
		}

		return buildPersonModel(person)
	}

    def editPassword = {

    }


    def updatePassword = {
        def person = PersonHelper.getCurrentUser(authenticateService)

        if (params.passwd != params.passwdConfirm) {
            flash.message = "Passwords do not match"
            redirect action: editPassword
            return
        }
		else if (params.passwd.length() < 6) {
			flash.message = 'The password you entered must be at least 6 characters'
            redirect action: editPassword
            return
		}
        else {
			person.passwd = authenticateService.encodePassword(params.passwd)
            if (!person.hasErrors() && person.save()) {
                flash.message = "Password updated"
                redirect action: edit
                return
            }
            else {
                flash.message = "Unable to update your password"
                redirect action: edit, id: person.id
                return
            }
        }
    }

	/**
	 * Person update action.
	 */
	def update = {

		def person = Person.get(params.id)
		if (!person) {
			flash.message = "Person not found with id $params.id"
			redirect action: edit, id: params.id
			return
		}

		long version = params.version.toLong()
		if (person.version > version) {
			person.errors.rejectValue 'version', "person.optimistic.locking.failure",
				"Another user has updated this Person while you were editing."
				render view: 'edit', model: buildPersonModel(person)
			return
		}

		person.properties = params
        /* Password change logic
		def oldPassword = person.passwd
		person.properties = params
		if (!params.passwd.equals(oldPassword)) {
			person.passwd = authenticateService.encodePassword(params.passwd)
		}
        */
		if (person.save()) {
			//Authority.findAll().each { it.removeFromPeople(person) }
			//addRoles(person)
			flash.message = "Account updated."
			redirect uri: '/home'
		}
		else {
			render view: 'edit', model: buildPersonModel(person)
		}
	}
/*
	def create = {
		[person: new Person(params), authorityList: Authority.list()]
	}
    */

	/**
	 * Person save action.
	 */
	def save = {

		def person = new Person()
		person.properties = params
		person.passwd = authenticateService.encodePassword(params.passwd)
		if (person.save()) {
			addRoles(person)
			redirect action: show, id: person.id
		}
		else {
			render view: 'create', model: [authorityList: Authority.list(), person: person]
		}
	}

	private void addRoles(person) {
		for (String key in params.keySet()) {
			if (key.contains('ROLE') && 'on' == params.get(key)) {
				Authority.findByAuthority(key).addToPeople(person)
			}
		}
	}

	private Map buildPersonModel(person) {

		List roles = Authority.list()
		roles.sort { r1, r2 ->
			r1.authority <=> r2.authority
		}
		Set userRoleNames = []
		for (role in person.authorities) {
			userRoleNames << role.authority
		}
		LinkedHashMap<Authority, Boolean> roleMap = [:]
		for (role in roles) {
			roleMap[(role)] = userRoleNames.contains(role.authority)
		}

		return [person: person, roleMap: roleMap]
	}
}
