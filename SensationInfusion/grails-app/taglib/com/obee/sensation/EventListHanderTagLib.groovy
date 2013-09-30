package com.obee.sensation

import static java.util.Calendar.*

class EventListHanderTagLib {

	def getPassedMonthEvents = { attrs ->
		
		int monthEventCount = 0
		def eventDateCalendar = Calendar.getInstance()
		eventDateCalendar.add(Calendar.MONTH, "${attrs.monthOffset}".toInteger())
		
		out << "<h3>${eventDateCalendar.format('MMM')}</h3>"
		out << "<ul class='list-inline'>"
		
		attrs.eventsList.each { event ->
						
			if("${event.eventDateTime[MONTH]}" == "${eventDateCalendar[MONTH]}" && "${event.eventDateTime[YEAR]}" == "${eventDateCalendar[YEAR]}") {
				
				monthEventCount++
				out << "<li>"
				out << "<h4 class='media-heading'>${event.name}</h4>"
				out << "<strong>DATE: </strong>${event.eventDateTime.format('dd-MMM-yyyy')}<br/>"
				out << "<strong>FROM: </strong>${event.eventDateTime.format('hh:mm aaa')}<br/>"
				out << "${event.description}<br/>"
				out << "<strong>WHERE: </strong>${event.location}<br/>"
				out << "</li><li><br/></li>"
			}			
		}	
		if(monthEventCount == 0) {
			out << "<li><p>No scheduled events for this month</p></li>"			
		}		
		out << "</ul>"
	}
}
