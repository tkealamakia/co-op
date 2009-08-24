package com.atomyk.wardcoop

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class InviteController {

    static allowedMethods = [sendInvites:'POST']

	def emailerService
	def authenticateService

    def index = { }

    def create = {}

    def sendInvites = {
		def config = authenticateService.securityConfig
        def invitees = params.invitees
        
        if (invitees != null && invitees.size() > 0) {
            def addresses = []
            def tok = new StringTokenizer(invitees)

            boolean inError = false
            while (tok.hasMoreTokens()) {
                def address = tok.nextToken()
                if (address ==~ /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}/) {
                    addresses += address
                }
                else {
                    inError = true
                }
            }

            if (inError) {
                flash.message = "At least one e-mail address is not properly formed."
                redirect (action: create)
                return
            }


            // Send an e-mail to the invitees
            if (config.security.useMail) {
                Person person = PersonHelper.getCurrentUser(authenticateService)
                String emailContent = """You have received an invitation from ${person.firstName} ${person.lastName} to the ${Constants.APP_NAME},
  a place where you can cooperate with others in the ${person.ward.name} group.

    Please follow this link to register:
    ${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/register/index?group=${person.ward.name.encodeAsURL()}

    """

                def email = [
                    to: addresses, // 'to' expects a List, NOT a single email address
                    subject: "Co-opCommunity.com invitation",
                    text: emailContent // 'text' is the email body
                ]
                emailerService.sendEmails([email])
                flash.message = "Your invites were sent."
                redirect (action: create)

            }
        }
        else {
            flash.message = "Your invite list is empty."
            redirect (action:create)
        }

    }
}
