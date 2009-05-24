

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Category</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Category List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Category</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Category</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${categoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${categoryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${categoryInstance?.id}" />
                <input type="hidden" name="version" value="${categoryInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="displayOrder">Display Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:categoryInstance,field:'displayOrder','errors')}">
                                    <input type="text" id="displayOrder" name="displayOrder" value="${fieldValue(bean:categoryInstance,field:'displayOrder')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:categoryInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:categoryInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="posts">Posts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:categoryInstance,field:'posts','errors')}">
                                    
<ul>
<g:each var="p" in="${categoryInstance?.posts?}">
    <li><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="post" params="['category.id':categoryInstance?.id]" action="create">Add Post</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
