<html>
    <head>
        <title><g:layoutTitle default="Co-opCommunity.com: Building Community Unity" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'wardcoop.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body>
		<div class="container">
			<!-- Beginning of the Header -->
			<div class="header">
				<div class="logo"><a href="${resource(dir:'/home')}"><img src="${resource(dir:'images',file:'logo2.gif')}" /></a>
				</div>
				<div class="logotextwardname">
					<div class="logotext"><a class="logotext" href="index.html"><tags:groupName/></a>
					</div>
					<div class="wardname">Community
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
                        <g:link class="white" controller="invite" action="create">Invite Someone</g:link>
					</div>
				</div>
			</div>
			<!-- End of the Header -->
			
	    	<tags:menuBar/>
	    	
	        <g:layoutBody />		
	        
            <!--Beginning of code for the advertising area on the right-->
            
			<div class="adsright">
                <a href="topad.html"><img class="topad" src="${resource(dir:'images', file:'bigad.gif')}" /></a>
                <!--<a href="sky160.html"><img class="leftad" src="${resource(dir:'images', file:'sky160.gif')}" /></a>
                <a href="sky120.html"><img class="rightad" src="${resource(dir:'images', file:'sky120.gif')}" /></a>-->
            </div>

			<div class="footer">
				<div class="copyright">
					Copyright Co-opCommunity.com 2009
				</div>
			</div>
			
        </div>
        
    </body>	
</html>