package com.obee.sensation

class FeedBack {

	String name
	String email
	String topic
	String messageTitle
	String message
	
	
    static constraints = {
		name blank: false
		email email: true, blank: false
		topic blank: false
		messageTitle blank: false
		message blank: false
    }
}
