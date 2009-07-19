<html>
</head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="mainPublic" />
</head>
<body>
		<div class="titlebar">
				<div class="title">Password Re-set
				</div>
		</div>
		<div class="leftarea">
			<div class="wardsearch">
				<g:if test="${flash.message}">
                    <div class="message">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${person}">
                    <div class="errors">
                        <g:renderErrors bean="${person}" as="list" />
                    </div>
				</g:hasErrors>
				<div class="emailexplanation">To re-set your password, please enter a new password in the fields below.</div>
				<g:form class="leftside" action="updatePassword">
                    <input type="hidden" name="id" value="${person.id}"/>
					<p class="posttitle">New Password:</p>

					<div class="upload">
						<input class="createpost" type="password" name="passwd" />
					</div>
					<p class="posttitle">Re-type New Password:</p>
					<div class="upload">
						<input class="createpost" type="password" name="passwdConfirm" />
					</div>
					<div class="savecancelbuttons">

						<input class="savenewpost" type="image" src="${resource(dir:'images', file:'save.gif')}" />
					</div>
				</g:form>
			</div>
		</div>


</body>
</html>
