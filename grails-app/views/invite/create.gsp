<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
</head>
<body>
		<div class="titlebar">
				<div class="title">Invitations
				</div>
		</div>
		<div class="leftarea">
	            <g:if test="${flash.message}">
                    <div class="message">${flash.message}</div>
	            </g:if>
				<g:form class="leftside" action="sendInvites">
					<div class="emailexplanation">Enter the email addresses of the people you would like to invite in the box below. Each address needs to be seperated by a space. Invitees will receive an email allowing them to join.
					</div>
					<p class="posttitle">Email Addresses of Invitees</p>
					<textarea class="emailaddress" name="invitees"></textarea>
					<div class="savecancelbuttons">
						<input class="savenewpost" type="image" src="${resource(dir:'images',file:'send.gif')}" />
						<g:link class="cancel" controller="home"><img src="${resource(dir:'images',file:'cancel.gif')}" /></g:link>
					</div>
				</g:form>

		</div>

</body>
</html>