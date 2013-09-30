
<%@ page import="com.obee.sensation.ProductCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productCategory.label', default: 'ProductCategory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productCategory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productCategory">
			
				<g:if test="${productCategoryInstance?.imgLocation}">
				<li class="fieldcontain">
					<span id="imgLocation-label" class="property-label"><g:message code="productCategory.imgLocation.label" default="Img Location" /></span>
					
						<span class="property-value" aria-labelledby="imgLocation-label"><g:fieldValue bean="${productCategoryInstance}" field="imgLocation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productCategoryInstance?.categoryName}">
				<li class="fieldcontain">
					<span id="categoryName-label" class="property-label"><g:message code="productCategory.categoryName.label" default="Category Name" /></span>
					
						<span class="property-value" aria-labelledby="categoryName-label"><g:fieldValue bean="${productCategoryInstance}" field="categoryName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productCategoryInstance?.id}" />
					<g:link class="edit" action="edit" id="${productCategoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
