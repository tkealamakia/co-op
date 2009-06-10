<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
</head>
<body>
<!--Beginning of code for the title bar-->
		<div class="titlebar">
				<div class="title">Edit Post</div>
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
				<g:form class="leftside" action="update" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${postInstance.id}"/>
					<input type="hidden" name="version" value="${postInstance.version}" />
					<p class="posttitle">Category*</p>
					<g:select class="toppad" name="category.id" from="${com.atomyk.wardcoop.Category.list()}"
						optionKey="id" optionValue="name" value="${postInstance?.category?.id}"/>
					<p class="posttitle">Title*</p>
                    <input class="createpost" type="text" id="title" name="title" value="${fieldValue(bean:postInstance,field:'title')}"/>
					<p class="posttitle"> Asking Price*</p>
                    <input class="createpost" type="text" id="price" name="price" value="${fieldValue(bean:postInstance,field:'price')}"/>
					<p class="posttitle">Description*</p>
                    <g:textArea class="createpost" id="description" name="description" value="${fieldValue(bean:postInstance,field:'description')}" rows="5" cols="40"/>
					<p class="posttitle">Contact Telephone Number* &#40xxx-xxx-xxxx&#41</p>
                    <input class="createpost" type="text" id="phone" name="phone" value="${fieldValue(bean:postInstance,field:'phone')}"/>
                    
	                <br><br>
	                
	            	<g:if test="${imageList[0] != null}">
		                <img class="postthumb" src="${createLink(controller:'image', action:'image', id:imageList[0].id)}"/>
						<p class="topmargin"><g:link class="brownlink" onclick="return confirm('Are you sure?');" action="deleteImage" id="${imageList[0].id}">Remove</g:link></p>
		                <br><br><br>
            		</g:if>
            		<g:else>
						<p class="posttitle">Upload Main Photo</p>
	                    <input type="file" id="image" name="imageMain.image" />
            		</g:else>
	            	<g:if test="${imageList[1] != null}">
		                <img class="postthumb" src="${createLink(controller:'image', action:'image', id:imageList[1].id)}"/>
						<p class="topmargin"><g:link class="brownlink" onclick="return confirm('Are you sure?');" action="deleteImage" id="${imageList[1].id}">Remove</g:link></p>
		                <br><br><br>
            		</g:if>
            		<g:else>
						<p class="posttitle">Upload Additional Photo</p>
	                    <input type="file" id="image" name="image2.image" />
            		</g:else>
	            	<g:if test="${imageList[2] != null}">
		                <img class="postthumb" src="${createLink(controller:'image', action:'image', id:imageList[2].id)}"/>
						<p class="topmargin"><g:link class="brownlink" onclick="return confirm('Are you sure?');" action="deleteImage" id="${imageList[2].id}">Remove</g:link></p>
		                <br><br><br>
            		</g:if>
            		<g:else>
						<p class="posttitle">Upload Additional Photo</p>
	                    <input type="file" id="image" name="image3.image" />
            		</g:else>
                     
                    <br>
					<input class="savenewpost" type="image" src="/wardcoop/images/save.gif" /> 
					<g:link class="cancel" action="listByUser"><img src="/wardcoop/images/cancel.gif" /></g:link>
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
