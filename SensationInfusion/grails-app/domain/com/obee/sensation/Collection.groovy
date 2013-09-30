package com.obee.sensation

class Collection {

	String collectionName
	String description
	
	static hasMany = [ products : Product ]
		
    static constraints = {
    }
}
