package com.obee.sensation

class Product {
	
	String productName
	ProductCategory productCategory
	String tagLine
	String description
	String primaryImgLocation
	boolean isActive
		
	
	static hasMany = [cocktails : Cocktail, tags : Tag, stockList : Stock]
	static searchable = true
	
	static mapping = {		
		is_active type: 'yes_no'
		cocktails joinTable:[name:"product_cocktail", key:'product_id']
		tags joinTable:[name:"tag_product", key:'product_id']
	}
	
    static constraints = {
		productName(maxSize:50)
		description(maxSize:1000)
		tagLine(maxSize:500)
		primaryImgLocation(maxSize:250)
    }
	
	String toString() {
		return "${productName}"
	}
}
