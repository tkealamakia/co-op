package com.atomyk.wardcoop


import org.springframework.security.providers.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.context.SecurityContextHolder as SCH

/**
 * Registration controller.
 */
class RegisterController {

	def authenticateService
	def daoAuthenticationProvider
	def emailerService

	static Map allowedMethods = [save: 'POST', update: 'POST']

	/**
	 * User Registration Top page.
	 */
	def index = {

		// skip if already logged in
		if (authenticateService.isLoggedIn()) {
			redirect(action:show)
			return
		}

		if (session.id) {
			def person = new Person()
			person.properties = params
            def group = null
            def groupName = "Default"
            if (request.getParameter("group") != null) {
                group = Ward.findByName(request.getParameter("group"))
                groupName = group?.name
            }
           
			return [person: person, groupName: groupName]
            // this goes to index.gsp
		}

		redirect uri: '/'
	}


	/**
	 * Person save action.
	 */
	def save = {

		// skip if already logged in
		if (authenticateService.isLoggedIn()) {
			redirect(action:show)
			return
		}

		def person = new Person()
		person.properties = params

        def ward = Ward.findByName(request.getParameter("groupName"))
        if (ward == null) {
            ward = Ward.findByName("Default")
        }
        person.ward = ward

		def config = authenticateService.securityConfig
		def defaultRole = config.security.defaultRole

		def role = Authority.findByAuthority(defaultRole)
		if (!role) {
			person.passwd = ''
			flash.message = 'Default Role not found.'
			render view: 'index', model: [person: person]
			return
		}

		if (params.captcha.toUpperCase() != session.captcha) {
			person.passwd = ''
			flash.message = 'Access code did not match.'
			render view: 'index', model: [person: person]
			return
		}

		if (params.passwd != params.repasswd) {
			person.passwd = ''
			flash.message = 'The passwords you entered do not match.'
			render view: 'index', model: [person: person]
			return
		}

		if (params.passwd.length() < 6) {
			flash.message = 'The password you entered must be at least 6 characters.'
			render view: 'index', model: [person: person]
			return
		}
		def pass = authenticateService.encodePassword(params.passwd)
		person.passwd = pass
		person.enabled = true


		if (person.save()) {
			role.addToPeople(person)
            // Configured in acegi plugin directory
			if (config.security.useMail) {
				String emailContent = """You have signed up for a ${Constants.APP_NAME} account at:

 ${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/home

 Here are the details of your account:
 -------------------------------------
 Email: ${person.email}
 First Name: ${person.firstName}
 Last Name: ${person.lastName}
 Password: ${params.passwd}
"""

				def email = [
					to: [person.email], // 'to' expects a List, NOT a single email address
					subject: "${Constants.APP_NAME} Account Signed Up",
					text: emailContent // 'text' is the email body
				]
				emailerService.sendEmails([email])
			}

			person.save(flush: true)
            person = Person.findByEmail(person.email)
            person.categories = new ArrayList()

            def categoryList = Category.findAll()
            categoryList.each() {
                println it
                person.categories.add(it)
            }
			person.save(flush: true)

			//def auth = new AuthToken(person.email, params.passwd)
			//def authtoken = daoAuthenticationProvider.authenticate(auth)
			//SCH.context.authentication = authtoken
			redirect uri: '/home'
		}
		else {
			person.passwd = ''
			render view: 'index', model: [person: person]
		}
	}
}
