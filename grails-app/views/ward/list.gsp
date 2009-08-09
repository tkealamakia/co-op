<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
</head>
<body>
<!--Beginning of code for the title bar-->
		<div class="titlebar">
				<div class="title">Group Search</div>
		</div>
		<div class="leftarea">
			<div class="wardsearch">
				<g:form class="leftside" action="list">
					<input class="topcreatepost" type="text" name="wardsearch" />
					<input type="image" class="wardsearch" src="${resource(dir:'images', file:'search.gif')}" />
				</g:form>
					<p class="searchresults">Search Results:</p>
                    <g:each in="${wardInstanceList}" status="i" var="wardInstance">
						<p class="topmargin">${fieldValue(bean:wardInstance, field:'name')}&nbsp;&nbsp;<g:link onclick="return confirm('Are you sure?  All of your posts with the former group will be deleted.');" controller="person" action="edit" id="${wardInstance.id}" class="blacklink">Select</g:link></p>
                    </g:each>
			</div>
			<div class="createpost">
					<p class="topmargin">Can't find your Group?</p>
					<div class="savecancelbuttons">
						<p class="topmargin"><g:link action="create"><img src="${resource(dir:'images', file:'createward.gif')}" /></g:link></p>
						<p class="topmargin"><g:link controller="person" action="edit"><img src="${resource(dir:'images', file:'cancel.gif')}" /></g:link></p>
					</div>
			</div>
		</div>


</body>
</html>
