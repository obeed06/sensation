package com.obee.sensation

class HomeController {

	def index() { redirect(action:'homePage',params:params) }
	
	def homePage() {	
		print "home page is loading"
	}
	
	
}
