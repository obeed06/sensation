
<%@ page import="com.obee.sensation.Cocktail" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cocktail.label', default: 'Cocktail')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cocktail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cocktail" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cocktail">
			
				<g:if test="${cocktailInstance?.cocktailName}">
				<li class="fieldcontain">
					<span id="cocktailName-label" class="property-label"><g:message code="cocktail.cocktailName.label" default="Cocktail Name" /></span>
					
						<span class="property-value" aria-labelledby="cocktailName-label"><g:fieldValue bean="${cocktailInstance}" field="cocktailName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cocktailInstance?.method}">
				<li class="fieldcontain">
					<span id="method-label" class="property-label"><g:message code="cocktail.method.label" default="Method" /></span>
					
						<span class="property-value" aria-labelledby="method-label"><g:fieldValue bean="${cocktailInstance}" field="method"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cocktailInstance?.ingredients}">
				<li class="fieldcontain">
					<span id="ingredients-label" class="property-label"><g:message code="cocktail.ingredients.label" default="Ingredients" /></span>
					
						<span class="property-value" aria-labelledby="ingredients-label"><g:fieldValue bean="${cocktailInstance}" field="ingredients"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cocktailInstance?.primaryImgLocation}">
				<li class="fieldcontain">
					<span id="primaryImgLocation-label" class="property-label"><g:message code="cocktail.primaryImgLocation.label" default="Primary Img Location" /></span>
					
						<span class="property-value" aria-labelledby="primaryImgLocation-label"><g:fieldValue bean="${cocktailInstance}" field="primaryImgLocation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cocktailInstance?.cocktailCombos}">
				<li class="fieldcontain">
					<span id="cocktailCombos-label" class="property-label"><g:message code="cocktail.cocktailCombos.label" default="Cocktail Combos" /></span>
					
						<g:each in="${cocktailInstance.cocktailCombos}" var="c">
						<span class="property-value" aria-labelledby="cocktailCombos-label"><g:link controller="cocktailCombo" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cocktailInstance?.products}">
				<li class="fieldcontain">
					<span id="products-label" class="property-label"><g:message code="cocktail.products.label" default="Products" /></span>
					
						<g:each in="${cocktailInstance.products}" var="p">
						<span class="property-value" aria-labelledby="products-label"><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cocktailInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="cocktail.tags.label" default="Tags" /></span>
					
						<g:each in="${cocktailInstance.tags}" var="t">
						<span class="property-value" aria-labelledby="tags-label"><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cocktailInstance?.id}" />
					<g:link class="edit" action="edit" id="${cocktailInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
