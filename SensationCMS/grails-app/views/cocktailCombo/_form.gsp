<%@ page import="com.obee.sensation.CocktailCombo" %>



<div class="fieldcontain ${hasErrors(bean: cocktailComboInstance, field: 'comboDescription', 'error')} ">
	<label for="comboDescription">
		<g:message code="cocktailCombo.comboDescription.label" default="Combo Description" />
		
	</label>
	<g:textField name="comboDescription" maxlength="200" value="${cocktailComboInstance?.comboDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cocktailComboInstance, field: 'cocktail', 'error')} required">
	<label for="cocktail">
		<g:message code="cocktailCombo.cocktail.label" default="Cocktail" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cocktail" name="cocktail.id" from="${com.obee.sensation.Cocktail.list()}" optionKey="id" required="" value="${cocktailComboInstance?.cocktail?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cocktailComboInstance, field: 'productVolumes', 'error')} ">
	<label for="productVolumes">
		<g:message code="cocktailCombo.productVolumes.label" default="Product Volumes" />
		
	</label>
	<g:select name="productVolumes" from="${com.obee.sensation.ProductVolume.list()}" multiple="multiple" optionKey="id" size="5" value="${cocktailComboInstance?.productVolumes*.id}" class="many-to-many"/>
</div>

