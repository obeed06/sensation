<%@ page import="com.obee.sensation.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'tagName', 'error')} ">
	<label for="tagName">
		<g:message code="tag.tagName.label" default="Tag Name" />
		
	</label>
	<g:textField name="tagName" maxlength="50" value="${tagInstance?.tagName}"/>
</div>

