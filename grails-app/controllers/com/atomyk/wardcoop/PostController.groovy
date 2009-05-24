package com.atomyk.wardcoop

class PostController {
    
    
    def authenticateService
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ postInstanceList: Post.list( params ), postInstanceTotal: Post.count() ]
    }
    def listByUser = {
        // Get current user
        def user = authenticateService.principal() 
        def username = user?.getUsername()
        def person = Person.findByUsername(username)
        
        def postList = Post.findAllByPerson(person)
        if (postList == null) {
            postList = new ArrayList()
        }
        
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ postInstanceList: postList, postInstanceTotal: postList.count() ]
    }

    def show = {
        def postInstance = Post.get( params.id )

        if(!postInstance) {
            flash.message = "Post not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ postInstance : postInstance ] }
    }

    def delete = {
        def postInstance = Post.get( params.id )
        if(postInstance) {
            try {
                postInstance.delete(flush:true)
                flash.message = "Post ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Post ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Post not found with id ${params.id}"
            redirect(action:listByUser)
        }
    }

    def edit = {
        def postInstance = Post.get( params.id )

        if(!postInstance) {
            flash.message = "Post not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ postInstance : postInstance ]
        }
    }

    def update = {
        def postInstance = Post.get( params.id )
        if(postInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(postInstance.version > version) {
                    
                    postInstance.errors.rejectValue("version", "post.optimistic.locking.failure", "Another user has updated this Post while you were editing.")
                    render(view:'edit',model:[postInstance:postInstance])
                    return
                }
            }
            postInstance.properties = params
            if(!postInstance.hasErrors() && postInstance.save()) {
                flash.message = "Post ${params.id} updated"
                redirect(action:show,id:postInstance.id)
            }
            else {
                render(view:'edit',model:[postInstance:postInstance])
            }
        }
        else {
            flash.message = "Post not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def postInstance = new Post()
        postInstance.properties = params
        return ['postInstance':postInstance]
    }

    def save = {
        def postInstance = new Post(params)
        
        // Get current user
        def user = authenticateService.principal() 
        def username = user?.getUsername()
        def person = Person.findByUsername(username)
        postInstance.person = person
        
        def category = Category.findByName("For Sale")
        postInstance.category = category
        
        if(!postInstance.hasErrors() && postInstance.save()) {
            flash.message = "Post ${postInstance.id} created"
            redirect(action:show,id:postInstance.id)
        }
        else {
            render(view:'create',model:[postInstance:postInstance])
        }
    }
}
