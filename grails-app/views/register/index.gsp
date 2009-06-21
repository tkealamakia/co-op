<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="mainPublic" />
</head>
<body>
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
					<p class="posttitle">Email Address*</p>
                    <input class="createpost" type="text" name='email' value="${person?.email?.encodeAsHTML()}"/>
					<p class="posttitle">First Name*</p>
                    <input class="createpost" type="text" name='firstName' value="${person?.firstName?.encodeAsHTML()}"/>
					<p class="posttitle">Last Name*</p>
                    <input class="createpost" type="text" name='lastName' value="${person?.lastName?.encodeAsHTML()}"/>
					<p class="posttitle">Password*</p>
                    <input class="createpost" type="password" name='passwd' value="${person?.passwd?.encodeAsHTML()}"/>
					<p class="posttitle">Confirm Password*</p>
                    <input class="createpost" type="password" name='repasswd' value="${person?.passwd?.encodeAsHTML()}"/>
					<p class="posttitle">Telephone Number &#40xxx-xxx-xxxx&#41</p>
                    <input class="createpost" type="telephone" name='telephone' value="${person?.telephone?.encodeAsHTML()}"/>
					<p class="posttitle">Enter Code Below*</p>
                    <input class="createpost" type="text" name="captcha" size="8"/>
					<img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>
					
                    <!--
					<p class="posttitle">Group</p>
					<p class="notopmargin">My Coop Group Name &nbsp; <a href="notyourward.html" class="blacklink">This is not my group.</a></p>
                    -->
					<div class="savecancelbuttons">
						<input class="savenewpost" type="image" src="${resource(dir:'images', file:'createaccount.gif')}" />
					</div>
				</g:form>
			</div>
			<div class="rightside">
				<p class="asterisk">Fields marked with * are required.</p>
			</div>
		</div>

</body>
</html>
