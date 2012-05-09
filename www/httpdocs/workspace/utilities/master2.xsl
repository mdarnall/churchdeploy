<?xml
    version="1.0"
    encoding="UTF-8"
    ?>



<xsl:stylesheet
    version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	>



<xsl:param name="url-language" />



<xsl:output
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding="UTF-8"
    method="xml"
    omit-xml-declaration="yes"
    indent="yes"
    />
    


<xsl:include href="alerts.xsl" />
<xsl:include href="classes.xsl" />
<xsl:include href="components.xsl" />
<xsl:include href="date-time-advanced.xsl" />
<xsl:include href="date-utilities.xsl" />
<xsl:include href="pagination.xsl" />
<xsl:include href="teachings.xsl" />
<xsl:include href="toolkit.xsl" />



<xsl:param name="cookie-username" />


<!-- Defaults:start -->
<xsl:variable name="events-entries-per-page" select="'5'" />
<!-- Defaults:end -->



<xsl:variable name="member-is-logged-in" select="boolean(//events/member-login-info/@logged-in = 'yes')"/>



<xsl:template match="/">

	<xsl:comment><![CDATA[[if lt IE 7]> <html class="no-js ie6 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 7]> <html class="no-js ie7 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]> <html class="no-js ie8 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if gt IE 8]><!]]></xsl:comment><html class="no-js" lang="en"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>

		<head>

            <title>
            	<xsl:value-of select="$website-name" />
            </title>

            <link rel="dns-prefetch" href="//ajax.googleapis.com" />

            <!-- This is in the HTML5 boilerplate, but breaks validation

            <link rel="sitemap" type="application/xml" title="Sitemap" href="{$root}/sitemap.xml" />
			<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
			<meta http-equiv="imagetoolbar" content="false" />
			-->

			<meta name="description" content="{//seo-all-entries/entry[name='description']/content}" />
			<meta name="author" content="{$website-name}" />
			<meta name="viewport" content="width=device-width,initial-scale=1" />
			<meta name="application-name" content="{$website-name}" />
			<meta name="msapplication-tooltip" content="{//seo-all-entries/entry[name='msapplication-tooltip']/content}" />
			<meta name="msapplication-starturl" content="{//seo-all-entries/entry[name='msapplication-starturl']/content}" />

			<link rel="stylesheet" href="{$workspace}/bootstrap/docs/assets/css/bootstrap.css" />
			<link rel="stylesheet" href="{$workspace}/bootstrap/docs/assets/css/bootstrap-responsive.css" />
			<link rel="stylesheet" href="{$workspace}/themes/active/css/common.css" />

			<!-- Typekit

			<script type="text/javascript" src="http://use.typekit.com/tix6unz.js"></script>
			<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
			-->

		</head>

		<body data-spy="scroll" data-target=".subnav" data-offset="50">

			<xsl:attribute name="class">

				<xsl:text>page-</xsl:text>
				<xsl:value-of select="$current-page" />

				<xsl:text> </xsl:text>

				<xsl:text>layout-</xsl:text>
				<xsl:value-of select="//layouts-ds-tags-entries-by-tag/entry/name/@handle" />

			</xsl:attribute>

			<div class="navbar navbar-fixed-top">

				<div class="navbar-inner">

					<div class="container">

						<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</a>
						<!-- <a class="brand first" href="{$root}">
							<xsl:value-of select="$website-name" disable-output-escaping="yes" />
						</a> -->
						<div class="nav-collapse">
							<ul class="nav">
								<!-- <li class="entry "><a href="#">Login</a></li> -->
								<!-- <li>
									<a href="http://72.10.33.203/">Prayer Request</a>
								</li> -->
							</ul>
							<ul class="nav pull-right">
								<li><a href="#"><span data-icon="t"></span>6:30am</a></li>
								<!-- <li class="divider-vertical"></li> -->
								<li>
									<a href="#">
										<xsl:attribute name="class">
											<xsl:text>modalLiveLink</xsl:text>
											<xsl:choose>
												<xsl:when test="//xml-ustreamcom/xml/results/status = 'live'">
													<xsl:text> online</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text> offline</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<span data-icon="V"></span>
										<xsl:text>Live</xsl:text>
										<xsl:call-template name="live-status"/>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<!-- Hidden live broadcast modal -->

			<div class="modal fade modalLive" id="modalLive">
				<div class="modal-header">
					<a class="close">×</a>
					<h3>
						<xsl:value-of select="$website-name" disable-output-escaping="yes" />
						<xsl:text> — Live</xsl:text>
						<xsl:call-template name="live-status"/>
					</h3>
				</div>
				<div class="modal-body">
					<xsl:for-each select="//xml-ustreamcom/xml/results">
						<div class="ustream-embed"></div>
						<span class="url hidden">http://www.ustream.tv/embed/<xsl:value-of select="id" disable-output-escaping="yes" />/?autoplay=true</span>
					</xsl:for-each>
				</div>
			</div>

			<header class="mast" id="overview">
				<div class="container">
					<xsl:call-template name="alerts" />
					<div class="row">
						<div class="span12">
							<div class="logo"><a href="{$root}"></a></div>
							<ul class="main nav nav-pills">
								<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
									<xsl:variable name="entry-id" select="@id" />
									<li>
										<xsl:call-template name="class-rows">
											<xsl:with-param name="nav" select="true()"/>
										</xsl:call-template>
										<a href="{$root}/{@id}/{description/@handle}/">
											<xsl:call-template name="tag-href" />
											<xsl:value-of select="tag" />
										</a>
									</li>
								</xsl:for-each>
							</ul>
						</div>
					</div>
				</div>
			</header>

			<div class="container" id="main">

				<xsl:variable name="parents" select="//tags-all-entries/entry[ @id = $pt1 ]/parent" />

				<div class="jumbotron masthead" id="overview">

					<h1><xsl:value-of select="//tags-all-entries/entry[@id = $pt1]/tag" /></h1>

					<xsl:if test="
						count( //tags-all-entries/entry[ parent/item/@id = $parents/item/@id and not(hide-from-header = 'Yes')] ) or
						count( //tags-all-entries/entry[ parent/item/@id = $pt1 and not(hide-from-header = 'Yes')] )
					">

						<div class="subnav">

							<ul class="nav nav-pills">
							
								<xsl:call-template name="subnav">
									<xsl:with-param name="parents" select="$parents" />
								</xsl:call-template>
							
							</ul>

						</div>

					</xsl:if>

				</div>

				<div class="row">
					<section id="main-content" class="span12 column-center">

						<xsl:choose>
							<xsl:when test="count(//layouts-ds-tags-entries-by-tag/entry)">
								<xsl:call-template name="call-components">
									<xsl:with-param name="xpath" select="//layouts-ds-tags-entries-by-tag/entry"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="call-components">
									<xsl:with-param name="xpath" select="//layouts-default/entry"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>

					</section>
				</div>

				<p class="pull-right to-top"><a href="#">Back to top &#160;&#160;&#8613;</a></p>
				
				<footer>
					<div class="container">
						<div class="row">
							<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-footer = 'Yes') ]">
								<xsl:variable name="entry-id" select="@id" />
								<div class="span2">
									<ul class="nav nav-list">
										<li class="nav-header">
											<a href="{$root}/{@id}/{description/@handle}/">
												<xsl:call-template name="tag-href" />
												<xsl:value-of select="tag" />
											</a>
										</li>
										<xsl:call-template name="subnav">
											<xsl:with-param name="instance" select="'footer'" />
											<xsl:with-param name="parents" select="@id" />
										</xsl:call-template>
									</ul>							
								</div>
							</xsl:for-each>
							
							<div class="span2">
								<h4>Online Giving</h4>
								<p>Athey Creek Christian Fellowship is supported solely through those who call Athey Creek their church home.</p>
								<p><a href="#" class="btn btn-primary give">Give →</a></p>
							</div>
							<div class="span2">
								<h4><xsl:value-of select="$website-name" /></h4>
								<address>
									27520 SW 95th Ave.<br />
									Wilsonville, Oregon 97070<br />
									<abbr title="Phone">P:</abbr> (971) 327-2123
								</address>
								<h4>Office Hours</h4>
								<p>
									9:00 AM to 5:00 PM — Tues., Thr., Fri.<br />
									9:00 AM to 12:00 PM — Wed.<br />
									Closed Monday
								</p>
							</div>
						</div>
					</div>
					<div class="finish">
						<div class="container">
							<div class="row">
								<p>
									<xsl:text>© </xsl:text>
									<xsl:value-of select="$this-year" />
									<xsl:text>. </xsl:text>
									<a href="{$root}"><xsl:value-of select="$website-name" /></a>
									<xsl:text>. All rights reserved.</xsl:text>
								</p>
							</div>
						</div>
					</div>
				</footer>
			</div>

			<script type="text/javascript" src="{$workspace}/js/jquery-1.7.1.min.js"></script>
			<script type="text/javascript" src="{$workspace}/js/jquery-ui.custom.min.js"></script>
			<script type="text/javascript" src="{$workspace}/js/jquery.color.js"></script>
			<script type="text/javascript" src="{$workspace}/js/plugins.js"></script>
			<script type="text/javascript" src="{$workspace}/js/jquery.cookie.js"></script>

			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-alert.js"></script>
			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-button.js"></script>
			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-carousel.js"></script>
			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-collapse.js"></script>
			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-dropdown.js"></script>
			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-modal.js"></script>			
			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-scrollspy.js"></script>
			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-tab.js"></script>
			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-tooltip.js"></script>
			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-transition.js"></script>
			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-typeahead.js"></script>
			<script type="text/javascript" src="{$workspace}/bootstrap/js/bootstrap-popover.js"></script>

			<script type="text/javascript" src="{$workspace}/bootstrap/docs/assets/js/google-code-prettify/prettify.js"></script>
			<script type="text/javascript" src="{$workspace}/bootstrap/docs/assets/js/application.js"></script>

			<script type="text/javascript" src="{$workspace}/themes/active/js/common.js"></script>

			<!-- Prompt IE 6 users to install Chrome Frame. Remove this if you want to support IE 6.
			chromium.org/developers/how-tos/chrome-frame-getting-started -->

			<xsl:comment><![CDATA[[if lt IE 7 ]>
			<script type="text/javascript" defer="defer" src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
			<script type="text/javascript" defer="defer">window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
			<![endif]]]></xsl:comment>

			<!--

			Throwing error => see http://stackoverflow.com/questions/1386312/resource-interpreted-as-other-but-transferred-with-mime-type-text-javascript
			
			<script type="text/javascript" src="{$workspace}/js/reftagger.js"></script>

			<script type="text/javascript">
				Logos.ReferenceTagging.lbsBibleVersion = "KJV";
				Logos.ReferenceTagging.lbsLinksOpenNewWindow = true;
				Logos.ReferenceTagging.lbsLogosLinkIcon = "dark";
				Logos.ReferenceTagging.lbsNoSearchTagNames = [ "h1", "h2", "h3" ];
				Logos.ReferenceTagging.lbsTargetSite = "biblia";
				Logos.ReferenceTagging.tag();
				Logos.ReferenceTagging.lbsCssOverride = true;
			</script>

			-->
			<script src="http://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js"></script>
			<script>
			  WebFont.load({
			    typekit: {
			      id: 'tix6unz'
			    }
			  });
			</script>

		</body>

	</html>

</xsl:template>



<xsl:template name="call-components">
	
	<xsl:param name="xpath" />

	<xsl:call-template name="component">
		<xsl:with-param name="xpath" select="$xpath/column-full-width" />
	</xsl:call-template>

	<div class="row">

		<xsl:call-template name="component">
			<xsl:with-param name="xpath" select="$xpath/column-center" />
		</xsl:call-template>

		<xsl:call-template name="component">
			<xsl:with-param name="xpath" select="$xpath/column-right" />
		</xsl:call-template>

	</div>

</xsl:template>		



<xsl:template name="tag-href">

	<xsl:attribute name="href">

		<xsl:value-of select="$root" disable-output-escaping="yes" />
		<xsl:text>/</xsl:text>

		<xsl:value-of select="@id" disable-output-escaping="yes" />
		<xsl:text>/</xsl:text>

		<xsl:choose>
			<xsl:when test="string-length(slug)">
				<xsl:value-of select="slug/@handle" disable-output-escaping="yes" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="tag/@handle" disable-output-escaping="yes" />
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>/</xsl:text>

	</xsl:attribute>

</xsl:template>



<xsl:template name="subnav">

	<xsl:param name="instance" />
	<xsl:param name="parents" />

	<xsl:choose>
		<xsl:when test="$instance = 'footer'">

			<xsl:for-each select="//tags-all-entries/entry[ parent/item/@id = $parents ]">
				<xsl:call-template name="subnav-entry" />
			</xsl:for-each>

		</xsl:when>
		<xsl:otherwise>

			<xsl:for-each select="//tags-all-entries/entry[ parent/item/@id = $parents/item/@id ]">
				<xsl:call-template name="subnav-entry" />
			</xsl:for-each>

			<xsl:for-each select="//tags-all-entries/entry[ parent/item/@id = $pt1 and not(hide-from-header = 'Yes') ]">
				<xsl:call-template name="subnav-entry" />
			</xsl:for-each>

		</xsl:otherwise>
	</xsl:choose>

</xsl:template>



<xsl:template name="subnav-entry">

	<li>

		<xsl:attribute name="class">

			<xsl:text>entry </xsl:text>

			<xsl:if test="$pt1 = @id">
				<xsl:text>active</xsl:text>
			</xsl:if>

		</xsl:attribute>

		<a>
			<xsl:call-template name="tag-href" />
			<xsl:value-of select="tag" />
		</a>

	</li>

</xsl:template>

<xsl:template name="live-status">
	<xsl:choose>
		<xsl:when test="//xml-ustreamcom/xml/results/status = 'live'">
			<span class="status"> (broadcasting)</span>
		</xsl:when>
		<xsl:otherwise>
			<span class="status"> (idle)</span>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>



</xsl:stylesheet>

<!--
			<div class="container">

				<div class="page-header clearfix">

					<div class="nav clearfix">

						<div class="wrapper">

						</div>

					</div>

					<div class="wrapper lower">

						<a href="{$root}" class="logomark" title="Home">
							<xsl:value-of select="$website-name" />
						</a>

						<h1>

							<xsl:choose>
								<xsl:when test="$pt1">
									<xsl:value-of select="//tags-all-entries/entry[ @id = $pt1 ]/description" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="//tags-all-entries/entry[ @id = 43 ]/description" />
								</xsl:otherwise>
							</xsl:choose>

						</h1>

					</div>

				</div>

			</div> -->