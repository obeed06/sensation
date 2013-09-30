package com.obee.sensation

enum FeedBackOptions {
	
	INTEREST_IN_PURCHASING("Interest in Purchasing"),
	PRODUCT_FEEDBACK("Product Feedback"),
	COCKTAIL_FEEDBACK("Cocktail Feedback"),
	COCKTAIL_IDEA("Cokctail Idea"),
	OTHER("Other");
	
	String displayName;
	
	FeedBackOptions(String feedBackOption) {
		this.displayName = feedBackOption;
	}
	
	String displayName() {
		return displayName;
	}
}
