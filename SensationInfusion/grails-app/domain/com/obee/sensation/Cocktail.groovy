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
	}
	
    static constraints = {
		cocktailName(maxSize: 50)
		method(maxize: 2000)
		ingredients(maxSize: 1000)
		primaryImgLocation(maxSize: 250)
    }
}
