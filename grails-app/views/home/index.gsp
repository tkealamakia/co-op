<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main" />
</head>
<body>
<!--Beginning of code for the title bar-->
		<div class="titlebar">
			<div class="title">Categories</div>
			<div class="searchbox2">
				<g:form class="searchbox" controller="post" action="search" method="post">
					<input type="text" name="searchStr" class="searchbox" />
					<input type="image" class="searchbutton" src="${resource(dir:'images', file:'search.gif')}" />
				</g:form>
			</div>
		</div>
		<div class="leftarea">
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<div class="categories">

					<div class="leftcategory">
						<a href="${request.contextPath}/post/list/1?max=15"><img src="${resource(dir:'images',file:'categorytile1.gif')}" /> </a>
					</div>
					<div class="rightcategory">
						<a href="${request.contextPath}/post/list/2?max=15"><img src="${resource(dir:'images',file:'categorytile2.gif')}" /> </a>
					</div>
					<div class="leftcategory">
						<a href="${request.contextPath}/post/list/3?max=15"><img src="${resource(dir:'images',file:'categorytile3.gif')}" /> </a>
					</div>
					<div class="rightcategory">
						<a href="${request.contextPath}/post/list/4?max=15"><img src="${resource(dir:'images',file:'categorytile4.gif')}" /> </a>
					</div>
					<div class="leftcategory">
						<a href="${request.contextPath}/post/list/5?max=15"><img src="${resource(dir:'images',file:'categorytile5.gif')}" /> </a>
					</div>
					<div class="rightcategory">
						<a href="${request.contextPath}/post/list/6?max=15"><img src="${resource(dir:'images',file:'categorytile6.gif')}" /> </a>
					</div>
					<div class="leftcategory">
						<a href="${request.contextPath}/post/list/7?max=15"><img src="${resource(dir:'images',file:'categorytile7.gif')}" /> </a>
					</div>
					<div class="rightcategory">
						<a href="${request.contextPath}/post/list/8?max=15"><img src="${resource(dir:'images',file:'categorytile8.gif')}" /> </a>
					</div>
					<div class="leftcategory">
						<a href="${request.contextPath}/post/list/9?max=15"><img src="${resource(dir:'images',file:'categorytile9.gif')}" /> </a>
					</div>
			</div>
		</div>


</body>
</html>
