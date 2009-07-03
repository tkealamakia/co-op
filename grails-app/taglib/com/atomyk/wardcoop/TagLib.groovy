package com.atomyk.wardcoop

import com.atomyk.wardcoop.Category

class TagLib {

    static namespace = "tags"
    def menuBar = { attrs ->
        out << "<div class='navigation'>"
        out << "<div class='navigationlinks'>"
        out << "<ul class='navigation'>"
        Category.findAll().each {
            out << "<li><a href='/wardcoop/post/list/${it.id}'>${it.name}</a></li>"
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

}