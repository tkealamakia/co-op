<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="mainPublic" />
</head>
<body>
<!--Beginning of code for the title bar-->
		<div class="titlebar">
		</div>
		<div class="leftarea">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <p class="emailexplanation">Welcome, please <g:link controller="home">login</g:link></p>
		</div>


</body>
</html>
