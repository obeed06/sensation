
<%@ page import="com.obee.sensation.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-product" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="productName" title="${message(code: 'product.productName.label', default: 'Product Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'product.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="tagLine" title="${message(code: 'product.tagLine.label', default: 'Tag Line')}" />
					
						<g:sortableColumn property="primaryImgLocation" title="${message(code: 'product.primaryImgLocation.label', default: 'Primary Img Location')}" />
					
						<g:sortableColumn property="isActive" title="${message(code: 'product.isActive.label', default: 'Is Active')}" />
					
						<th><g:message code="product.productCategory.label" default="Product Category" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productInstanceList}" status="i" var="productInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "productName")}</g:link></td>
					
						<td>${fieldValue(bean: productInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "tagLine")}</td>
					
						<td style="word-break:break-all;">${fieldValue(bean: productInstance, field: "primaryImgLocation")}</td>
					
						<td><g:formatBoolean boolean="${productInstance.isActive}" /></td>
					
						<td>${fieldValue(bean: productInstance, field: "productCategory")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
