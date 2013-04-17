package com.vcare.ct

import com.vcare.ctexplorer.GeocoderCache;
import com.vcare.ctexplorer.KeywordCache;
import com.vcare.ctexplorer.XMLCache;

class SearchController {

    def index() {
		println params
		cacheKeyword(params.term)
		def q=this.p.curry(params)
		def url="http://clinicaltrials.gov/ct2/results?displayXML=true${q('term',null)+q('locn',null)+q('offset','start')+q('recr',null)+q('type',null)}"
		log.debug "url called : $url"
		def output=new XmlSlurper().parseText(getCache(url))
		[xml:output]
	}
	
	def show(){
		[xml:new XmlSlurper().parseText(getCache(params.nct.decodeHTML()))]
	}
	
	def geocode(){
		render GeocoderCache.getCache(params.location)
	}
	
	def p={params, String param, String name ->
		if(params[param]){
			"&${name?:param}=${params[param].replaceAll(' ', '+')}"
		}
		else ""
	}
	
	String getCache(String url){
		def cache=XMLCache.findByUrlAndOutdated(url,false)
		if(!cache||cache.date-new Date()>0){
			println "not from cache"
			if(!cache){
				cache=new XMLCache()
				cache.url=url
			}
			cache.cache=url.toURL().text
			cache.date=new Date()
			cache.save()
		}
		cache.cache
	}
	
	def cacheKeyword(String keyword) {
		KeywordCache kw = KeywordCache.findByTerm(keyword)
		
		if (kw) {
			kw.numberOfSearches++
		}
		else  {
			kw = new KeywordCache(keyword)
		}
		
		kw.save()
	}
}
