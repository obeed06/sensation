package com.obee.sensation

class CocktailCombo {
	
	String comboDescription
	Cocktail cocktail
	
	static hasMany = [productVolumes : ProductVolume]
	
    static mapping = {		
		productVolumes joinTable:[name: 'combo_volume', key: 'cocktail_combo_id']
		
    }
	
	static constraints = {
		comboDescription(maxSize: 200)
	}
}
