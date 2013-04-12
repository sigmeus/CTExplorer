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
	    <r:require module="bootstrap"/> 
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
				           	<g:each in="${xml.location}">
				           		<b>${it.facility.address.city}</b>, ${it.contact} (${it.status})<br/>
				           	</g:each>
			        </div>
			    </div>
			    <div class="span6">
					<div id="map-canvas">
				</div>
			</div>
			
			</div>
			Data provided by <a href="http://clinicaltrials.gov">http://clinicaltrials.gov</a>
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
			<% int i=0 %>
	        <g:each in="${xml.location}">
	        	window.setTimeout(function(){
		        	geocoder.geocode( { 'address': "${it.facility.address.city}"}, function(results, status) {
				      if (status == google.maps.GeocoderStatus.OK) {
				        var marker = new google.maps.Marker({
				            map: map,
				            animation: google.maps.Animation.DROP,
				            position: results[0].geometry.location,
				            <g:if test="${it.status=='Recruiting'}">icon:'http://maps.google.com/mapfiles/ms/icons/green-dot.png',</g:if>
				            title:"${it.facility.address.city}, ${it.contact} (${it.status})"
				        });
				      } else {
				      	console.log(${i});
				      }
				    });
			    },${5000*((i++/5) as int)});
	        </g:each>
     	 });
    </g:javascript>
    </body>
</html>