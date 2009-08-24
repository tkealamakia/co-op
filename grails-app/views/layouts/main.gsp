<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
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
					<div class="logotext"><a class="logotext" href="${resource(dir:'/home')}"><tags:groupName/></a>
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
                        <!--
                        <div class="byinvitationonly">&nbsp;</div>
						<div class="byinvitationonly"><tags:userName/></div>
                        -->
					</div>
				</div>
			</div>
			<!-- End of the Header -->
			
	    	<tags:menuBar/>
	    	
	        <g:layoutBody />		
	        
            <!--Beginning of code for the advertising area on the right-->
            
			<div class="adsright">
		<div class="hometitleright"><div class="hometitlerighttext">Post Ideas - Get creative!</div></div>
		<div class="adstext">
		<div class="adstextbold">Free Stuff</div>
		<p class="adstext">Do you have extra fruit or vegetables on your plants? Here's an idea: "Come pick em' and you can have em'!"</p>
		</div>
		<div class="adstext">
		<div class="adstextbold">For Sale</div>
		<p class="adstext">From cars to crafts and baked goods, everything goes here.</p>
		</div>
		<div class="adstext">
		<div class="adstextbold">For Rent</div>
		<p class="adstext">
		<ul class="right">
					<li>Homes</li>
					<li>Apartments</li>
					<li>Canoes...</li>
				</ul>
		</p>
		</div>
		<div class="adstext">
		<div class="adstextbold">For Trade</div>
		<p class="adstext">My teenager for your dog... Just kidding. Here are some ideas:
		<ul class="right">
					<li>Trade dentristry for plumbing or painting.</li>
					<li>Baby sitting</li>
					<li>Vacation retreats... "We have a cabin in park city. We'll trade to stay in your vacation spot."</li>
				</ul>
		</p>
		</div>
		<div class="adstext">
		<div class="adstextbold">Items Wanted</div>
		<p class="adstext">Before you buy new, you might as well check to see if anyone has it and is willing to let it go.</p>
		</div>
		<div class="adstext">
		<div class="adstextbold">Services</div>
		<p class="adstext">Whether you're a bonafied professional or you're just looking for odd jobs, this is the place to let people know. Here are a few ideas to get you thinking.
		<ul class="right">
					<li>Lawn Care</li>
					<li>Photography</li>
					<li>Hair Cuts</li>
					<li>Graphic Design</li>
					<li>Plumbing</li>
					<li>Accounting</li>
				</ul>
		</p>
		
		</div>
		<div class="adstext">
		<div class="adstextbold">Jobs / Hiring</div>
		<p class="adstext">Do you know of a job opening that someone might be interested in? Are you hiring? Do you need a painter, plumber, lawn care provider or relator? Before you turn to the Yellow Pages, post it here. Chances are someone in your co-op will do just as good of a job at a fraction of the price.  </p>
		</div>
		<div class="adstext">
		<div class="adstextbold">Share Resources</div>
		<p class="adstext">This is the place for unique resources you have that might be useful to other people in your co-op. Here are a few thought starters:
		<ul class="right">
					<li>Jack Hammer</li>
					<li>Aerator</li>
					<li>Chainsaw</li>
				</ul>
		</p>
		</div>
		<div class="adstext">
		<div class="adstextbold">Events</div>
		<p class="adstext">  
		<ul class="right">
					<li>Neighborhood Parties</li>
					<li>BBQs</li>
					<li>Weddings</li>
					<li>Funerals</li>
				</ul>
		</p>
		</div>
		</div>

			<div class="footer">
				<div class="copyright">
					Copyright Co-opCommunity.com 2009
				</div>
			</div>
			
        </div>
       <script type="text/javascript">
            var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
            try {
                var pageTracker = _gat._getTracker("UA-10354379-1");
                pageTracker._trackPageview();
            }
            catch(err) {}
        </script>
    </body>	
</html>