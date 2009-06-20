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
					<input type="image" class="wardsearch" src="../images/search.gif" />
				</g:form>
					<p class="searchresults">Search Results:</p>
                    <g:each in="${wardInstanceList}" status="i" var="wardInstance">
						<p class="topmargin">${fieldValue(bean:wardInstance, field:'name')}&nbsp;&nbsp;<g:link controller="person" action="edit" id="${wardInstance.id}" class="blacklink">Select</g:link></p>
                    </g:each>
			</div>
			<div class="createpost">
					<p class="topmargin">Can't find your Group?</p>
					<div class="savecancelbuttons">
						<p class="topmargin"><g:link action="create"><img src="../images/createward.gif" /></g:link></p>
						<p class="topmargin"><g:link controller="person" action="edit"><img src="../images/cancel.gif" /></g:link></p>
					</div>
			</div>
		</div>
<!--Beginning of code for the advertising area on the right-->

		<div class="adsright">
		<a href="topad.html"><img class="topad" src="/wardcoop/images/bigad.gif" /></a>
		<a href="sky160.html"><img class="leftad" src="/wardcoop/images/sky160.gif" /></a>
		<a href="sky120.html"><img class="rightad" src="/wardcoop/images/sky120.gif" /></a>
		</div>

	</div>

</body>
</html>
