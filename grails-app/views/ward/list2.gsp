
<%@ page import="com.atomyk.wardcoop.Ward" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Ward List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Ward</g:link></span>
        </div>
        <div class="body">
            <h1>Ward List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${wardInstanceList}" status="i" var="wardInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${wardInstance.id}">${fieldValue(bean:wardInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:wardInstance, field:'name')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${wardInstanceTotal}" />
            </div>
            <g:form method="post" >
                <input type="hidden" name="person.id" value="${params.id}" />
            </g:form>
        </div>
    </body>
</html>
