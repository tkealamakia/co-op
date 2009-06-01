<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
</head>
<body>
<!--Beginning of code for the title bar-->
		<div class="titlebar">
				<div class="title">My Account
				</div>
				<div class="emailpreferences">
					<a class="white" href="emailalerts.html">Email Preferences</a>
				</div>
			</div>
		<div class="leftarea">
			<div class="createpost">
				<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${person}">
				<div class="errors">
					<g:renderErrors bean="${person}" as="list" />
				</div>
				</g:hasErrors>
				<g:form class="leftside" action="update">
					<input type="hidden" name="id" value="${person.id}" />
					<input type="hidden" name="version" value="${person.version}" />
					<p class="posttitle">Email Address</p>
					<input class="createpost" type="text" id="email" name="email" value="${person?.email?.encodeAsHTML()}"/>
					<p class="posttitle">First Name</p>
					<input class="createpost" type="text" id="firstName" name="firstName" value="${person.firstName?.encodeAsHTML()}"/>
					<p class="posttitle">Last Name</p>
					<input class="createpost" type="text" id="lastName" name="lastName" value="${person.lastName?.encodeAsHTML()}"/>
					<p class="posttitle">Telephone Number &#40xxx-xxx-xxxx&#41</p>
					<input class="createpost" type="telephone" name='telephone' value="${person?.telephone?.encodeAsHTML()}"/>
					<p class="posttitle">Ward</p>
					<p class="topmargin">${person?.ward?.name}&nbsp; <g:link controller="ward" action="list" class="blacklink">Change</g:link></p>
					<input class="savenewpost" type="image" src="/wardcoop/images/save.gif" /> 
					<a class="cancel" href="/wardcoop"><img src="/wardcoop/images/cancel.gif" /></a>
				</g:form>
			</div>
		</div>
<!--Beginning of code for the advertising area on the right-->
<!--
		<div class="adsright">
		<a href="topad.html"><img class="topad" src="images/bigad.gif" /></a>
		<a href="sky160.html"><img class="leftad" src="images/sky160.gif" /></a>
		<a href="sky120.html"><img class="rightad" src="images/sky120.gif" /></a>
		</div>
-->
	</div>

</body>
</html>
