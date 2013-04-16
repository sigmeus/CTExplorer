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
						<g:form class="form-horizontal offset3" controller="search">
							<div class="control-group">
								<g:textField class="span6" name="term" placeholder="Keyword" />
							</div>
							<div class="control-group">
								<g:textField name="locn" placeholder="URC City"/>
							</div>
							<div class="control-group">
								<g:submitButton name="Search"/>
							</div>
						</g:form>
					</div>
					<div id="nearme" class="fade in tab-pane">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>