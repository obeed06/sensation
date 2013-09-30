
<%@ page import="com.obee.sensation.Stock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stock.label', default: 'Stock')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stock" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stock">
			
				<g:if test="${stockInstance?.stock}">
				<li class="fieldcontain">
					<span id="stock-label" class="property-label"><g:message code="stock.stock.label" default="Stock" /></span>
					
						<span class="property-value" aria-labelledby="stock-label"><g:fieldValue bean="${stockInstance}" field="stock"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="stock.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${stockInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="stock.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${stockInstance?.product?.id}">${stockInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.sizeType}">
				<li class="fieldcontain">
					<span id="sizeType-label" class="property-label"><g:message code="stock.sizeType.label" default="Size Type" /></span>
					
						<span class="property-value" aria-labelledby="sizeType-label"><g:fieldValue bean="${stockInstance}" field="sizeType"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${stockInstance?.id}" />
					<g:link class="edit" action="edit" id="${stockInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
