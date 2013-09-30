package com.obee.sensation

class Cocktail {

	String cocktailName
	String method
	String ingredients
	String primaryImgLocation
	
	static searchable = true
	
	static hasMany = [products : Product, tags : Tag, cocktailCombos : CocktailCombo]
	static belongsTo = Product
	
	static mapping = {
		products joinTable:[name:"product_cocktail", key:'cocktail_id']
		tags joinTable:[name:"tag_cocktail", key:'cocktail_id']
	}
	
    static constraints = {
		cocktailName(maxSize: 50)
		method(maxize: 2000)
		ingredients(maxSize: 1000)
		primaryImgLocation(maxSize: 250)
    }
	
	String toString() {
		return "${cocktailName}"
	}
}
