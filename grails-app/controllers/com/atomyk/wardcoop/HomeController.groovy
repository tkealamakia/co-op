package com.atomyk.wardcoop

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class HomeController {

    def index = { }
}
