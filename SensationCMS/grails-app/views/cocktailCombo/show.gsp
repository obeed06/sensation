
<%@ page import="com.obee.sensation.CocktailCombo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cocktailCombo.label', default: 'CocktailCombo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cocktailCombo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cocktailCombo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cocktailCombo">
			
				<g:if test="${cocktailComboInstance?.comboDescription}">
				<li class="fieldcontain">
					<span id="comboDescription-label" class="property-label"><g:message code="cocktailCombo.comboDescription.label" default="Combo Description" /></span>
					
						<span class="property-value" aria-labelledby="comboDescription-label"><g:fieldValue bean="${cocktailComboInstance}" field="comboDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cocktailComboInstance?.cocktail}">
				<li class="fieldcontain">
					<span id="cocktail-label" class="property-label"><g:message code="cocktailCombo.cocktail.label" default="Cocktail" /></span>
					
						<span class="property-value" aria-labelledby="cocktail-label"><g:link controller="cocktail" action="show" id="${cocktailComboInstance?.cocktail?.id}">${cocktailComboInstance?.cocktail?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cocktailComboInstance?.productVolumes}">
				<li class="fieldcontain">
					<span id="productVolumes-label" class="property-label"><g:message code="cocktailCombo.productVolumes.label" default="Product Volumes" /></span>
					
						<g:each in="${cocktailComboInstance.productVolumes}" var="p">
						<span class="property-value" aria-labelledby="productVolumes-label"><g:link controller="productVolume" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cocktailComboInstance?.id}" />
					<g:link class="edit" action="edit" id="${cocktailComboInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
