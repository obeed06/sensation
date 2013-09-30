
<%@ page import="com.obee.sensation.Cocktail" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cocktail.label', default: 'Cocktail')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cocktail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cocktail" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cocktailName" title="${message(code: 'cocktail.cocktailName.label', default: 'Cocktail Name')}" />
					
						<g:sortableColumn property="method" title="${message(code: 'cocktail.method.label', default: 'Method')}" />
					
						<g:sortableColumn property="ingredients" title="${message(code: 'cocktail.ingredients.label', default: 'Ingredients')}" />
					
						<g:sortableColumn property="primaryImgLocation" title="${message(code: 'cocktail.primaryImgLocation.label', default: 'Primary Img Location')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cocktailInstanceList}" status="i" var="cocktailInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cocktailInstance.id}">${fieldValue(bean: cocktailInstance, field: "cocktailName")}</g:link></td>
					
						<td>${fieldValue(bean: cocktailInstance, field: "method")}</td>
					
						<td>${fieldValue(bean: cocktailInstance, field: "ingredients")}</td>
					
						<td>${fieldValue(bean: cocktailInstance, field: "primaryImgLocation")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cocktailInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
