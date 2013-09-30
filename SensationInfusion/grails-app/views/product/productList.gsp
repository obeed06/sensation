<!DOCTYPE html>
<html lang="en">
<head>
<g:javascript library="application" />
<r:layoutResources/>
<script>
$(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

function filterAjax() {

	var data = 	 $('[name^=filter]:checked:enabled');

	var dataList = [];

	data.each(function(i) {

		dataList.push($(this).val());

	});	
	
	jQuery.ajax({type:'POST',
		dataType: "json",
		data: {'filters':dataList, 'categoryName':'${category}'}, 
		url:'/AmandasWebSite/productSelection/filterProdList/',
		complete: function(resp){ 
			//alert('complete');
			$('#products').empty();                            
			$('#products').html(resp.responseText);
		},
		error:function(XMLHttpRequest,textStatus,errorThrown){}});
	}
</script>
</head>
<title>Product List</title>
<body>
	<g:include view="layouts/headerBanner.gsp"/>
	<div class="container">

	<g:include view="layouts/menuHeader.gsp"  params="[active: 'products']"/>

	<div class="row">
  		<div class="col-lg-2">
  		  	<g:if test="${filterTags}">  		
  				<div class="panel">
	  				<div class="panel-heading">FILTER BY TAGS:</div>
					<g:each in="${filterTags}" var="tag">
						<div class="input-group">
				      		<span class="input-group-addon">
				        		<g:checkBox type="checkbox" id="filter" name="filter" value="${tag.id}" checked="false" onChange="filterAjax()"/>
				      		</span>
							<input type="text" class="form-control" disabled="disabled" value="${tag.tagName}">		
				    	</div>
					</g:each>
	  			</div>
			</g:if>	  					
  		</div>
  		<div class="col-lg-10">
  			<div id="products">
				<g:render template="productListing" model="['productList': productList]" />
			</div>
  		</div>		
		</div>		
		<g:include view="layouts/footer.gsp" />		
		</div>	
		
</body>

</html>