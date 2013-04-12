<!doctype html>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Results ${params.term}</title>
		<r:require module="bootstrap"/>        
    </head>
    <body>
        <div class="row">
            <div class="span12">
					<g:form class="form offset3" controller="search">
						<g:textField class="span6" name="term" value="${params.term}"/><br/>
					</g:form>
            	<g:if test="${params.term}">
	            	<table class="table table-striped">
	            		<thead>
	            			<tr>
	            				<th>Link</th>
	            				<th>Description</th>
	            			</tr>
	            		</thead>
		            	<g:each in="${xml.clinical_study}">
			           		<tr>
			           			<td><span class="label">${it.status}</span></td> <a href="${createLink(action:'show', params:[nct:it.url.toString()+'?displayXML=true'])}">${it.condition_summary}</a>
			           			
			           			<td>${it.title}</td>
			           		</tr>
			           	</g:each>
		           	</table>
		           	<div class="pagination">
		           		<g:paginate total="${xml.'@count'}" max="20" params="${params}"/>
		           	</div>
	           	</g:if>
			</div>
        </div>
    </body>
</html>
