<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="teachings.xsl" />


<xsl:template name="template-head">
	
	<link rel="canonical" href="http://atheycreek.com" />
	<link rel="dns-prefetch" href="//ajax.googleapis.com" />

</xsl:template>



<xsl:template name="template-header-outside-container">
	
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
								<span data-icon="V" style="top: 1px; position: relative"></span>
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

</xsl:template>


<xsl:template name="template-header-inside-container">

	<xsl:variable name="parents" select="//tags-all-entries/entry[ @id = $pt1 ]/parent" />

	<div class="jumbotron masthead" id="overview">
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

	<!-- <h1><xsl:value-of select="//tags-all-entries/entry[@id = $pt1]/tag" /></h1> -->

</xsl:template>


<xsl:template name="template-footer-inside-container">
	
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

</xsl:template>


<xsl:template name="template-column-right-top">

	
	
</xsl:template>


<xsl:template name="template-footer-outside-container">

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