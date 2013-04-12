package com.vcare.ctexplorer;

class XMLCache {
	String url
	String cache
	Date date=new Date()
	Boolean outdated=false
	
	static constraints = {
		url(url:true, nullable:false)
		cache(size:0..1024*1024*1024, nullable:false)
		date(nullable:false)
	}
}
