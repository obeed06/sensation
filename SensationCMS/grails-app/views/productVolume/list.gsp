
<%@ page import="com.obee.sensation.ProductVolume" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productVolume.label', default: 'ProductVolume')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-productVolume" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-productVolume" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="productVolume" title="${message(code: 'productVolume.productVolume.label', default: 'Product Volume')}" />
					
						<th><g:message code="productVolume.product.label" default="Product" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productVolumeInstanceList}" status="i" var="productVolumeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productVolumeInstance.id}">${fieldValue(bean: productVolumeInstance, field: "productVolume")}</g:link></td>
					
						<td>${fieldValue(bean: productVolumeInstance, field: "product")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productVolumeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
