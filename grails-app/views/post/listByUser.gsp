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
			                <img class="postthumb" src="${createLink(controller:'image', action:'image', id:image.id)}"/>
						</g:if>
	                </g:each>
                </g:if>
                <% if (foundMainPhoto == false) { %>
					<g:link action="show" id="${postInstance.id}"><img class ="postthumb" src="images/nopicture.gif" /></g:link>
				<% } %>
                
				<div class="editdelete">
					<g:link class="brownlink" action="show" id="${postInstance.id}">Show</g:link><br />
					<g:link class="brownlink" action="edit" id="${postInstance.id}">Edit</g:link><br />
					<g:link class="brownlink" onclick="return confirm('Are you sure?');" action="delete" id="${postInstance.id}">Delete</g:link>
				</div>
				<div class="postlistcontent">
					<div class="postlisttitle"><g:link class="posttitle" action="edit">${fieldValue(bean:postInstance, field:'title')}</g:link>
					</div>
					<div class="postlistdescription">
                        <tags:postChopper value="${fieldValue(bean:postInstance, field:'description')}" />
					</div>
					<div class="postlistprice">
                        ${fieldValue(bean:postInstance, field:'price')}
					</div>
				</div>
			</div>
			</g:each>
<!--This is where the code for one post ends-->
			
            <div class="paginateButtons">
                <g:paginate total="${postInstanceTotal}" />
            </div>
			<!--
			<div class="pagination">
				<div class="pagenumbers">
				<a class="white" href="back.html">Back</a>
				&nbsp;
				<a class="white" href="one.html">1</a>
				&nbsp;
				<a class="white" href="two.html">2</a>
				&nbsp;
				<a class="white" href="three.html">3</a>
				&nbsp;
				<a class="white" href="four.html">4</a>
				&nbsp;
				<a class="white" href="five.html">5</a>
				&nbsp;
				<a class="white" href="six.html">6</a>
				&nbsp;
				<a class="white" href="seven.html">7</a>
				&nbsp;
				<a class="white" href="eight.html">8</a>
				&nbsp;
				<a class="white" href="nine.html">9</a>
				&nbsp;
				<a class="white" href="ten.html">10</a>
				&nbsp;
				<a class="white" href="next.html">Next</a>
				</div>
			</div>
			-->
			
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
