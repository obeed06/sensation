package com.obee.sensation

class ProductVolume {

	String productVolume
	Product product
	
    static mapping = {
    }
	
	static constraints = {
		productVolume(maxSize: 100)
	}
}
