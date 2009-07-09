<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main" />
</head>
<body>
<!--Header Begins Here-->
		<div class="titlebar">
				<div class="title">Email Preferences
				</div>
		</div>
		<div class="leftarea">
			<div class="formarea">
				<div class="emailexplanation">Never miss out on an opportunity. Select the categories you would like to stay on top of, and you'll receive an email notification any time a new post is made to the category.
				</div>
				<g:form action="save">
                    <g:each in="${categoryList}" status="i" var="category">
                        <div class="checkboxandtitle">
                            <div class="emailcheckbox">
                                <input type="checkbox" name="${category.name}" 
                                       <g:if test="${categorySelectedList.contains(category)}">
                                       checked
                                       </g:if>
                                />
                            </div>
                            <div class="emailtitle">${category.name}
                            </div>
                        </div>
                    </g:each>
					<div class="savecancelbuttons">
						<input class="savenewpost" type="image" src="${resource(dir:'images',file:'save.gif')}" />
						<g:link class="cancel" controller="person" action="edit"><img src="${resource(dir:'images',file:'cancel.gif')}" /></g:link>
					</div>
				</g:form>
			</div>
		</div>

</body>
</html>