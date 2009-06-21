<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
</head>
<body>
<!--Beginning of code for the title bar-->
		<div class="titlebar">
				<div class="title">Create New Group
				</div>
		</div>
		<div class="leftarea">
			<div class="wardsearch">
                <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${wardInstance}">
                <div class="errors">
                    <g:renderErrors bean="${wardInstance}" as="list" />
                </div>
	            </g:hasErrors>
				<div class="emailexplanation">Enter the full name of your group in the box below. Make sure to be as acurate as possible so that others searching for your group can find it.</div>
				<g:form class="leftside" action="save" method="post">
					<input class="topcreatepost" type="text" name="wardsearch" value="Enter the full name of your group here." />

					<input type="image" class="wardsearch" src="${resource(dir:'images', file:'createward.gif')}" />
				</g:form>
			</div>
			<div class="createpost">
                    <p class="topmargin"><g:link class="cancel" controller="ward" action="list"><img src="${resource(dir:'images', file:'cancel.gif')}" /></g:link></p>
			</div>
		</div>


</body>
</html>
