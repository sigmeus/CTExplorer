package com.vcare.ct

class SearchController {

    def index() {
		println params
		def q=this.p.curry(params)
		def output=new XmlSlurper().parse("http://clinicaltrials.gov/ct2/results?displayXML=true${q('term')+q('locn')+q('start')}")
		[xml:output]
	}
	
	def show(){
		[xml:new XmlSlurper().parse(params.nct.decodeHTML())]
	}
	
	def p={params, String param ->
		if(params[param]){
			"&${param}=${params[param]}"
		}
		else ""
	}
}
