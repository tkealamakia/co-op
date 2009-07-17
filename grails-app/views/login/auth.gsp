<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Co-op.com: Building Community Unity</title>
<link rel="stylesheet" href="${resource(dir:'css',file:'wardcoop.css')}" />
</head>
<body>
<!--Header Begins Here-->
	<div class="container">
		<div class="header">
            <div class="logo"><a href="${resource(dir:'')}"><img src="${resource(dir:'images',file:'logo2.gif')}" /></a>
			</div>
			<div class="logotextwardname">
				<div class="logotext"><a class="logotext" href="index.html">Co-op.com</a>
				</div>
			</div>
			<div class="linkbox">
				<div class="byinvitation">By Invitation Only
				</div>
				<div class="logintext">
					<p class="logintext1">Email Address:</p>
					<p class="logintext2">Password:</p>
				</div>
				<div class="loginfields">
					<form class="leftside" action='${postUrl}' method='POST' id='loginForm' class='cssform'>
					<input class="loginfield" type='text' class='text_' name='j_username' id='j_username' value='${request.remoteUser}' />
					<br />
					<input class="loginfield" type='password' class='text_' name='j_password' id='j_password' />
					<br />
					<div class="loginlinks">
						<div class="loginbutton"><input type="image" class="loginbutton" src="${resource(dir:'images', file:'login.gif')}" />
						</div>
						<div class="forgot"><g:link class="white" controller="forgotPassword" action="editForgotPassword">Forgot?</g:link>
						</div>
					</div>
					</form>
				</div>				
			</div>
		</div>
		<div class="navigation">
		</div>
<!--This is where the header ends-->
<!--Beginning of code for the title bar-->
		<div class="titlebar">
		</div>

		<div class="leftarea">
			<g:if test='${flash.message}'>
                <div class='login_message'>${flash.message}</div>
			</g:if>
            <p class="emailexplanation">I see this as the home page for the site, so it should be full of informative, interactive, convincing stuff. Since creating that promotional content will take some time and shoud not requre back-end development, I figured I'd put this text here for a place holder for the fun things to come.</p>
		</div>

		<div class="footer">
			<div class="copyright">
			Copyright Co-op.com 2009
			</div>
		</div>
	</div>

</body>
</html>
