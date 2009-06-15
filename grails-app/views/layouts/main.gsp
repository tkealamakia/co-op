<html>
    <head>
        <title><g:layoutTitle default="WardCoOp.com - Building ward unity, one WOP at a time." /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'wardcoop.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body>
		<div class="container">
			<!-- Beginning of the Header -->
			<div class="header">
				<div class="logo"><a href="/wardcoop"><img src="/wardcoop/images/logo.gif" /></a>
				</div>
				<div class="logotextwardname">
					<div class="logotext"><a class="logotext" href="index.html">WardCoOp.com</a>
					</div>
					<div class="wardname">East Mill Creek 7th Ward
					</div>
				</div>
				<div class="linkbox">
					<div class="toplinksleft">
						<g:link class="white" controller="post" action="create">Create New Post</g:link><br />
						<g:link class="white" controller="person" action="edit">My Account</g:link><br />
						<g:link class="white" controller="post" action="listByUser">My Posts</g:link><br />
						<g:link class="white" controller="logout">Sign Out</g:link>
					</div>
					<div class="toplinksright">
						<div class="byinvitationonly">By Invitation Only</div>
						<a href="invite.html">Invite Someone</a>
					</div>
				</div>
			</div>
			<!-- End of the Header -->
			
	    	<tags:menuBar/>
	    	
	        <g:layoutBody />		
	        
			<div class="footer">
				<div class="copyright">
					Copyright WardCoOp.com 2009
				</div>
			</div>
			
        </div>
        
    </body>	
</html>