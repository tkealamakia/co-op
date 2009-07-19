package com.atomyk.wardcoop

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class ImageController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ imageInstanceList: Image.list( params ), imageInstanceTotal: Image.count() ]
    }

    def show = {
        def imageInstance = Image.get( params.id )

        if(!imageInstance) {
            flash.message = "Image not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ imageInstance : imageInstance ] }
    }

    def delete = {
        def imageInstance = Image.get( params.id )
        if(imageInstance) {
            try {
                imageInstance.delete(flush:true)
                flash.message = "Image ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Image ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Image not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def imageInstance = Image.get( params.id )

        if(!imageInstance) {
            flash.message = "Image not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ imageInstance : imageInstance ]
        }
    }

    def update = {
        def imageInstance = Image.get( params.id )
        if(imageInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(imageInstance.version > version) {
                    
                    imageInstance.errors.rejectValue("version", "image.optimistic.locking.failure", "Another user has updated this Image while you were editing.")
                    render(view:'edit',model:[imageInstance:imageInstance])
                    return
                }
            }
            imageInstance.properties = params
            if(!imageInstance.hasErrors() && imageInstance.save()) {
                flash.message = "Image ${params.id} updated"
                redirect(action:show,id:imageInstance.id)
            }
            else {
                render(view:'edit',model:[imageInstance:imageInstance])
            }
        }
        else {
            flash.message = "Image not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def imageInstance = new Image()
        imageInstance.properties = params
        return ['imageInstance':imageInstance]
    }

    def save = {
        def imageInstance = new Image(params)
        if(!imageInstance.hasErrors() && imageInstance.save()) {
            flash.message = "Image ${imageInstance.id} created"
            redirect(action:show,id:imageInstance.id)
        }
        else {
            render(view:'create',model:[imageInstance:imageInstance])
        }
    }
    
    @Secured(['ROLE_USER'])
    def image= {
        def obj = Image.get( params.id )
        byte[] image = obj.image
        response.outputStream << image
    }
}
