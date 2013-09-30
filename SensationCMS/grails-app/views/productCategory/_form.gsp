<%@ page import="com.obee.sensation.ProductCategory" %>



<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'imgLocation', 'error')} ">
	<label for="imgLocation">
		<g:message code="productCategory.imgLocation.label" default="Img Location" />
		
	</label>
	<g:textField name="imgLocation" maxlength="250" value="${productCategoryInstance?.imgLocation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'categoryName', 'error')} ">
	<label for="categoryName">
		<g:message code="productCategory.categoryName.label" default="Category Name" />
		
	</label>
	<g:textField name="categoryName" maxlength="50" value="${productCategoryInstance?.categoryName}"/>
</div>

