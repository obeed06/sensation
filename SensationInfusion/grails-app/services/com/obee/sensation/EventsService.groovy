package com.obee.sensation

import static java.util.Calendar.*
import com.obee.sensation.Event

class EventsService {

    def sortDateListToMapOfMonths(List<Event> eventList) {
		
		def dateMap = [:]
		
		eventList.each {
			if(dateMap.containsKey("${it.eventDateTime[MONTH]}-${it.eventDateTime[YEAR]}"))	{
				dateMap.putAt("${it.eventDateTime[MONTH]}-${it.eventDateTime[YEAR]}", it)
			} else {
				dateMap.put("${it.eventDateTime[MONTH]}-${it.eventDateTime[YEAR]}", it)
			
			}		
		}
		
		return dateMap
		
    }
}
