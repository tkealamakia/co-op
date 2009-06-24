package com.atomyk.wardcoop

class ForgotPasswordController {

	/**
	 * Dependency injection for the authentication service.
	 */
	def authenticateService
	def emailerService


	static Map allowedMethods = [updatePassword: 'POST']


    def editForgotPassword = {}

    def sendForgotPassword = {
		def config = authenticateService.securityConfig
        // Verify the user e-mail exists
        def person = Person.findByEmail(params.email)
        if (person != null) {
            // Generate a token and update the user with that
            def token = "1234567fixme"
            person.passwordResetToken = token
            person.save()
            // Send an e-mail with the proper link
            if (config.security.useMail) {
                String emailContent = """You have requested a password change for

 The co-op application. Please follow this link to complete the process:
 ${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/forgotPassword/editPassword?token=${token}

"""

				def email = [
					to: [person.email], // 'to' expects a List, NOT a single email address
					subject: "[${request.contextPath}] Forgot Password",
					text: emailContent // 'text' is the email body
				]
				emailerService.sendEmails([email])
			}
            redirect (uri: '/')
        }
        else {
            flash.message = "Please provide your account e-mail address"
            redirect (action: "editForgotPassword")
        }

    }
    def editPassword = {
        //Accept url from e-mail link
        def token = "1234567fixme"
        def person = Person.findByPasswordResetToken(token)
        if (person != null) {
            person.passwordResetToken = null
            person.save()
            return [person: person]
        }
        else {
            redirect (uri: "/")
        }

    }

    def updatePassword = {
		def person = Person.get(params.id)

        if (params.passwd != params.passwdConfirm) {
            flash.message = "Passwords do not match"
            redirect action: editPassword
            return
        }
		else if (params.passwd.length() < 6) {
			flash.message = 'The password you entered must be at least 6 characters.'
            redirect action: editPassword
            return
		}
        else {
			person.passwd = authenticateService.encodePassword(params.passwd)
            if (!person.hasErrors() && person.save()) {
                flash.message = "Password updated."
                redirect (uri: '/')
                return
            }
            else {
                flash.message = "Unable to update your password"
                redirect (uri: '/')
                return
            }
        }
    }

}
