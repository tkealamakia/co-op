<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Co-opCommunity.com: Building Community Unity</title>
<link rel="stylesheet" href="${resource(dir:'css',file:'wardcoop.css')}" />
</head>
<body>
<!--Header Begins Here-->
	<div class="container">
		<div class="header">
            <div class="logo"><a href="${resource(dir:'')}"><img src="${resource(dir:'images',file:'logo2.gif')}" /></a>
			</div>
			<div class="logotextwardname">
				<div class="logotext"><a class="logotext" href="index.html">Co-opCommunity.com</a>
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
						<div class="forgot"><g:link class="white" controller="forgotPassword" >Forgot?</g:link>
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

		<div class="leftareahome">
			<g:if test='${flash.message}'>
                <div class='login_message'>${flash.message}</div>
			</g:if>
            <h1 class="top">Free, Private, Community Co-ops</h1>
				<p class="hometext">Turn your community or group into a thriving community with Co-opCommunity.com. Your community co-op will give the members of your community the perfect way to inform everyone of opportunities that might otherwise go unkonwn. Here are some of the things you might post for everyone in your community to see:</p>
				<ul>
					<li>Free Stuff</li>
					<li>For Sale</li>
					<li>For Rent</li>
					<li>For Trade</li>
					<li>Items Wanted</li>
					<li>Services</li>
					<li>Jobs / Hiring</li>
					<li>Share Resources</li>
					<li>Events</li>
				</ul>
				<h1>Who is Co-opCommunity.com for?</h1>
				<p class="hometext">Co-opCommunity.com can help any community or group take interaction to a new level. Here are a few examples of groups that can benefit from a community co-op:</p>
				<ul>
					<li>Neighborhoods</li>
					<li>Planned Communities</li>
					<li>Church Groups</li>
					<li>Clubs</li>
					<li>Companies</li>
					<li>Any Other Group</li>
				</ul>
				<h1>Can I create a Community Co-op?</h1>
				<p class="hometext">Once you have been invited by a member of a co-op, you can either join an existing co-op or create a new one. Simply    
follow the link in your invitation email and create a new group. If you have not been invited to Co-opCommunity.com and you
would like to create a co-op, just email request@co-opCommunity.com.</p>
		</div>
		<div class="adsright">
                <div class="hometitleright"><div class="hometitlerighttext">Helping Communities Thrive</div></div>
				<img class="topad" src="${resource(dir:'images', file:'hometiles.gif')}" />
				</div>

		<div class="footer">
			<div class="copyright">
			Copyright Co-opCommunity.com 2009
			</div>
		</div>
	</div>

</body>
</html>
