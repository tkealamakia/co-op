package com.atomyk.wardcoop

import com.atomyk.wardcoop.Category

class TagLib {

    static namespace = "tags"
    def menuBar = { attrs ->
        out << "<div class=\"navigation\">"
        out << "<div class=\"navigationlinks\">"
        out << "<ul class=\"navigation\">"
        Category.findAll().each {
            out << "<li><a href=\"/wardcoop/post/listByUser\">${it.name}</a></li>"
        }
        out << "</ul>"
        out << "</div>"
        out << "</div>"
    }
    
    def postChopper = { attrs ->
        out << attrs.value.substring(0, 125)
    }

}