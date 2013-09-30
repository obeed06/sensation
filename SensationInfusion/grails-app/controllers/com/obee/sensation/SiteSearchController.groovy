package com.obee.sensation

class SiteSearchController {

	static String WILDCARD = "*"
	def searchableService
	
	def search() {
		String searchTerm = WILDCARD+ params.q + WILDCARD
		
	def searchResults = searchableService.search(
			searchTerm,
			[offset: 0, max: 20])
	

		render(view:'search.gsp', model:[searchResult : searchResults, q: params.q])
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
