

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Post</title>
    </head>
    <body>
		<g:render template="/templates/menu"/>
        <div class="body">
            <h1>Edit Post</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${postInstance}">
            <div class="errors">
                <g:renderErrors bean="${postInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${postInstance?.id}" />
                <input type="hidden" name="version" value="${postInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="category">Category:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'category','errors')}">
                                    <input type="text" id="category" name="category" value="${fieldValue(bean:postInstance,field:'category')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:postInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="images">Images:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'images','errors')}">
                                    
<ul>
<g:each var="i" in="${postInstance?.images?}">
    <li><g:link controller="image" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="image" params="['post.id':postInstance?.id]" action="create">Add Image</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price">Price:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'price','errors')}">
                                    <input type="text" id="price" name="price" value="${fieldValue(bean:postInstance,field:'price')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:postInstance,field:'title')}"/>
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
