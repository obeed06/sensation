package com.obee.sensation

class Stock {

	enum SizeType {
		SMALL_VOLUME("100 ML"),
		MEDIUM_VOLUME("250 ML"),
		LARGE_VOLUME("500 ML")
		
		String description
		
		SizeType(String description) {
			this.description = description
		}
	}
	
	static belongsTo = [product: Product]
	
	SizeType sizeType
	Integer stock
	Double price
	
    static constraints = {
		stock(min: 0)
		price(min: 0D, scale: 2)
    }
	
	static mapping = {
	}
	
	String toString() {
		"${product.productName} - ${sizeType}"
	}
}
