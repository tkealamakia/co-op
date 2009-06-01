<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="mainPublic" />
</head>
<body>
<!--Beginning of code for the title bar-->
		<div class="titlebar">
			<div class="title">Create Account
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
				<g:form class="leftside" action="save">
					<p class="posttitle">Email Address</p>
					<input class="createpost" type="text" name='email' value="${person?.email?.encodeAsHTML()}"/>
					<p class="posttitle">First Name</p>
					<input class="createpost" type="text" name='firstName' value="${person?.firstName?.encodeAsHTML()}"/>
					<p class="posttitle">Last Name</p>
					<input class="createpost" type="text" name='lastName' value="${person?.lastName?.encodeAsHTML()}"/>
					<p class="posttitle">Password</p>
					<input class="createpost" type="password" name='passwd' value="${person?.passwd?.encodeAsHTML()}"/>
					<p class="posttitle">Confirm Password</p>
					<input class="createpost" type="password" name='repasswd' value="${person?.passwd?.encodeAsHTML()}"/>
					<p class="posttitle">Telephone Number &#40xxx-xxx-xxxx&#41</p>
					<input class="createpost" type="telephone" name='telephone' value="${person?.telephone?.encodeAsHTML()}"/>
					<p class="posttitle">Enter Code</p>
					<input class="createpost" type="text" name="captcha" size="8"/>
					<img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>
					
					<p class="posttitle">Ward</p>
					<p class="topmargin">East Mill Creek 6th Ward &nbsp; <a href="notyourward.html" class="blacklink">This is not my ward.</a></p>
					<input class="savenewpost" type="image" src="/wardcoop/images/createaccount.gif" /> 
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
