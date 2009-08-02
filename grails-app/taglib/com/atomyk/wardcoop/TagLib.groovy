package com.atomyk.wardcoop

import com.atomyk.wardcoop.Category

class TagLib {

    def authenticateService

    static namespace = "tags"
    def menuBar = { attrs ->
        out << "<div class='navigation'>"
        out << "<div class='navigationlinks'>"
        out << "<ul class='navigation'>"
        Category.findAll().each {
            out << "<li><a href='/wardcoop/post/list/${it.id}?max=${Constants.MAX_PER_PAGE}'>${it.name}</a></li>"
//            out << "<li><a href='/wardcoop/post/list?categoryId=${it.id}'>${it.name}</a></li>"
        }
        out << "</ul>"
        out << "</div>"
        out << "</div>"
    }
    
    def postChopper = { attrs ->
        if (attrs.value.size() > 124) {
	        out << attrs.value.substring(0, 125)
        }
        else {
            out << attrs.value
        }
    }

    def groupName = { attrs ->
        def user = authenticateService.principal()
        def email = user?.getUsername()
        def person = Person.findByEmail(email)
        out << person.ward.name
    }

    def expired = { attrs ->
        if (new Date(attrs.value.getTime()) < new Date() - Constants.DAYS_FOR_POST_EXPIRE) {
            out << "(Expired)"
        }
    }

}