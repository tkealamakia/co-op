package com.atomyk.wardcoop

import imagetool.ImageTool

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class PostController {
    
    def authenticateService
	def emailerService
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save:'POST', update:'POST', search:'POST']

    def listByUser = {
        // Get current user
       def person = PersonHelper.getCurrentUser(authenticateService)

        params.max = Math.min( params.max ? params.max.toInteger() : 2,  100)
        def count = Post.countByPerson( person )
        def postList = Post.findAllByPerson(person, params)
        if (postList == null) {
            postList = new ArrayList()
        }
        
        [ postInstanceList: postList, postInstanceTotal: count ]
    }

    def list = {
        // Get current category
		def categoryId = params.id
		def category = Category.findById( categoryId )

        params.max = Math.min( params.max ? params.max.toInteger() : 2,  100 )

        def count = Post.countByCategory( category )
        def postList = Post.findAllByCategory( category, params )
        
        if ( postList == null ) {
            postList = new ArrayList()
        }

        [ postInstanceList: postList, postInstanceTotal: count,
		  category: category ]
    }

	def search = {
		def categoryId = params.id
		def category = Category.findById(categoryId)
		def searchStr = params.searchStr

        def postList = Post.withCriteria {
			eq('category', category)
			or {
				like("title", "%${searchStr}%")
				like("description", "%${searchStr}%")
			}
		}

        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		render(view:'list',model:[ postInstanceList: postList,
				postInstanceTotal: postList.count(), category: category ])
	}

    def show = {
        def postInstance = Post.get( params.id )

        // Disallow people outsite the group to view group posts
        def user = authenticateService.principal()
        def email = user?.getUsername()
        def person = Person.findByEmail(email)
        def userGroup = person.ward.name
        def postUserGroup = postInstance?.person?.ward?.name

        if(userGroup != postUserGroup) {
            flash.message = "You are not allowed to view this post"
            redirect(action:listByUser)
        }


        if(!postInstance) {
            flash.message = "Post not found "
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
        def postInstance = Post.get( params.id )

        //Only allow current user to delete their own posts
        def user = authenticateService.principal()
        def email = user?.getUsername()
        def person = Person.findByEmail(email)

        if(person.id != postInstance?.person?.id) {
            println "in here"
            flash.message = "You are not allowed to perform this operation"
            //TODO figure a better way to handle this.  For some reason
            // a redirect is still deleting the post!
            return
        }

        if(postInstance) {
            try {
                postInstance.delete(flush:true)
                flash.message = "Post deleted"
                redirect(action:listByUser)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Post could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Post not found with id ${params.id}"
            redirect(action:listByUser)
        }
    }
    
    //TODO only allow current user to delete their own images
    def deleteImage = {
        def imageInstance = Image.get( params.id )
        def post = imageInstance.post
        if(imageInstance) {
            try {
                imageInstance.delete(flush:true)
                flash.message = "Image deleted"
                redirect(action:edit, id:post.id)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Image could not be deleted"
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
            flash.message = "Post not found "
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
                    def imageTool = new ImageTool()
                    imageTool.load(imageMain.image)
                    imageTool.thumbnail(640)
                    imageMain.image = imageTool.getBytes("JPEG")
		            imageMain.save()
		        }
		        if (image2?.image?.length > 0) {
			        image2.post = postInstance
                    def imageTool = new ImageTool()
                    imageTool.load(image2.image)
                    imageTool.thumbnail(640)
                    image2.image = imageTool.getBytes("JPEG")
		            image2.save()
		        }
		        if (image3?.image?.length > 0) {
			        image3.post = postInstance
                    def imageTool = new ImageTool()
                    imageTool.load(image3.image)
                    imageTool.thumbnail(640)
                    image3.image = imageTool.getBytes("JPEG")
		            image3.save()
		        }
		            
                flash.message = "Your Post was updated"
                redirect(action:listByUser,id:postInstance.id)
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

                render(view:'edit',model:[postInstance:postInstance, imageList: imageArray])
            }
        }
        else {
            flash.message = "Post not found"
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
                def imageTool = new ImageTool()
                imageTool.load(imageMain.image)
                imageTool.thumbnail(640)
                imageMain.image = imageTool.getBytes("JPEG")
	            imageMain.save()
	        }
	        if (image2.image.length > 0) {
                image2.post = postInstance
                def imageTool = new ImageTool()
                imageTool.load(image2.image)
                imageTool.thumbnail(640)
                image2.image = imageTool.getBytes("JPEG")
                image2.save()
	        }
	        if (image3.image.length > 0) {
                image3.post = postInstance
                def imageTool = new ImageTool()
                imageTool.load(image3.image)
                imageTool.thumbnail(640)
                image3.image = imageTool.getBytes("JPEG")
                image3.save()
	        }
	            
            /*
            def peopleToNotify = category.people
            peopleToNotify.each() {
                sendEmail(it, category)
            }
            */

            flash.message = "Your post was successfully created"
            redirect(action:listByUser)
            
        }
        else {
            render(view:'create',model:[postInstance:postInstance])
        }
    }

    private sendEmail(person, category) {
		def config = authenticateService.securityConfig
        if (config.security.useMail) {
            String emailContent = """A '${category.name}' Co-op item has been posted:

${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}

"""

            def email = [
                to: [person.email], // 'to' expects a List, NOT a single email address
                subject: "[${request.contextPath}] Co-op item posted",
                text: emailContent // 'text' is the email body
            ]
            emailerService.sendEmails([email])
        }
    }


}
