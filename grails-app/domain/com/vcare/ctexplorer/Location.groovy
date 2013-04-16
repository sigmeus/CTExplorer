package com.vcare.ctexplorer

class Location {
	
	String term
	long numberOfSearches = 1

    static constraints = {
    }
	
	Location(String term) {
		this.term = term
	}
}
