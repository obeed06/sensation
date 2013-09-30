<!DOCTYPE html>
<html lang="en">
<head>
	<title>Event</title>
</head>
<body>

	<g:include view="layouts/headerBanner.gsp"/>
	<div class="container">

		<g:include view="layouts/menuHeader.gsp" params="[active: 'events']" />

		<h1>WHERE TO FIND US</h1>
		<br>
		<div class="row">
			<div class="col-lg-6">
				<g:getPassedMonthEvents monthOffset="-2" eventsList="${eventsList}" />
			</div>
			<div class="col-lg-6">
				<g:getPassedMonthEvents monthOffset="-1" eventsList="${eventsList}" />
			</div>

			<div class="col-lg-6">
				<g:getPassedMonthEvents monthOffset="0" eventsList="${eventsList}" />
			</div>

			<div class="col-lg-6">
				<g:getPassedMonthEvents monthOffset="1" eventsList="${eventsList}" />
			</div>

			<div class="col-lg-6">
				<g:getPassedMonthEvents monthOffset="2" eventsList="${eventsList}" />
			</div>
			<div class="col-lg-6">
				<g:getPassedMonthEvents monthOffset="3" eventsList="${eventsList}" />
			</div>
		</div>

		<g:include view="layouts/footer.gsp" />
	</div>
</body>
</html>