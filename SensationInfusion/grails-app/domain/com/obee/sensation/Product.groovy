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

	}
	
    static constraints = {
		productName(maxSize:50)
		description(maxSize:1000)
		tagLine(maxSize:500)
		primaryImgLocation(maxSize:250)
    }	
}
