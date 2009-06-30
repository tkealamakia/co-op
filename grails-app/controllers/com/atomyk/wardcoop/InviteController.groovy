package com.atomyk.wardcoop

class InviteController {

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

            while (tok.hasMoreTokens()) {
                addresses += tok.nextToken()
            }


            // Send an e-mail to the invitees
            if (config.security.useMail) {
                String emailContent = """You have received an invitation to co-op.

    Please follow this link to register
    ${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}/register/index

    """

                def email = [
                    to: addresses, // 'to' expects a List, NOT a single email address
                    subject: "Co-op invitation",
                    text: emailContent // 'text' is the email body
                ]
                emailerService.sendEmails([email])
                flash.message = "Your invites were sent."
                redirect (action: "create")

            }
        }
        else {
            flash.message = "Your invite list is empty."
            redirect (action:"create")
        }

    }
}
