<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
		<title>Welcome to Clinical Trials Reloaded</title>
		<r:require module="bootstrap" />
	</head>
	<body>
		<div class="row">
			<div class="well" style="height: 400px; padding-top: 100px;">
				<h2 class="offset3">Search for Clinical Trials</h2>
				<ul class="nav nav-pills offset3">
					<li class="active">
						<a href="#search" data-toggle="tab">Search</a>
					</li>
					<li><a href="#advanced" data-toggle="tab">Advanced</a></li>
					<li><a href="#nearme" data-toggle="tab">Near Me</a></li>
				</ul>
				<div class="tab-content">
					<div id="search" class="tab-pane fade in active">
						<g:form class="form-horizontal offset3" controller="search">
							<div class="control-group">
								<g:textField class="span6" name="term" placeholder="Keyword" />
							</div>
							<div class="control-group">
								<g:submitButton name="Search"/>
							</div>
						</g:form>
						<div class="offset3">
							<h3>Popular keywords</h3>
							<div>
								<g:render template="/keywordCache/list" var="keyword"
										collection="${com.vcare.ctexplorer.KeywordCache.list(max:10, order:'desc', sort:'numberOfSearches')}">
								</g:render>
								[<a href="${createLink(controller: 'keywordCache')}">Show all keywords</a>]
							</div>
						</div>
					</div>
					<div id="advanced" class="fade in tab-pane">
						<g:form class="form-horizontal offset2" controller="search">
							<div class="control-group">
								<div class="controls">
									<g:textField class="span6" name="term" placeholder="Keyword" />
					            </div>
							</div>
							<div class="control-group">
								<div class="controls">
									<g:textField name="locn" placeholder="URC City"/>
					            </div>
							</div>
							<div class="control-group">
								<label class="control-label" for="Recruitment">Recruitment</label>
								<div class="controls">
									<select class="header3" name="recr" id="Recruitment">
							            <option value="" selected="selected">   All Studies &nbsp;</option>
							            <option value="Open">  Open Studies &nbsp;</option>
							            <option value="Recruiting"> &nbsp; --   Recruiting  &nbsp;</option>
										<option value="Not yet recruiting"> &nbsp; --   Not yet recruiting  &nbsp;</option>
										<option value="Available"> &nbsp; --  Expanded Access: Available  &nbsp;</option>
							            <option value="Closed">  Closed Studies &nbsp;</option>
							            <option value="Active, not recruiting"> &nbsp; --   Active, not recruiting  &nbsp;</option>
							            <option value="Completed"> &nbsp; --   Completed  &nbsp;</option>
							            <option value="Enrolling by invitation"> &nbsp; --   Enrolling by invitation  &nbsp;</option>
							            <option value="Suspended"> &nbsp; --   Suspended  &nbsp;</option>
							            <option value="Terminated"> &nbsp; --   Terminated  &nbsp;</option>
							            <option value="Withdrawn"> &nbsp; --   Withdrawn  &nbsp;</option>
							            <option value="No longer available"> &nbsp; --  Expanded Access: No longer available  &nbsp;</option>
							            <option value="Temporarily not available"> &nbsp; --  Expanded Access: Temporarily not available  &nbsp;</option>
						            </select>
					            </div>
							</div>
							<div class="control-group">
								<label class="control-label" for="StudyType">Study Type</label>
								<div class="controls">
									<select class="header3" name="type" id="StudyType">
							            <option value="">All Studies &nbsp;</option>
							            <option value="Intr">Interventional Studies &nbsp;</option>
							            <option value="Obsr">Observational Studies &nbsp;</option>
							            <option value="PReg"> &nbsp; -- Patient Registries &nbsp;</option>
							            <option value="Expn">Expanded Access Studies &nbsp;</option>
						            </select>
					            </div>
							</div>
							<div class="control-group">
								<g:submitButton name="Search" class="offset1"/>
							</div>
						</g:form>
					</div>
					<div id="nearme" class="fade in tab-pane">
						<g:form class="form-horizontal offset3" controller="location" action="search">
							<div class="control-group">
								<g:textField class="span6" name="term" placeholder="My location" />
							</div>
							<div class="control-group">
								<g:submitButton name="Search"/>
							</div>
						</g:form>
						<div class="offset3">
							<h3>Popular locations</h3>
							<div>
								<g:render template="/location/list" var="location"
										collection="${com.vcare.ctexplorer.Location.list(max:10, order:'desc', sort:'numberOfSearches')}">
								</g:render>
								[<a href="${createLink(controller: 'location')}">Show all locations</a>]
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>