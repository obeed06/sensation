
<%@ page import="com.obee.sensation.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-product" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">
			
				<g:if test="${productInstance?.productName}">
				<li class="fieldcontain">
					<span id="productName-label" class="property-label"><g:message code="product.productName.label" default="Product Name" /></span>
					
						<span class="property-value" aria-labelledby="productName-label"><g:fieldValue bean="${productInstance}" field="productName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="product.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.tagLine}">
				<li class="fieldcontain">
					<span id="tagLine-label" class="property-label"><g:message code="product.tagLine.label" default="Tag Line" /></span>
					
						<span class="property-value" aria-labelledby="tagLine-label"><g:fieldValue bean="${productInstance}" field="tagLine"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.primaryImgLocation}">
				<li class="fieldcontain">
					<span id="primaryImgLocation-label" class="property-label"><g:message code="product.primaryImgLocation.label" default="Primary Img Location" /></span>
					
						<span class="property-value" aria-labelledby="primaryImgLocation-label"><g:fieldValue bean="${productInstance}" field="primaryImgLocation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.cocktails}">
				<li class="fieldcontain">
					<span id="cocktails-label" class="property-label"><g:message code="product.cocktails.label" default="Cocktails" /></span>
					
						<g:each in="${productInstance.cocktails}" var="c">
						<span class="property-value" aria-labelledby="cocktails-label"><g:link controller="cocktail" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.isActive}">
				<li class="fieldcontain">
					<span id="isActive-label" class="property-label"><g:message code="product.isActive.label" default="Is Active" /></span>
					
						<span class="property-value" aria-labelledby="isActive-label"><g:formatBoolean boolean="${productInstance?.isActive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.productCategory}">
				<li class="fieldcontain">
					<span id="productCategory-label" class="property-label"><g:message code="product.productCategory.label" default="Product Category" /></span>
					
						<span class="property-value" aria-labelledby="productCategory-label"><g:link controller="productCategory" action="show" id="${productInstance?.productCategory?.id}">${productInstance?.productCategory?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.stockList}">
				<li class="fieldcontain">
					<span id="stockList-label" class="property-label"><g:message code="product.stockList.label" default="Stock List" /></span>
					
						<g:each in="${productInstance.stockList}" var="s">
						<span class="property-value" aria-labelledby="stockList-label"><g:link controller="stock" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="product.tags.label" default="Tags" /></span>
					
						<g:each in="${productInstance.tags}" var="t">
						<span class="property-value" aria-labelledby="tags-label"><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productInstance?.id}" />
					<g:link class="edit" action="edit" id="${productInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
