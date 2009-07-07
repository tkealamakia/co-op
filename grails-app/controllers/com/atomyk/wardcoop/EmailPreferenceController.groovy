package com.atomyk.wardcoop

class EmailPreferenceController {

    def authenticateService

    def index = { }

    def edit = {
        // Get current user
        def user = authenticateService.principal()
        def email = user?.getUsername()
        def person = Person.findByEmail(email)

        def categoryList = Category.findAll()
        [ categoryList: categoryList ]
    }

    def save = {

        def categoryList = Category.findAll()

        /*
        params.each() {
            def param = it
            categoryList.each() { 

            }
        }
        */

    }
}
