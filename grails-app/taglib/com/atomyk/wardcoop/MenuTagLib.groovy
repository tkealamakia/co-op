package com.atomyk.wardcoop

import com.atomyk.wardcoop.Category

class MenuTagLib {

    static namespace = "menu"
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

}