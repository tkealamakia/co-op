package com.atomyk.wardcoop

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class EmailPreferenceController {

    def authenticateService

    def index = { }

    def edit = {
        // Get current user
        def user = authenticateService.principal()
        def email = user?.getUsername()
        def person = Person.findByEmail(email)

        def categoryList = Category.findAll()
        [ categoryList: categoryList, categorySelectedList: person.categories]
    }

    def save = {

        def categoryList = Category.findAll()

        // Get current user
        def user = authenticateService.principal()
        def email = user?.getUsername()
        def person = Person.findByEmail(email)

        categoryList.each() { 
            if (request.getParameter(it.name) == 'on') {
                person.categories.add(it)
            }
            else {
                person.categories.remove(it)
            }
        }
        flash.message = "E-mail Preferences successfully updated."
        redirect(controller:"person", action:"edit")
    }

}
