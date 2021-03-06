<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
</head>
<body>
        <!--Beginning of code for the title bar-->
		<div class="titlebar">
			<div class="title">My Posts
			</div>
		</div>
		<div class="leftarea">
        <!--End of code for the title bar-->
			
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            
            <!--This is where the code for one post begins-->
            <g:each in="${postInstanceList}" status="i" var="postInstance">
			<div class="postlineitem">
				<% def foundMainPhoto = false %>
            	<g:if test="${postInstance.images.size() > 0}">
		            <g:each in="${postInstance.images}" status="j" var="image">
		            	<g:if test="${image.type == 'imageMain'}">
		            		<% foundMainPhoto = true %>
                            <g:link action="show" id="${postInstance.id}"><img class="postthumb" src="${createLink(controller:'image', action:'imageThumb', id:image.id)}"/></g:link>
						</g:if>
	                </g:each>
                </g:if>
                <% if (foundMainPhoto == false) { %>
					<g:link action="show" id="${postInstance.id}"><img class ="postthumb" src="${resource(dir:'images', file:'nopicture.gif')}" /></g:link>
				<% } %>
                
				<div class="editdelete">
					<g:link class="brownlink" action="edit" id="${postInstance.id}">Edit</g:link><br />
					<g:link class="brownlink" onclick="return confirm('Are you sure?');" action="delete" id="${postInstance.id}">Delete</g:link>
				</div>
				<div class="postlistcontent">
					<div class="postlisttitle"><g:link class="posttitle" action="show" id="${postInstance.id}">${fieldValue(bean:postInstance, field:'title')}</g:link>
					</div>
					<div class="postlistdescription">
                        <tags:postChopper value="${fieldValue(bean:postInstance, field:'description')}" />
					</div>
					<div class="postpricedate">
						<div class="postlistprice">
							${fieldValue(bean:postInstance, field:'price')}
						</div>
						<div class="postdate">
                            <tags:expired value="${postInstance.postDate}" />
                            <g:formatDate format="MMMM dd, yyyy" date="${postInstance.postDate}" />
						</div>
					</div>
				</div>
			</div>
			</g:each>
			
            <div class="paginateButtons">
                <div class="pagenumbers">
                    <g:paginate next="Forward" prev="Back"
                                maxsteps="10" controller="post"
                                action="listByUser" total="${postInstanceTotal}"  />
                </div>
            </div>
			
		</div>

</body>
</html>
