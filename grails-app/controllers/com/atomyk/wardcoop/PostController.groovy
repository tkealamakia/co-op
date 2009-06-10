package com.atomyk.wardcoop

class PostController {
    
    
    def authenticateService
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save:'POST', update:'POST']
    //static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ postInstanceList: Post.list( params ), postInstanceTotal: Post.count() ]
    }
    def listByUser = {
        // Get current user
        def user = authenticateService.principal() 
        def email = user?.getUsername()
        def person = Person.findByEmail(email)
        
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
        else { 
            
            def imageList = postInstance.images.toArray().sort { it.type }.reverse()
            def imageArray = [null, null, null]
            imageList.each {
                if (it.type == 'imageMain') {
                    imageArray[0] = it
                }
                else if (it.type == 'image2') {
                    imageArray[1] = it
                }
                else if (it.type == 'image3') {
                    imageArray[2] = it
                }
            }
            return [ postInstance : postInstance , imageList : imageArray] 
        }
    }

    def delete = {
        //TODO only allow current user to delete their own posts
        def postInstance = Post.get( params.id )
        if(postInstance) {
            try {
                postInstance.delete(flush:true)
                flash.message = "Post ${params.id} deleted"
                redirect(action:listByUser)
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
    
    def deleteImage = {
        def imageInstance = Image.get( params.id )
        def post = imageInstance.post
        if(imageInstance) {
            try {
                imageInstance.delete(flush:true)
                flash.message = "Image ${params.id} deleted"
                redirect(action:edit, id:post.id)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Image ${params.id} could not be deleted"
                redirect(action:edit,id:post.id)
            }
        }
        else {
            flash.message = "Image not found with id ${params.id}"
            redirect(action:edit, id:post.id)
        }
        
    }

    def edit = {
        def postInstance = Post.get( params.id )

        if(!postInstance) {
            flash.message = "Post not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            def imageList = postInstance.images.toArray().sort { it.type }.reverse()
            def imageArray = [null, null, null]
            imageList.each {
                if (it.type == 'imageMain') {
                    imageArray[0] = it
                }
                else if (it.type == 'image2') {
                    imageArray[1] = it
                }
                else if (it.type == 'image3') {
                    imageArray[2] = it
                }
            }
            
            //def imageList = postInstance.images.toArray()
            return [ postInstance : postInstance , imageList : imageArray]
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
	            
		        def imageMain = new Image(params["imageMain"])
		        imageMain.type = "imageMain"
		        def image2 = new Image(params["image2"])
		        image2.type = "image2"
		        def image3 = new Image(params["image3"])
		        image3.type = "image3"
		        if (imageMain?.image?.length > 0) {
			        imageMain.post = postInstance
		            imageMain.save()
		        }
		        if (image2?.image?.length > 0) {
			        image2.post = postInstance
		            image2.save()
		        }
		        if (image3?.image?.length > 0) {
			        image3.post = postInstance
		            image3.save()
		        }
		            
                flash.message = "Post ${params.id} updated"
                redirect(action:listByUser,id:postInstance.id)
            }
            else {
                render(view:'edit',model:[postInstance:postInstance])
            }
        }
        else {
            flash.message = "Post not found with id ${params.id}"
            redirect(action:listByUser)
        }
    }

    def create = {
        def postInstance = new Post()
        postInstance.properties = params
        return ['postInstance':postInstance]
    }

    def save = {
        def postInstance = new Post(params)
        postInstance.postDate = new Date()
        
        // Get current user
        def user = authenticateService.principal() 
        def email = user?.getUsername()
        def person = Person.findByEmail(email)
        postInstance.person = person
        
        def category = Category.findById(params.category.id)
        postInstance.category = category
        
        if(!postInstance.hasErrors() && postInstance.save()) {
            
	        def imageMain = new Image(params["imageMain"])
	        imageMain.type = "imageMain"
	        def image2 = new Image(params["image2"])
	        image2.type = "image2"
	        def image3 = new Image(params["image3"])
	        image3.type = "image3"
	        if (imageMain.image.length > 0) {
		        imageMain.post = postInstance
	            imageMain.save()
	        }
	        if (image2.image.length > 0) {
			        image2.post = postInstance
		            image2.save()
	        }
	        if (image3.image.length > 0) {
			        image3.post = postInstance
		            image3.save()
	        }
	            
            flash.message = "Post ${postInstance.id} created"
            redirect(action:listByUser)
            
        }
        else {
            render(view:'create',model:[postInstance:postInstance])
        }
    }
}
