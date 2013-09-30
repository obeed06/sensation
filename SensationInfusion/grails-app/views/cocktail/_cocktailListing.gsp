<div id="productlist">
	<div class="row">	
	<g:each in="${cocktailList}" var="cocktail">
		<div class="col-lg-4">
			
			<div class="thumbnail text-center">
				<img data-src="holder.js/300x200" style="height:400px;width: auto;" alt="Spirit Img" src="${cocktail.primaryImgLocation}">
				<g:link controller="cocktail" action="getCocktail" params="[cocktailID : cocktail.id]">
					<h4>${cocktail.cocktailName}</h4>
				</g:link>
			</div>
		</div>
	</g:each>
	</div>
</div>