

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Image</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Image List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Image</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Image</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${imageInstance}">
            <div class="errors">
                <g:renderErrors bean="${imageInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <input type="hidden" name="id" value="${imageInstance?.id}" />
                <input type="hidden" name="version" value="${imageInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="image">Image:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:imageInstance,field:'image','errors')}">
                                    <input type="file" id="image" name="image" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="post">Post:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:imageInstance,field:'post','errors')}">
                                    <g:select optionKey="id" from="${Post.list()}" name="post.id" value="${imageInstance?.post?.id}" ></g:select>
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
