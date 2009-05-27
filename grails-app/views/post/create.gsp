<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
</head>
<body>
<!--Beginning of code for the title bar-->
		<div class="titlebar">
				<div class="title">Create New Post</div>
		</div>
		<div class="leftarea">
			<div class="createpost">
	            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
	            </g:if>
	            <g:hasErrors bean="${postInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${postInstance}" as="list" />
	            </div>
	            </g:hasErrors>
				<g:form class="leftside" action="save" method="post">
					<p class="posttitle">Category*</p>
					<select class="toppad" name="posttype">
					<option value="freestuff">Free Stuff</option>
					<option value="forsale">For Sale</option>
					<option value="forrent">For Rent</option>
					<option value="trade">Trade</option>
					<option value="forhire">For Hire</option>
					<option value="jobshiring">Jobs / Hiring</option>
					<option value="forborrow">For Borrow</option>
					<option value="itemswanted">Items Wanted</option>
					<option value="helprequest">Help Request</option>
					<option value="events">Events</option>
					</select>
					<p class="posttitle">Title*</p>
                    <input class="createpost" type="text" id="title" name="title" value="${fieldValue(bean:postInstance,field:'title')}"/>
					<p class="posttitle"> Asking Price*</p>
                    <input class="createpost" type="text" id="price" name="price" value="${fieldValue(bean:postInstance,field:'price')}"/>
					<p class="posttitle">Description*</p>
                    <g:textArea class="createpost" id="description" name="description" value="${fieldValue(bean:postInstance,field:'description')}" rows="5" cols="40"/>
					<p class="posttitle">Contact Telephone Number* &#40xxx-xxx-xxxx&#41</p>
                    <input class="createpost" type="text" id="phone" name="phone" value="${fieldValue(bean:postInstance,field:'phone')}"/>
					<p class="posttitle">Upload Main Photo &nbsp; <a class="blacklink" href="browse.html">Browse</a></p>
					<p class="topmargin">potsandpans.jpg &nbsp; <a href="remove.html" class="blacklink">Remove</a></p>
					<p class="topmargin"><a class="blacklink" href="addphoto.html">Add Another Photo</a></p>
					<input class="savenewpost" type="image" src="../images/save.gif" /> 
					<a class="cancel" href="cancel.html"><img src="../images/cancel.gif" /></a>
				</g:form>
			</div>
			<div class="rightside">
				<p class="asterisk">Fields marked with * are required.</p>
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

</body>
</html>
