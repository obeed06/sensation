package com.obee.sensation

class ProductCategory {

	String imgLocation
	String categoryName
	
	static mapping = {
	}
	
	static constraints = {
		imgLocation(maxSize: 250)
		categoryName(maxSize : 50)
	}
	
	String toString() {
		return "${categoryName}"
	}
}
