package com.vcare.ctexplorer

import groovy.json.JsonSlurper

class GeocoderCache {
	
	String location
	String cache

    static constraints = {
    }
	
	static transients = ["code"]
	
	static getCache(String loc, String url){
		GeocoderCache gc=GeocoderCache.findByLocation(loc)
		if(!gc){
			gc=new GeocoderCache()
			gc.location=loc
			def temp=new JsonSlurper().parseText("http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=${loc.replaceAll(' ','%20')}".toURL().text).results[0]?.geometry?.location
			if(temp){
				gc.cache="${temp.lat},${temp.lng}"
				gc.save()
			}
		}
		
		XMLCache xmlCache = XMLCache.findByUrl(url)
		if (xmlCache) {
			xmlCache.addToGeocoderCaches(gc)
			xmlCache.save()
		}
		
		gc.cache
	}
}
