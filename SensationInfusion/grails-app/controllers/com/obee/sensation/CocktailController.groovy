package com.obee.sensation

import org.compass.core.engine.SearchEngineQueryParseException

class CocktailController {

	static String WILDCARD = "*"
	def searchableService
	
    def index() { redirect(action:'cocktailList',params:params) }
	
	def cocktailList() {
		
		render(view:'cocktailList',model:[cocktailList : Cocktail.getAll(),  filterTags : Tag.getAll()])
	}
	
	def getCocktail() {
		def cocktailFetched = Cocktail.get(params.cocktailID.toLong())
		
		render(view:'cocktailDetails', model:[cocktail : cocktailFetched])
	}
		
	def filterCocktailList = {
		
		def stringFilters =  params['filters[]']
		def cocktails
		List<Long> filters = new ArrayList<Long>()
				
		stringFilters.each {
			filters.add(Long.valueOf(it))
		}
		
		if(filters.isEmpty()) {
			cocktails = Cocktail.getAll()
			
		} else {
			cocktails = Cocktail.withCriteria {
				tags {
					'in'("id",filters)
					
				}
			}
		}
		
		if (cocktails.isEmpty()) {
			render(template:"cocktailListing", text:'No cocktails available under this tag filter', success : false)
			
		} else {
			render(template:"cocktailListing", model:[cocktailList: cocktails], success : true)
		}
			 
	}
	
	
	def search = {
		if (!params.q?.trim()) {
			return [:]
		}
		try {
			String searchTerm = WILDCARD+ params.q + WILDCARD
			
			def searching = Cocktail.search(searchTerm, params)
			//weird object requires own page for displaying
			render(view:'cocktailList',model:[cocktailList : Cocktail.search(searchTerm, params),  filterTags : Tag.getAll()])
			
	
		} catch (SearchEngineQueryParseException ex) {
			return [parseException: true]
		}
	}
	def indexAll = {
		Thread.start { searchableService.index() }
		render("bulk index started in a background thread")
	}

	def unindexAll = {
		searchableService.unindex()
		render("unindexAll done")
	}
}
