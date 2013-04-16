package com.vcare.ctexplorer

class KeywordCache {
	
	String term
	long numberOfSearches = 1

    static constraints = {
    }
	
	KeywordCache(String keyword) {
		this.term = keyword
	}
}
