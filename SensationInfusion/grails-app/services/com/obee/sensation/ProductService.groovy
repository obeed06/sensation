package com.obee.sensation

import javax.sql.DataSource
import groovy.sql.Sql


class ProductService {
	
	def dataService
	
	def getCocktailsForProduct(productID) {
		def cocktails = Cocktail.executeQuery("SELECT c.id FROM cocktail c " +
								"INNER JOIN c.id cocktail_combo " +
								"INNER JOIN cocktail_combo.id combo_volume  " +
								"INNER JOIN combo_volume.product_volume_id product_volume " +
								"WHERE product_volume.product_id = ?", [productID])
		
		cocktails
		
	}
	
	def findAllProductsFor(Long categoryId) {
		def category = ProductCategory.get(categoryId)
		return Product.findAllByProductCategory(category)
	}
}
