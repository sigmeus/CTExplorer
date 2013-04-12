<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Clinical Trials Reloaded"/></title>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<nav id="menu" class="navbar navbar-fixed-top">

			<div class="navbar-inner">

				<div class="container">
					<a href="${createLink(uri: '/')}" class="visible-desktop" id="logo_venturacare"></a>
					<a href="${createLink(uri: '/')}" class="hidden-desktop" id="logo_venturacare_small"></a>
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>

					<a class="brand" href="${createLink(uri: '/')}">CTExplorer</a>

					<div class="nav-collapse">
						<ul class="nav">
							
						</ul>
						<ul class="nav pull-right">
							<li class="dropdown"><a href="${createLink(uri: '/about')}" ><i class="icon-white icon-question-sign"></i> About</a></li>
   
      					</ul>
					</div>
				</div>
			</div>
		</nav>
		<div class="container" style="margin-top:55px; margin-bottom:65px;">
			<g:layoutBody/>
			<div class="footer">
				Designed by <a target="_blank" href="http://www.ventura-care.com">VenturaCare</a>, Data provided by <a href="http://clinicaltrials.gov">http://clinicaltrials.gov</a>
			</div>
		</div>
		
		<r:layoutResources />
	</body>
</html>
