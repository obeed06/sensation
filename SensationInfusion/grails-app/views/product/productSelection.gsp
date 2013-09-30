<!DOCTYPE html>
<html lang="en">
<title>Product Category Select</title>
<body>	
	<g:include view="layouts/headerBanner.gsp"/>
	<div class="container">

	<g:include view="layouts/menuHeader.gsp"  params="[active: 'products']"/>

		<table>
			<tr align="center">
			
				<g:each in="${categoryList}" var="item">				
					<td>
						<g:link controller="product" action="productList" params="[categoryName: item.categoryName]"><img width="70%" alt="Ginger Beer Img" src="${item?.imgLocation}"></g:link>
						<g:link controller="product" action="productList" params="[categoryName: item.categoryName]"><p style="color: white;">${item?.categoryName}</p></g:link>
					</td>
				</g:each>
			
			</tr>
		</table>
	<g:include view="layouts/footer.gsp" />
	</div>
</body>
</html>