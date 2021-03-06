

package com.atomyk.wardcoop

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class WardController {
    
    def authenticateService
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        def searchTerm = params.wardsearch
        if (searchTerm == "") {
            searchTerm = null
        }
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ wardInstanceList: Ward.findByNameLike("%${searchTerm}%"), wardInstanceTotal: Ward.count() ]
    }
    
    @Secured(['ROLE_ADMIN'])
    def show = {
        def wardInstance = Ward.get( params.id )

        if(!wardInstance) {
            flash.message = "Ward not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ wardInstance : wardInstance ] }
    }

    @Secured(['ROLE_ADMIN'])
    def delete = {
        def wardInstance = Ward.get( params.id )
        if(wardInstance) {
            try {
                wardInstance.delete(flush:true)
                flash.message = "Ward ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Ward ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Ward not found with id ${params.id}"
            redirect(action:list)
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit = {
        def wardInstance = Ward.get( params.id )

        if(!wardInstance) {
            flash.message = "Ward not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ wardInstance : wardInstance ]
        }
    }

    @Secured(['ROLE_ADMIN'])
    def update = {
        def wardInstance = Ward.get( params.id )
        if(wardInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(wardInstance.version > version) {
                    
                    wardInstance.errors.rejectValue("version", "ward.optimistic.locking.failure", "Another user has updated this Ward while you were editing.")
                    render(view:'edit',model:[wardInstance:wardInstance])
                    return
                }
            }
            wardInstance.properties = params
            if(!wardInstance.hasErrors() && wardInstance.save()) {
                flash.message = "Ward ${params.id} updated"
                redirect(action:show,id:wardInstance.id)
            }
            else {
                render(view:'edit',model:[wardInstance:wardInstance])
            }
        }
        else {
            flash.message = "Ward not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def wardInstance = new Ward()
        wardInstance.properties = params
        return ['wardInstance':wardInstance]
    }

    def save = {
        def wardInstance = new Ward(params)
        def person = PersonHelper.getCurrentUser(authenticateService)
        wardInstance.ownerId = person.email
        if(!wardInstance.hasErrors() && wardInstance.save()) {
            flash.message = "Ward ${wardInstance.id} created"
            def searchMap = [wardsearch:wardInstance.name]
            redirect(action:list, params:searchMap)
        }
        else {
            render(view:'create',model:[wardInstance:wardInstance])
        }
    }
}
