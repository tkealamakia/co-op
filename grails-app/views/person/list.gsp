<head>
	<meta name="layout" content="main" />
	<title>Person List</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="create" action="create">New Person</g:link></span>
	</div>

	<div class="body">
		<h1>Person List</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="list">
			<table>
			<thead>
				<tr>
					<g:sortableColumn property="id" title="Id" />
					<g:sortableColumn property="username" title="Login Name" />
					<g:sortableColumn property="firstName" title="Full Name" />
					<g:sortableColumn property="lastName" title="Full Name" />
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${personList}" status="i" var="person">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${person.id}</td>
					<td>${person.email?.encodeAsHTML()}</td>
					<td>${person.firstName?.encodeAsHTML()}</td>
					<td>${person.lastName?.encodeAsHTML()}</td>
					<td class="actionButtons">
						<span class="actionButton">
							<g:link action="show" id="${person.id}">Show</g:link>
						</span>
					</td>
				</tr>
			</g:each>
			</tbody>
			</table>
		</div>


	</div>
</body>
