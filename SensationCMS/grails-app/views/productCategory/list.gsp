
<%@ page import="com.obee.sensation.ProductCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productCategory.label', default: 'ProductCategory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-productCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-productCategory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="imgLocation" title="${message(code: 'productCategory.imgLocation.label', default: 'Img Location')}" />
					
						<g:sortableColumn property="categoryName" title="${message(code: 'productCategory.categoryName.label', default: 'Category Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productCategoryInstanceList}" status="i" var="productCategoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productCategoryInstance.id}">${fieldValue(bean: productCategoryInstance, field: "imgLocation")}</g:link></td>
					
						<td>${fieldValue(bean: productCategoryInstance, field: "categoryName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productCategoryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
