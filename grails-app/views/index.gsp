<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
		<title>Welcome to Clinical Trials Reloaded</title>
		<r:require module="bootstrap" />
	</head>
	<body>
		<div class="hero-unit">
			<h1>Search for Clinical Trials</h1>
		</div>
		<div class="row">
			<div class="well" style="height: 200px; padding-top: 100px;">
				<ul class="nav nav-pills offset3">
					<li class="active">
						<a href="#search" data-toggle="tab">Search</a>
					</li>
					<li><a href="#advanced" data-toggle="tab">Advanced</a></li>
				</ul>
				<div class="tab-content">
					<div id="search" class="tab-pane active">
						<g:form class="form-horizontal offset3" controller="search">
							<g:textField class="span6" name="term" placeholder="Keyword" />
						</g:form>
					</div>
					<div id="advanced" class="tab-pane">
						<g:form class="form-horizontal offset3" controller="search">
							<div class="control-group">
								<g:textField class="span6" name="term" placeholder="Keyword" />
							</div>
							<div class="control-group">
								<g:textField name="locn" placeholder="URC City"/>
							</div>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>