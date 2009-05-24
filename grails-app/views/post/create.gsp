

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Post</title>         
    </head>
    <body>
    	<menu:menuBar/>

        <div class="body">
            <h1>Create Post</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${postInstance}">
            <div class="errors">
                <g:renderErrors bean="${postInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:postInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price">Asking Price:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'price','errors')}">
                                    <input type="text" id="price" name="price" value="${fieldValue(bean:postInstance,field:'price')}"/>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'description','errors')}">
                                    <g:textArea id="description" name="description" value="${fieldValue(bean:postInstance,field:'description')}" rows="5" cols="40"/>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone">Contact Telephone Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'phone','errors')}">
                                    <input type="text" id="phone" name="phone" value="${fieldValue(bean:postInstance,field:'phone')}"/>
                                </td>
                            </tr> 
                        
                        <!--
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person">Person:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'person','errors')}">
                                    <g:select optionKey="id" from="${com.atomyk.wardcoop.Person.list()}" name="person.id" value="${postInstance?.person?.id}" ></g:select>
                                </td>
                            </tr> 
                        -->
                        
                        
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
