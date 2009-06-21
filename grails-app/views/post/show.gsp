<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
</head>
<body>
		<div class="titlebar">
			<div class="title">Post Details
			</div>
		</div>
        <!--Beginning of code for the title bar-->
		<div class="leftarea">
			<div class="postpics">
				<div class="bigpicture">
	                <img class="largepic" src="${createLink(controller:'image', action:'image', id:imageList[0]?.id)}"/>
				</div>
				<div class="leftsmallpic">
	                <img class="smallpic" src="${createLink(controller:'image', action:'image', id:imageList[1]?.id)}"/>
				</div>
				<div class="rightsmallpic">
	                <img class="smallpic" src="${createLink(controller:'image', action:'image', id:imageList[2]?.id)}"/>
				</div>
				<div class="dateposted">
					${fieldValue(bean:postInstance, field:'postDate')}
				</div>
			</div>
			
			<div class="postcontent">
				<a class="backbutton" href="back.html"><img src="${resource(dir:'images', file:'back.gif')}" /></a>
				<div class="posttitle">
					${fieldValue(bean:postInstance, field:'title')}
				</div>
				<div class="postprice">
					${fieldValue(bean:postInstance, field:'price')}
				</div>
				<div class="postdescription">
					${fieldValue(bean:postInstance, field:'description')}
				</div>
				<div class="contact">Contact:
				</div>
				<div class="contactname">
					${fieldValue(bean:postInstance.person, field:'firstName')}
					${fieldValue(bean:postInstance.person, field:'lastName')}
				</div>
				<div class="contactphone">
					${fieldValue(bean:postInstance, field:'phone')}
				</div>
				<div class="contactemail">
					${fieldValue(bean:postInstance.person, field:'email')}
				</div>
				<div class="flaglinks">
					<div class="backbutton"><a href="flag.html"><img src="${resource(dir:'images', file:'flag.gif')}" /></a>
					</div>
					<div class="flagexplain">
					<a class="brownlink" href="flagexplain.html">What's this for?</a>
					</div>
				</div>
			</div>
		</div>

</body>
</html>
