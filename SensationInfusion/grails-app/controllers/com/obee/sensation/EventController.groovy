package com.obee.sensation

class EventController {

	def eventsService
	
    def index() { 
		
		def date = new Date()
		def eventsList = Event.findAllByEventDateTimeGreaterThanEquals(date)	
		
		render(view: 'index', model:[eventsList : eventsList])		
	}
}
