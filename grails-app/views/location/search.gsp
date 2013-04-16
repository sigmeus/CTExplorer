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
						<g:textField class="span6" name="term" value="${params.term}"/><g:submitButton name="Search"/><br/>
					</g:form>
            	<g:if test="${params.term}">
	            	<table class="table table-striped">
	            		<thead>
	            			<tr>
	            				<th>Link</th>
	            				<th>Description</th>
	            			</tr>
	            		</thead>
		            	
		           	</table>
		           	<div class="pagination">
		           		
		           	</div>
	           	</g:if>
			</div>
        </div>
    </body>
</html>
