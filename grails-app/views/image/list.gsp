

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Image List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Image</g:link></span>
        </div>
        <div class="body">
            <h1>Image List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="image" title="Image" />
                        
                   	        <th>Post</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${imageInstanceList}" status="i" var="imageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${imageInstance.id}">${fieldValue(bean:imageInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:imageInstance, field:'image')}</td>
                        
                            <td>${fieldValue(bean:imageInstance, field:'post')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${imageInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
