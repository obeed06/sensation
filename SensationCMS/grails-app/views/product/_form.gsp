<%@ page import="com.obee.sensation.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'productName', 'error')} ">
	<label for="productName">
		<g:message code="product.productName.label" default="Product Name" />
		
	</label>
	<g:textField name="productName" maxlength="50" value="${productInstance?.productName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="product.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${productInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'tagLine', 'error')} ">
	<label for="tagLine">
		<g:message code="product.tagLine.label" default="Tag Line" />
		
	</label>
	<g:textArea name="tagLine" cols="40" rows="5" maxlength="500" value="${productInstance?.tagLine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'primaryImgLocation', 'error')} ">
	<label for="primaryImgLocation">
		<g:message code="product.primaryImgLocation.label" default="Primary Img Location" />
		
	</label>
	<g:textField name="primaryImgLocation" maxlength="250" value="${productInstance?.primaryImgLocation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'cocktails', 'error')} ">
	<label for="cocktails">
		<g:message code="product.cocktails.label" default="Cocktails" />
		
	</label>
	<g:select name="cocktails" from="${com.obee.sensation.Cocktail.list()}" multiple="multiple" optionKey="id" size="5" value="${productInstance?.cocktails*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="product.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${productInstance?.isActive}" />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'productCategory', 'error')} required">
	<label for="productCategory">
		<g:message code="product.productCategory.label" default="Product Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="productCategory" name="productCategory.id" from="${com.obee.sensation.ProductCategory.list()}" optionKey="id" required="" value="${productInstance?.productCategory?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'stockList', 'error')} ">
	<label for="stockList">
		<g:message code="product.stockList.label" default="Stock List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productInstance?.stockList?}" var="s">
    <li><g:link controller="stock" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="stock" action="create" params="['product.id': productInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'stock.label', default: 'Stock')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="product.tags.label" default="Tags" />
		
	</label>
	<g:select name="tags" from="${com.obee.sensation.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${productInstance?.tags*.id}" class="many-to-many"/>
</div>

