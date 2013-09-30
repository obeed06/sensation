
<%@ page import="com.obee.sensation.ProductVolume" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productVolume.label', default: 'ProductVolume')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productVolume" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productVolume" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productVolume">
			
				<g:if test="${productVolumeInstance?.productVolume}">
				<li class="fieldcontain">
					<span id="productVolume-label" class="property-label"><g:message code="productVolume.productVolume.label" default="Product Volume" /></span>
					
						<span class="property-value" aria-labelledby="productVolume-label"><g:fieldValue bean="${productVolumeInstance}" field="productVolume"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productVolumeInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="productVolume.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${productVolumeInstance?.product?.id}">${productVolumeInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productVolumeInstance?.id}" />
					<g:link class="edit" action="edit" id="${productVolumeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
