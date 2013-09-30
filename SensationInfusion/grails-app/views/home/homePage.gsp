<!DOCTYPE html>
<html lang="en">

<title>Home</title>
<body>
	<g:include view="layouts/headerBanner.gsp" />
	<div class="container">

		<g:include view="layouts/menuHeader.gsp" params="[active : 'home']" />

		<div class="jumbotron">
			<p>
				<strong>SENSATION</strong> <cite class="infusion-styling">Infusion</cite>
				products have been developed to make different flavour combinations
				from real ingredients which tickle the senses. Products are made
				from good quality spirits and delicious fresh ingredients to infuse
				a real flavour
			</p>
			<p>
				All <strong>SENSATION</strong> <cite class="infusion-styling">Infusion</cite>
				products are versatile to give a twist to your favourite mixer or
				cocktail and smooth enough to drink neat or on the rocks.
			</p>
			<p>
				<strong>SENSATION</strong> <cite class="gingerbeer-styling">Gingerbeers</cite>
				are made using an original recipe and spiced up by infusion with
				fresh ingredients. The ginger tingles on the tongue and the balance
				of flavour makes it refreshing and smooth.
			</p>
		</div>

		<div id="carousel-example-generic" class="carousel slide">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				
				<div class="item active">
					<img
						src="${resource(dir: 'images', file: 'galleryHome/event.JPG')}"
						alt="...">
				</div>
				<div class="item">
					<img
						src="${resource(dir: 'images', file: 'galleryHome/gift.JPG')}"
						alt="...">
				</div>
				<div class="item">
					<img
						src="${resource(dir: 'images', file: 'galleryHome/vodka.jpg')}"
						alt="...">
				</div>
				
				<div class="item">
					<img
						src="${resource(dir: 'images', file: 'galleryHome/gin.jpg')}"
						alt="...">
				</div>
				<div class="item">
					<img
						src="${resource(dir: 'images', file: 'galleryHome/gingerBeer.jpg')}"
						alt="...">
				</div>
				
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				data-slide="prev"> <span class="icon-prev"></span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				data-slide="next"> <span class="icon-next"></span>
			</a>
		</div>

		<g:include view="layouts/footer.gsp" />
	</div>
</body>
</html>