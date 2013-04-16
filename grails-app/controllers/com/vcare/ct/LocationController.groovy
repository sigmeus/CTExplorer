package com.vcare.ct

import com.vcare.ctexplorer.Location

class LocationController {

    def index() { }
	
	def show() {
		[location: Location.get(params.id)]
	}
	
	def search() {
		cacheLocation(params.term)
	}
	
	def cacheLocation(String term) {
		Location loc = Location.findByTerm(term)
		
		if (loc) {
			loc.numberOfSearches++
		}
		else  {
			loc = new Location(term)
		}
		
		loc.save()
	}
}
