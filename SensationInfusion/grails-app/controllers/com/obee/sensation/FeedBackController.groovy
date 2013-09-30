package com.obee.sensation

import com.obee.sensation.FeedBackOptions

class FeedBackController {

    def index() { 		
		
		[feedBackOptions : FeedBackOptions.values()]
		
	}
	
	def sendFeedBack() {
		def feedBack = new FeedBack(params)
		feedBack.validate()
		if(feedBack.hasErrors()) {
			render(view:"index.gsp",model:[feedBackOptions : FeedBackOptions.values(), feedBack : feedBack])
			
		} else {		
			sendMail {
				to "david_obee@hotmail.com"
				subject "CONTACT US TOPIC: ${feedBack.topic} - Msg Title: ${feedBack.messageTitle}"
				body "${feedBack.message} - Contact this person on ${feedBack.email}"			
				
			}
			render(view:"index.gsp",model:[confMsg: "Thanks for getting in contact", feedBackOptions : FeedBackOptions.values()])
			
		}
		

	}
}
