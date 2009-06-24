<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="mainPublic" />
</head>
<body>
		<div class="titlebar">
				<div class="title">Password Retrieval
				</div>
		</div>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
		<div class="leftarea">
			<div class="wardsearch">
				<div class="emailexplanation">To re-set your password, enter your email address in the field below. An email will be sent to you with instructions for re-setting your password.</div>
				<g:form class="leftside" action="sendForgotPassword">
					<input class="topcreatepost" type="text" name="email" value="Enter your email address here." />
					<input type="image" class="wardsearch" src="${resource(dir:'images',file:'send.gif')}" />
				</g:form>
			</div>
			<div class="createpost">
					<p class="topmargin"><a href="${resource(dir:'')}"><img src="${resource(dir: 'images', file:'cancel.gif')}" /></a></p>
			</div>
		</div>

</body>
</html>