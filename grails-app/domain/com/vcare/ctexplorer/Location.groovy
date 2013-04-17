package com.vcare.ctexplorer

class Location {
	
	String term
	long numberOfSearches = 1
	String nearestCenter

    static constraints = {
		nearestCenter(nullable: true)
    }
	
	Location(String term) {
		this.term = term
	}
}
