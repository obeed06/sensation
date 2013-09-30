<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html" />
<link href="${resource(dir: 'css', file: 'elastislide.css')}"  rel="stylesheet" type="text/css"></link>
<link href="${resource(dir: 'css', file: 'custom.css')}"  rel="stylesheet" type="text/css"></link>
<title>Product Details</title>

</head>
<body>	
	<g:include view="layouts/headerBanner.gsp"/>
	<div class="container">

	<g:include view="layouts/menuHeader.gsp"  params="[active: 'products']"/>
	<div class="row">
  		<div class="col-lg-4">
  			<img class="img-responsive" data-src="holder.js/64x64" alt="Spirit Img" src="${product.primaryImgLocation}"/>
  		</div>
  		<div class="col-lg-8">
  			<div class="page-header">
  				<h1>${product.productName}  <small> ${product.tagLine}</small></h1>
  				<a id="FancyButton" href="http://fancy.com/fancyit?Category=Food&Title=${product.productName}&ImageURL=${product.primaryImgLocation}">Fancy</a>
  				<script type="text/javascript">(function(){var id="fancy-btn",d=document,f=d.getElementsByTagName("script")[0];if(!d.getElementById(id)){var s=d.createElement("script");s.id=id;s.src="//fancy.com/fancyit.js";f.parentNode.insertBefore(s,f);}})();</script>
			</div>
			<br/>
			<div class="row">
				<div class="col-lg-3"><strong>DESCRIPTION</strong></div>
				<div class="col-lg-8 col-lg-offset-1">${product.description}</div>
			</div>
			<br/>
			<g:if test="${product.stockList}">			
				<div class="row">
					<div class="col-lg-3"><strong>PRICING</strong></div>
					<div class="col-lg-8 col-lg-offset-1">
						<table class="table table-striped">		
							<g:each in="${product.stockList}">
								<tr>
									<td>${it.sizeType.description}</td>
									<td>£${it.price}</td>
								</tr>
							</g:each>
						</table>
					</div>
				</div>
			</g:if>			
		</div>
  	</div>
	<g:if test="${product.cocktails}">
	
	<h4 >Why not try this product in the following cocktails: </h4>
		<ul id="elastCarousel" class="elastislide-list">
	    	<g:each in="${product.cocktails}" var="cocktail">	    	
	    		<li>	    	
					<div class="thumbnail text-center">
			        	<g:link controller="cocktail" action="getCocktail" params="[cocktailID : cocktail.id]">
							<img class="img-responsive" data-src="holder.js/300x200" src="${cocktail.primaryImgLocation}"/>
						</g:link>
						<div class="caption">
							<g:link controller="cocktail" action="getCocktail" params="[cocktailID : cocktail.id]">
								<h4>
									${cocktail.cocktailName}
								</h4>
							</g:link>	
						</div>														                
					</div>
				</li>
			</g:each>	    	
		</ul>
		</g:if>
	<g:include view="layouts/footer.gsp" />
	</div>
</body>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquerypp.custom.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'modernizr.custom.17475.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.elastislide.js')}"></script>


<script type="text/javascript">
$(document).ready(function() {
	$('#elastCarousel').elastislide();
});

</script>
</html>