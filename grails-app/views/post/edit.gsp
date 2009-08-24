<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <script language="javascript">
        function showSaveProgress() {
            var ele = document.getElementById("saveProgress");
            if(ele.style.display == "block") {
                ele.style.display = "none";
                text.innerHTML = "show";
            }
            else {
                ele.style.display = "block";
                text.innerHTML = "hide";
            }
        }
    </script>
</head>
<body>
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
					<p class="posttitle">Category</p>
					<g:select class="toppad" name="category.id" from="${com.atomyk.wardcoop.Category.list()}"
						optionKey="id" optionValue="name" value="${postInstance?.category?.id}"/>
					<p class="posttitle">Title</p>
                    <span class="value ${hasErrors(bean:postInstance,field:'title','errors')}">
                        <input class="createpost" type="text" id="title" maxlength="50" name="title" value="${fieldValue(bean:postInstance,field:'title')}"/>
                    </span>
					<p class="posttitle">Price</p>
                    <input class="createpost" type="text" id="price" name="price" value="${fieldValue(bean:postInstance,field:'price')}"/>
					<p class="posttitle">Description</p>
                    <span class="value ${hasErrors(bean:postInstance,field:'description','errors')}">
                        <g:textArea class="createpost" id="description" name="description" value="${fieldValue(bean:postInstance,field:'description')}" rows="5" cols="40"/>
                    </span>
					<p class="posttitle">Telephone Number &#40xxx-xxx-xxxx&#41</p>
                    <span class="value ${hasErrors(bean:postInstance,field:'phone','errors')}">
                        <input class="createpost" type="text" id="phone" name="phone" value="${fieldValue(bean:postInstance,field:'phone')}"/>
                    </span>
                    
	                <br><br>
	                
	            	<g:if test="${imageList[0] != null}">
		                <p class="topmargin"><img class="postthumb" src="${createLink(controller:'image', action:'image', id:imageList[0].id)}"/></p>
						<p class="deletepic"><g:link class="brownlink" onclick="return confirm('Are you sure? Please save any changes you have made to the form before deleting this image.');" action="deleteImage" id="${imageList[0].id}">Remove</g:link></p>
		                <br><br><br>
            		</g:if>
            		<g:else>
						<p class="posttitle">Main Photo</p>
	                    <div class="upload">
							<input type="file" id="image" name="imageMain.image" />
						</div>
            		</g:else>
	            	<g:if test="${imageList[1] != null}">
		                <p class="topmargin"><img class="postthumb" src="${createLink(controller:'image', action:'image', id:imageList[1].id)}"/></p>
						<p class="deletepic"><g:link class="brownlink" onclick="return confirm('Are you sure? Please save any changes you have made to the form before deleting this image.');" action="deleteImage" id="${imageList[1].id}">Remove</g:link></p>
		                <br><br><br>
            		</g:if>
            		<g:else>
						<p class="posttitle">Upload Additional Photo</p>
	                    <div class="upload">
							<input type="file" id="image" name="image2.image" />
						</div>
            		</g:else>
	            	<g:if test="${imageList[2] != null}">
		                <p class="topmargin"><img class="postthumb" src="${createLink(controller:'image', action:'image', id:imageList[2].id)}"/></p>
						<p class="deletepic"><g:link class="brownlink" onclick="return confirm('Are you sure? Please save any changes you have made to the form before deleting this image.' );" action="deleteImage" id="${imageList[2].id}">Remove</g:link></p>
		                <br><br><br>
            		</g:if>
            		<g:else>
						<p class="posttitle">Upload Additional Photo</p>
	                    <div class="upload">
							<input type="file" id="image" name="image3.image" />
						</div>
            		</g:else>
                     
                    <br>
					<div class="savecancelbuttons">
						<input class="savenewpost" onclick="showSaveProgress();" type="image" src="${resource(dir:'images', file:'save.gif')}" />
						<g:link class="cancel" action="listByUser"><img src="${resource(dir:'images',file:'cancel.gif')}" /></g:link>
					</div>
                    <div style="display:none" class="rightside" id="saveProgress">
                        <img class="savenewpost" src="${resource(dir:'images', file:'progress.gif')}" />&nbsp;Uploading
                    </div>
				</g:form>
			</div>
			<div class="rightside">
				<p class="asterisk"></p>
			</div>
		</div>

</body>
</html>
