<%@ page import="com.obee.sensation.ProductVolume" %>



<div class="fieldcontain ${hasErrors(bean: productVolumeInstance, field: 'productVolume', 'error')} ">
	<label for="productVolume">
		<g:message code="productVolume.productVolume.label" default="Product Volume" />
		
	</label>
	<g:textField name="productVolume" maxlength="100" value="${productVolumeInstance?.productVolume}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productVolumeInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="productVolume.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${com.obee.sensation.Product.list()}" optionKey="id" required="" value="${productVolumeInstance?.product?.id}" class="many-to-one"/>
</div>

