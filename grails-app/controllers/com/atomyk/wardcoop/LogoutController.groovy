package com.atomyk.wardcoop

/**
 * Logout Controller (Example).
 */
import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class LogoutController {

	/**
	 * Index action. Redirects to the Spring security logout uri.
	 */
	def index = {
		// TODO  put any pre-logout code here
		redirect(uri: '/j_spring_security_logout')
	}
}
