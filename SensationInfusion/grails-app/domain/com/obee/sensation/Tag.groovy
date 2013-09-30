package com.obee.sensation

class Tag {

	String tagName
	
	static mapping = {	
	}
	
    static constraints = {
		tagName(maxSize: 50)
    }
}
