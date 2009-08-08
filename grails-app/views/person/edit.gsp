<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
</head>
<body>
		<div class="titlebar">
				<div class="title">My Account
				</div>
                <!--
				<div class="emailpreferences">
					<g:link class="white" controller="emailPreference" action="edit">Email Preferences</g:link>
				</div>
                -->
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
                    <span class="value ${hasErrors(bean:person,field:'email','errors')}">
                        <input class="createpost" type="text" id="email" name="email" value="${person?.email?.encodeAsHTML()}"/>
                    </span>
					<p class="posttitle">First Name</p>
                    <span class="value ${hasErrors(bean:person,field:'firstName','errors')}">
                        <input class="createpost" type="text" id="firstName" name="firstName" value="${person.firstName?.encodeAsHTML()}"/>
                    </span>
					<p class="posttitle">Last Name</p>
                    <span class="value ${hasErrors(bean:person,field:'lastName','errors')}">
                        <input class="createpost" type="text" id="lastName" name="lastName" value="${person.lastName?.encodeAsHTML()}"/>
                    </span>
					<p class="posttitle">Group</p>
					<p class="notopmargin">${person?.ward?.name}&nbsp; <g:link controller="ward" action="list" class="blacklink">Change</g:link></p>
					<p class="posttitle">Password</p>
					<p class="notopmargin">***************&nbsp; <g:link action="editPassword" class="blacklink">Change</g:link></p>
					<div class="savecancelbuttons">
						<input class="savenewpost" type="image" src="${resource(dir:'images',file:'save.gif')}" />
						<a class="cancel" href="${resource(dir:'/home')}"><img src="${resource(dir:'images',file:'cancel.gif')}" alt="Cancel"/></a>
					</div>
				</g:form>
			</div>
            <!--
			<div class="rightside">
				<p class="asterisk"></p>
			</div>
            -->
		</div>

</body>
</html>
