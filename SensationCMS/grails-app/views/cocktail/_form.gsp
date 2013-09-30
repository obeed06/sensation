<%@ page import="com.obee.sensation.Cocktail" %>



<div class="fieldcontain ${hasErrors(bean: cocktailInstance, field: 'cocktailName', 'error')} ">
	<label for="cocktailName">
		<g:message code="cocktail.cocktailName.label" default="Cocktail Name" />
		
	</label>
	<g:textField name="cocktailName" maxlength="50" value="${cocktailInstance?.cocktailName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cocktailInstance, field: 'method', 'error')} ">
	<label for="method">
		<g:message code="cocktail.method.label" default="Method" />
		
	</label>
	<g:textField name="method" value="${cocktailInstance?.method}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cocktailInstance, field: 'ingredients', 'error')} ">
	<label for="ingredients">
		<g:message code="cocktail.ingredients.label" default="Ingredients" />
		
	</label>
	<g:textArea name="ingredients" cols="40" rows="5" maxlength="1000" value="${cocktailInstance?.ingredients}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cocktailInstance, field: 'primaryImgLocation', 'error')} ">
	<label for="primaryImgLocation">
		<g:message code="cocktail.primaryImgLocation.label" default="Primary Img Location" />
		
	</label>
	<g:textField name="primaryImgLocation" maxlength="250" value="${cocktailInstance?.primaryImgLocation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cocktailInstance, field: 'cocktailCombos', 'error')} ">
	<label for="cocktailCombos">
		<g:message code="cocktail.cocktailCombos.label" default="Cocktail Combos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cocktailInstance?.cocktailCombos?}" var="c">
    <li><g:link controller="cocktailCombo" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cocktailCombo" action="create" params="['cocktail.id': cocktailInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cocktailCombo.label', default: 'CocktailCombo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: cocktailInstance, field: 'products', 'error')} ">
	<label for="products">
		<g:message code="cocktail.products.label" default="Products" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: cocktailInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="cocktail.tags.label" default="Tags" />
		
	</label>
	<g:select name="tags" from="${com.obee.sensation.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${cocktailInstance?.tags*.id}" class="many-to-many"/>
</div>

