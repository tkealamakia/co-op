<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>	
        <table>
	        <tr>
	        	<td>
			        <div class="logo"><img src="${resource(dir:'images',file:'grails_logo.jpg')}" alt="Grails" /></div>
		        </td>
	            <td>
	            	<table>
		            	<tr>
				            <td><g:link controller="post" action="create">Create New Post</g:link></td>
			            </tr>
		            	<tr>
				            <td><g:link controller="person" action="show">My Account</g:link></td>
			            </tr>
		            	<tr>
				            <td><g:link controller="post" action="listByUser">My Posts</g:link></td>
			            </tr>
		            	<tr>
				            <td><g:link controller="logout">Sign Out</g:link></td>
			            </tr>
		            </table>
	            </td>
	        </tr>
        </table>
        <g:layoutBody />		
    </body>	
</html>