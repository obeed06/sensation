<!DOCTYPE html>
<html lang="en">
<body>
	<g:include view="layouts/headerBanner.gsp"/>	 
	<div class="container">
		<g:include view="layouts/menuHeader.gsp"  params="[active: 'cocktails']"/>
		<g:set var="haveResults" value="${searchResult?.results}" />
		<g:set var="haveQuery" value="${params.q?.trim()}" />

		<g:if test="${haveResults}">
		<div class="row">
		
			<g:each in="${searchResult.results}" var="result">
				<g:if test="${result instanceof com.obee.sensation.Product}">
		  			<div class="col-lg-4">  	
						<div class="thumbnail text-center">
							<img data-src="holder.js/300x200" alt="Spirit Img" src="${result.primaryImgLocation}"> 
							<g:link controller="product" action="getProduct" params="[productID : result.id]">
								<h4>
									${result.productName}
								</h4>
							</g:link>
						</div>
					</div>
				</g:if>
				<g:elseif test="${result instanceof com.obee.sensation.Cocktail}">
		  			<div class="col-lg-4">  	
					
						<div class="thumbnail text-center">
							<img data-src="holder.js/300x200" alt="Spirit Img" src="${result.primaryImgLocation}">
							<g:link controller="cocktail" action="getCocktail" params="[cocktailID : result.id]">
								<h4>${result.cocktailName}</h4>
							</g:link>
						</div>
					</div>
				</g:elseif>
			</g:each>
		</div>			
		</g:if>
		<g:else>
			<p>The search term <strong>${params.q?.trim()}</strong> did not return any results</p>
		</g:else>
		<g:include view="layouts/footer.gsp" />
	</div>
</body>
</html>