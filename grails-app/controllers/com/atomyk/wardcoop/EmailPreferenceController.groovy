package com.atomyk.wardcoop

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class EmailPreferenceController {

	static Map allowedMethods = [save: 'POST']

    def authenticateService

    def index = { }

    def edit = {
        def person = PersonHelper.getCurrentUser(authenticateService)

        def categoryList = Category.findAll()
        [ categoryList: categoryList, categorySelectedList: person.categories]
    }

    def save = {

        def categoryList = Category.findAll()
        def person = PersonHelper.getCurrentUser(authenticateService)

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
