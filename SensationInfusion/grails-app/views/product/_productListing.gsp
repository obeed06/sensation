<div id="productlist">
	<div class="row">
	
	<g:each in="${productList}" var="product">
		<g:if test="${product.isActive == true}">
		  	<div class="col-lg-4">  	
		
				<div class="thumbnail text-center">
					<img  data-src="holder.js/300x200" style="height:400px;width: auto;" src="${product.primaryImgLocation}" >						 
					<div class="caption">
						<g:link controller="product" action="getProduct" params="[productID : product.id]">
							<h4>
								${product.productName}
							</h4>
							
						</g:link>
					</div>
				</div>
			</div>
		</g:if>		
	</g:each>
	</div> 
</div>