<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
		<title>Keywords</title>
		<r:require module="bootstrap" />
	</head>
	<body>
		<div class="row">
			<div class="well" style="height: 400px; padding-top: 100px;">
				<div class="offset3">
					<h2>All Keywords</h2>
					<div>
						<g:render template="/keywordCache/list" var="keyword"
								collection="${com.vcare.ctexplorer.KeywordCache.list(order:'desc', sort:'numberOfSearches')}">
						</g:render>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>