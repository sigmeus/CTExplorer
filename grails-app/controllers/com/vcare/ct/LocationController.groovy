package com.vcare.ct

import com.vcare.ctexplorer.Location
import grails.converters.JSON

class LocationController {

    def index() { }
	
	def show() {
		[location: Location.get(params.id)]
	}
	
	def search() {
		session.myLocation = cacheLocation(params.term)
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
	
	def defineMyLocation() {
		log.debug params
		
		def loc = cacheLocation(params.term)
		if (!loc) {
			loc = new Location(params.loc).save()
		}
		session.myLocation = loc
		
		def res = [:]
		res.loc = loc.term
		render res as JSON
	}
	
	def defineNearestCenterForLocation() {
		log.debug params
		
		def loc = Location.findByTerm(params.loc)
		loc.nearestCenter = params.center
		loc.save()
		
		def res = [:]
		res.loc = loc.term.replaceAll(" ", "").replaceAll(",", "_")
		res.center = params.center.replaceAll(" ", "").replaceAll(",", "_")
		render res as JSON
	}
}
