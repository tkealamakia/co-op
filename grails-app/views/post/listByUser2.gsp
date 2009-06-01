

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Post List</title>
    </head>
    <body>
		<g:render template="/templates/menu"/>
        <div class="body">
            <h1>Post List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="category" title="Category" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <th>Person</th>
                   	    
                   	        <g:sortableColumn property="price" title="Price" />
                        
                   	        <g:sortableColumn property="title" title="Title" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${postInstanceList}" status="i" var="postInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${postInstance.id}">${fieldValue(bean:postInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:postInstance, field:'category')}</td>
                        
                            <td>${fieldValue(bean:postInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:postInstance, field:'person')}</td>
                        
                            <td>${fieldValue(bean:postInstance, field:'price')}</td>
                        
                            <td>${fieldValue(bean:postInstance, field:'title')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${postInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
