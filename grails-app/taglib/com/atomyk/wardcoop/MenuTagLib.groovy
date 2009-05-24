package com.atomyk.wardcoop

import com.atomyk.wardcoop.Category

class MenuTagLib {

    static namespace = "menu"
    def menuBar = { attrs ->
        out << "<div class=\"nav\">"
        out << "<span class=\"menuButton\"><a href=\"${resource(dir:'')}\" class=\"home\" >Home</a></span>"
        Category.findAll().each {
            out << "<span class=\"menuButton\"><a href=\"/wardcoop/post/list\" class=\"list\" >${it.name}</a></span>"
        }
        out << "</div>"
    }

}