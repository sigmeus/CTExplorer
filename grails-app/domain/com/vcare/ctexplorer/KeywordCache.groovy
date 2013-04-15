package com.vcare.ctexplorer

class KeywordCache {
	
	String term
	Date searchDate = new Date()

    static constraints = {
    }
	
	KeywordCache(String keyword) {
		this.term = keyword
	}
}
