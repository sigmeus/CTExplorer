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
						<div class="control-group">
							<g:textField class="span6" name="term" placeholder="Keyword" value="${params.term}"/>
						</div>
						<g:if test="${params.recr}">
							<div class="control-group">
								<select class="header3" name="recr" id="Recruitment">
						            <option value="" <g:if test="${params.recr == ""}">selected="selected"</g:if>>   All Studies &nbsp;</option>
						            <option value="Open" <g:if test="${params.recr == "Open"}">selected="selected"</g:if>>  Open Studies &nbsp;</option>
						            <option value="Recruiting" <g:if test="${params.recr == "Recruiting"}">selected="selected"</g:if>> &nbsp; --   Recruiting  &nbsp;</option>
									<option value="Not yet recruiting" <g:if test="${params.recr == "Not yet recruiting"}">selected="selected"</g:if>> &nbsp; --   Not yet recruiting  &nbsp;</option>
									<option value="Available" <g:if test="${params.recr == "Available"}">selected="selected"</g:if>> &nbsp; --  Expanded Access: Available  &nbsp;</option>
						            <option value="Closed" <g:if test="${params.recr == "Closed"}">selected="selected"</g:if>>  Closed Studies &nbsp;</option>
						            <option value="Active, not recruiting" <g:if test="${params.recr == "Active, not recruiting"}">selected="selected"</g:if>> &nbsp; --   Active, not recruiting  &nbsp;</option>
						            <option value="Completed" <g:if test="${params.recr == "Completed"}">selected="selected"</g:if>> &nbsp; --   Completed  &nbsp;</option>
						            <option value="Enrolling by invitation" <g:if test="${params.recr == "Enrolling by invitation"}">selected="selected"</g:if>> &nbsp; --   Enrolling by invitation  &nbsp;</option>
						            <option value="Suspended" <g:if test="${params.recr == "Suspended"}">selected="selected"</g:if>> &nbsp; --   Suspended  &nbsp;</option>
						            <option value="Terminated" <g:if test="${params.recr == "Terminated"}">selected="selected"</g:if>> &nbsp; --   Terminated  &nbsp;</option>
						            <option value="Withdrawn" <g:if test="${params.recr == "Withdrawn"}">selected="selected"</g:if>> &nbsp; --   Withdrawn  &nbsp;</option>
						            <option value="No longer available" <g:if test="${params.recr == "No longer available"}">selected="selected"</g:if>> &nbsp; --  Expanded Access: No longer available  &nbsp;</option>
						            <option value="Temporarily not available" <g:if test="${params.recr == "Temporarily not available"}">selected="selected"</g:if>> &nbsp; --  Expanded Access: Temporarily not available  &nbsp;</option>
					            </select>
							</div>
						</g:if>
						<div class="control-group">
							<g:submitButton name="Search"/>
						</div>
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
			           			<td><span class="label">${it.status}</span> <a href="${createLink(action:'show', params:[nct:it.url.toString()+'?displayXML=true'])}">${it.condition_summary}</a></td>
			           			
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
