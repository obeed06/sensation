<%@ page import="com.obee.sensation.Stock" %>



<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'stock', 'error')} required">
	<label for="stock">
		<g:message code="stock.stock.label" default="Stock" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stock" type="number" min="0" value="${stockInstance.stock}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="stock.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: stockInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="stock.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${com.obee.sensation.Product.list()}" optionKey="id" required="" value="${stockInstance?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'sizeType', 'error')} required">
	<label for="sizeType">
		<g:message code="stock.sizeType.label" default="Size Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sizeType" from="${com.obee.sensation.Stock$SizeType?.values()}" keys="${com.obee.sensation.Stock$SizeType.values()*.name()}" required="" value="${stockInstance?.sizeType?.name()}"/>
</div>

