package com.obee.sensation

import org.compass.core.engine.SearchEngineQueryParseException

class ProductController {

	def productService
	static String WILDCARD = "*"
	def searchableService

	def index() {
		redirect(action:'productSelection',params:params)
	}

	def productSelection() {

		render(view:'productSelection',model:[categoryList : ProductCategory.list()])
	}

	def productList() {

		ProductCategory category = ProductCategory.find { categoryName == params.categoryName}
		def productList = Product.findAllByProductCategory(category)
		render(view:'productList',model:[productList : productList,  filterTags : Tag.getAll(), category : category?.categoryName])
	}


	def getProduct() {		
		def cocktails = productService.getCocktailsForProduct(params.productID)
		render(view:'productDetails',model:[product : Product.get(params.productID.toLong())])
	}

	def filterProdList = {

		def stringFilters =  params['filters[]']
		def products
		List<Long> filters = new ArrayList<Long>()
		ProductCategory category = ProductCategory.find { categoryName == params.categoryName}

		stringFilters.each {
			filters.add(Long.valueOf(it))
		}

		if(filters.isEmpty()) {
			products = Product.findAllByProductCategory(category)
		} else {
			products = Product.withCriteria {
				tags {
					'in'("id",filters)
				}
				productCategory { category }
			}
		}

		if (products.isEmpty()) {
			render(template:"productListing", text:'No products available under this tag filter', success : false)
		} else {
			render(template:"productListing", model:[productList: products], success : true)
		}
	}



	def search = {
		if (!params.q?.trim()) {
			return [:]
		}
		try {
			String searchTerm = WILDCARD+ params.q + WILDCARD
			render(view:'productList',model:[productList : Product.search(searchTerm, params),  filterTags : Tag.getAll()])
			
	
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
