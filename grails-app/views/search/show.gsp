<!doctype html>
<html>
    <head>
        <meta name="layout" content="main">
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
        <title>${xml.id_info.org_study_id}</title>
        <style type="text/css">
	      html { height: 100% }
	      body { height: 100%; margin: 0; padding: 0 }
	      #map-canvas { height: 400px;}
	    </style>
	    <r:require modules="bootstrap,map"/> 
    </head>
    <body>
        <div class="row-fluid">
            <div class="span12">
	            <h1>${xml.id_info.org_study_id} / ${xml.phase} <label class="label"> ${xml.overall_status} </label></h1>
	            ${xml.brief_title}
	            <ul class="nav nav-tabs">
	            	<li><a href="#stat" data-toggle="tab">Status</a></li>
		            <li><a href="#desc" data-toggle="tab">Description</a></li>
					<li><a href="#elig" data-toggle="tab">Eligibility</a></li>
					<li><a href="#loc" data-toggle="tab">Locations <span class="label">${xml.location.size()}</span></a></li>
				</ul>
				<div class="tab-content span5">
					<div class="tab-pane fade active in" id="stat">
						<h2>Status</h2>
						<b>Authority</b><br/>
						<g:each in="${xml.oversight_info.authority}" var="aut">${aut}<br/></g:each><br/>
			           	<b>Start Date</b> ${xml.start_date}<br/>
			           	<b>Completion Date</b> ${xml.primary_completion_date}<br/>
			           	<b>Enrollment</b> ${xml.enrollment}<br/>
			           	<h2>Contacts</h2>
			           	<b>Lead</b><br/>
			           	<g:each in="${xml.overall_official}" var="contact">
				           	 - ${contact.last_name} / ${contact.role} ${contact.affiliation}<br/>
			           	</g:each>
			           	<b>Contact</b> ${xml.overall_contact.last_name}<br/>
			           	<b>Phone</b> ${xml.overall_contact.phone}<br/>
			           	<b>email</b> ${xml.overall_contact.email}<br/>
		           	</div>
					<div class="tab-pane fade in" id="desc">
			           	<h2>Summary</h2>${xml.brief_summary.textblock}
			           	<h2>Details</h2>${xml.detailed_description.textblock}
		           	</div>
		           	<div class="tab-pane fade in" id="elig">
		           	<b>Sex</b> ${xml.eligibility.gender}<br/>
		           	<b>Min Age</b> ${xml.eligibility.minimum_age}<br/>
		           	<b>Max Age</b> ${xml.eligibility.maximum_age}<br/>
		           	<b>Healthy Volunteers</b> ${xml.eligibility.healthy_volunteers}<br/> <br/>
		           	${xml.eligibility.criteria.textblock.text().replaceAll("\n\n","<br/>")}
		           	<!-- 
			           	<ul>
				           	<g:each in="${xml.eligibility.criteria.textblock.toString().split('Inclusion Criteria')*.split('Exclusion Criteria').flatten()}" var="criteria">
				           		<g:each in="${criteria.split(" - ")}">
				           			<li>${it}</li>
				           		</g:each>
				           	</g:each>
			           	</ul>
			           	 -->
		           	</div>
		           	<div class="tab-pane fade in" id="loc">
		           		
	           			<div id="showMyLocationDiv" style="display:none;">
		           			<span>My Location : <span id="showMyLocationSpan">${session.myLocation?.term}</span></span>
		           			<g:actionSubmit value="Change" onclick="javascript:changeMyLocation();"></g:actionSubmit>
	           			</div>
	           			<div id="defineMyLocationDiv" style="display:none;">
		           			<g:textField name="myLocation" id="myLocation" placeholder="My Location"/>
	           				<g:actionSubmit value="Validate" onclick="javascript:defineMyLocation();"></g:actionSubmit>
	           			</div>
	           			
	           			<div>&nbsp;</div>
		           		
			           	<g:each in="${xml.location}">
			           		<span class="label ${it.status=='Recruiting'?'label-success':''}">${it.status}</span> <b>${it.facility.address.city}, ${it.facility.address.country}</b> - ${it.facility.name} ${it.contact}
			           		<a href="javascript:void(0);" onclick="javascript:defineNearestCenterForLocation('${it.facility.address.city}, ${it.facility.address.country}');"
			           				 style="display:none;" class="defineNearestCenterButton link_center_${(it.facility.address.city as String).replaceAll(" ", "")}_${(it.facility.address.country as String).replaceAll(" ", "")}">Define as nearest research center</a>
	           				<span class="label label-success span_center_${(it.facility.address.city as String).replaceAll(" ", "")}_${(it.facility.address.country as String).replaceAll(" ", "")}"
	           						style="display: none;"></span>
	           				<br/>
			           	</g:each>
			        </div>
			    </div>
			    <div class="span6">
					<div id="map-canvas">
				</div>
			</div>
			
			</div>
			
        </div>
        <g:javascript>
        $(document).ready(function() {
        	var geocoder = new google.maps.Geocoder();
	        var mapOptions = {
	          zoom: 1,
	          disableDefaultUI: true,
	          center: new google.maps.LatLng(0, 0),
	          mapTypeId: google.maps.MapTypeId.ROADMAP
	        }
	        var map = new google.maps.Map(document.getElementById('map-canvas'),
	                                      mapOptions);
	        
	        var markers = [];
	        var marker;
	        <g:each in="${xml.location}">
				       	marker = new google.maps.Marker({
				            map: map,
				            position: new google.maps.LatLng(${com.vcare.ctexplorer.GeocoderCache.getCache((it.facility.address.city+', '+it.facility.address.country) as String, "${params.nct}")}),
				            <g:if test="${it.status=='Recruiting'}">icon:'http://maps.google.com/mapfiles/ms/icons/green-dot.png',</g:if>
				            title:"${it.facility.name}, ${it.contact} ${it.status}"
				        });
				        markers.push(marker);
	        </g:each>
	        var mc=new MarkerClusterer(map,markers);
     	 });
     	 
     	 
        $(document).ready(function() {
        	if($("#showMyLocationSpan").html() != "") {
	     	 	$("#showMyLocationDiv").show();
	     	 	$(".defineNearestCenterButton").html("Define as nearest center from " + $("#showMyLocationSpan").html());
	     	 	$(".defineNearestCenterButton").show();
	     	 	$("#defineMyLocationDiv").hide();
        	} else {
        		$("#showMyLocationDiv").hide();
	     	 	$(".defineNearestCenterButton").hide();
     	 		$("#defineMyLocationDiv").show();
        	}
        });
     	 
     	 function defineMyLocation() {
     	 	$.getJSON('../location/defineMyLocation', {loc: $("#myLocation").val()})
     	 		.success(function(res) {
     	 			$("#showMyLocationSpan").html(res.loc);
		     	 	$("#showMyLocationDiv").show();
		     	 	$(".defineNearestCenterButton").html("Define as nearest center from " + $("#showMyLocationSpan").html());
		     	 	$(".defineNearestCenterButton").show();
		     	 	$("#defineMyLocationDiv").hide();
     	 		});
     	 }
     	 
     	 function changeMyLocation() {
     	 	$("#showMyLocationDiv").hide();
     	 	$(".defineNearestCenterButton").hide();
     	 	$("#defineMyLocationDiv").show();
     	 }
     	 
     	 function defineNearestCenterForLocation(center) {
     	 	$.post('../location/defineNearestCenterForLocation', {center: center, loc: $("#showMyLocationSpan").html()})
     	 		.success(function(res) {
     	 			//$(".span_center_" + res.center).html("Nearest center from " + res.loc);
     	 			//$(".span_center_" + res.center).show();
		     	 	//$(".link_center_" + res.center).hide();
     	 		});
     	 }
    </g:javascript>
    </body>
</html>
