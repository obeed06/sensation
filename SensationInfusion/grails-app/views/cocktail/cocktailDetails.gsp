<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1" />

<script>
$(document).ready(function() {
	$('.carousel').carousel();	
});

</script>
<title>Cocktail Details</title>

</head>
<body>	
	<g:include view="layouts/headerBanner.gsp"/>

	<div class="container">

	<g:include view="layouts/menuHeader.gsp"  params="[active: 'cocktail']"/>
	
	<div class="row">
  		<div class="col-lg-4">
			<img class="img-responsive" data-src="holder.js/64x64" alt="Spirit Img" src="${cocktail.primaryImgLocation}"/>	
		</div>
  		<div class="col-lg-8">
  			<div class="page-header">
  				<h1>${cocktail.cocktailName}</h1>
			</div>
			
			<h4>Ingredients</h4>
			<g:each in="${cocktail.cocktailCombos?.first()?.productVolumes}" var="volume">
				<p style="text-decoration:underline">${volume.productVolume} ${volume.product.productName }</p>
			</g:each>
			${cocktail.ingredients }<br/><br/>			
			
			<h4>Method</h4>
			${cocktail.method}<br/><br/>
			<h4 >Make this cocktail with: </h4>
			<div id="myCarousel" class="carousel slide">
				<div class="carousel-inner">
					<g:each in="${cocktail.cocktailCombos}" var="combo" status="it">
						<div class="${it == 0 ? 'active' : ''  } item text-center">
							<div class="row">
								<g:each in="${combo.productVolumes}" var="productVolume" status="itInner">
									<div class="col-6 col-lg-4">  	
						                <div class="thumbnail">
												<img data-src="holder.js/64x64" src="${productVolume.product.primaryImgLocation}"/>
											<g:link controller="product" action="getProduct" params="[productID : productVolume.product.id]">
												<h4>
													${productVolume.product.productName}
												</h4>
											</g:link>			                
										</div>
						            </div>
					            </g:each>
					        </div>
						</div>
					</g:each>
			  </div>
			  <g:if test="${cocktail.cocktailCombos?.size() > 1}">	  
				  <!-- Carousel nav -->
				  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
				  <a class="carousel-control right" href="#myCarousel" data-slide="next" style="left: 400px">&rsaquo;</a>
			  </g:if>
			</div>			
			<br/><br/>
		</div>
	</div>
	
	<g:include view="layouts/footer.gsp" />
	</div>
</body>
</html>