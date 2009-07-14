<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <script type="text/javascript">
        function open_win(url) {
            window.open(url,'Picture',
                'width=640,height=400,menubar=no,status=no, location=no,toolbar=no,scrollbars=no');
        }
    </script>
</head>
<body>
		<div class="titlebar">
			<div class="title">Post Details
			</div>
		</div>
        <!--Beginning of code for the title bar-->
		<div class="leftarea">
			<div class="postpics">
                <g:if test="${imageList[0] != null}">
				<div class="bigpicture">
                    <a href="javascript:void(0)" onclick="open_win('${createLink(controller:'image', action:'image', id:imageList[0]?.id)}')">
                        <img class="largepic" src="${createLink(controller:'image', action:'image', id:imageList[0]?.id)}"/>
                    </a>
				</div>
                </g:if>
                <g:else>
				<div class="bigpicture">
                        <img class ="largepic" src="${resource(dir:'images', file:'nopicture.gif')}" />
				</div>
                </g:else>
                <g:if test="${imageList[1] != null}">
				<div class="leftsmallpic">
                        <a href="javascript:void(0)" onclick="open_win('${createLink(controller:'image', action:'image', id:imageList[1]?.id)}')">
                            <img class="smallpic" src="${createLink(controller:'image', action:'image', id:imageList[1]?.id)}"/>
                        </a>
				</div>
                </g:if>
                <g:if test="${imageList[2] != null}">
				<div class="rightsmallpic">
                        <a href="javascript:void(0)" onclick="open_win('${createLink(controller:'image', action:'image', id:imageList[2]?.id)}')">
                            <img class="smallpic" src="${createLink(controller:'image', action:'image', id:imageList[2]?.id)}"/>
                        </a>
				</div>
                </g:if>
				<div class="dateposted">
                    Posted&nbsp;<g:formatDate format="MMMM dd, yyyy" date="${postInstance.postDate}" />
				</div>
			</div>
			
			<div class="postcontent">
                <a href="javascript:history.go(-1)">
                    <img src="${resource(dir:'images', file:'back.gif')}" />
                </a>
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
