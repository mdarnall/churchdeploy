<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding="UTF-8"
    method="xml"
    omit-xml-declaration="yes"
    indent="no"
    />


<xsl:template name="template-head">
	
	<link rel="canonical" href="http://atheycreek.com" />

	<!-- <meta http-equiv="x-dns-prefetch-control" content="on" />
	<link rel="dns-prefetch" href="{$root}" />
	<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
		<link rel="prerender" href="{$root}/{@id}/{description/@handle}/" />
		<link rel="prefetch" href="{$root}/{@id}/{description/@handle}/" />
	</xsl:for-each> -->

<!-- 	<script type="text/javascript">
	<xsl:comment>
	var _gaq = _gaq || [];
	//_gaq.push(['_setAccount', 'UA-XXX']);
	_gaq.push(['_trackPageview']);

	(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
	//</xsl:comment>
	</script> -->

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
						<li><a href="/24/give/"><span class="icon">&#160;</span>Give</a></li>
						<li class="divider-vertical"></li>
						<li><a href="#"><span class="icon">t</span>6:30am</a></li>
						<!-- <li class="divider-vertical"></li> -->

						<xsl:if test="//xml-ustreamcom/xml/results/status = 'live'">
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
									<span class="icon">V</span>
									<xsl:text>Live</xsl:text>									
								</a>
							</li>
						</xsl:if>
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

	<div class="header mast" id="overview">
		<div class="container">
			<xsl:call-template name="alerts" />
			<div class="row">
				<div class="span12">
					<div class="logo"><a href="{$root}"></a></div>
					<ul class="main nav nav-pills">
						<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
							<xsl:variable name="entry-id" select="@id" />
							<li>
								<xsl:choose>
									<xsl:when test="
										@id = $pt1 or 
										//tags-all-entries/entry[ @id = $pt1 ]/parent/item/@id = @id
										">
										<xsl:call-template name="class-rows">
											<xsl:with-param name="nav" select="true()"/>
											<xsl:with-param name="class" select="'active'" />
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="class-rows">
											<xsl:with-param name="nav" select="true()"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
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
	</div>

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

	<div class="footer">
		<div class="twitter">
			<div class="container">
				<div class="row">
					<div class="span12">
						<xsl:for-each select="//twitter-latest-entry/entry">
							<strong><a href="http://twitter.com/{user/@handle}/" target="_blank">Recently on Twitter →</a></strong> 
							<span>
								<!-- <a href="http://twitter.com/{user/@handle}/status/{id/@handle}" target="_blank"> -->
								<xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
							</span>
						</xsl:for-each>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-nav container">
			<div class="row">
					<div class="span2">
						<ul class="nav nav-list">
							<li class="nav-header"><a href="/21/teachings/">Teachings</a></li><br />
							<li class="nav-header"><a href="/20/events/">Events</a></li><br />
							<li class="nav-header"><a href="/7761/meetings/">Meetings</a></li><br />
							<li class="nav-header"><a href="/23/missions/">Missions</a></li><br />
						</ul>
					</div>
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
				<div class="span3">
					<h4>Online Giving</h4>
					<p>Athey Creek Christian Fellowship is supported solely through those who call Athey Creek their church home.</p>
					<p><a href="#" class="btn btn-primary give">Give →</a></p>
				</div>
				<div class="span3">
					<h4><xsl:value-of select="$website-name" /></h4>
					<address>
						<xsl:text>27520 SW 95th Ave.</xsl:text><br />
						<xsl:text>Wilsonville, Oregon 97070</xsl:text><br />
						<abbr title="Phone">P:</abbr><xsl:text> (971) 327-2123</xsl:text>
					</address>
					<h4>Office Hours</h4>
					<p>
						<xsl:text>9:00 AM to 5:00 PM — Tues., Thr., Fri.</xsl:text><br />
						<xsl:text>9:00 AM to 12:00 PM — Wed.</xsl:text><br />
						<xsl:text>Closed Monday</xsl:text>
					</p>
				</div>
			</div>
		</div>
		<div class="baseline">
			<div class="container">
				<div class="row">
					<div class="span12">
						<xsl:text>© </xsl:text>
						<xsl:value-of select="$this-year" />
						<xsl:text>. </xsl:text>
						<a href="{$root}"><xsl:value-of select="$website-name" /></a>
						<xsl:text>. All rights reserved.</xsl:text>
					<a href="http://www.facebook.com/groups/AtheyCreek" class="pull-right facebook">Visit us on Facebook</a>				
					</div>
				</div>
			</div>
		</div>
	</div>

</xsl:template>


<xsl:template name="template-column-right-top">

	
	
</xsl:template>


<xsl:template name="template-footer-outside-container">

	<script type="text/javascript">
		<xsl:comment>
		(function (window){
			'use strict';
			function downloadJSAtOnload(){

				var _gaq = _gaq || [];
				//_gaq.push(['_setAccount', 'UA-XXX']);
				_gaq.push(['_trackPageview']);

				var js = {
					"scripts":[
						"/workspace/js/plugins.min.js",
						"/workspace/themes/active/js/plugins.min.js",
						"/workspace/themes/active/js/common.min.js"
					]
				};

				for (var key in js.scripts) {
					if (js.scripts[key]) {
						var element=document.createElement("script");
						element.src=js.scripts[key];
						document.body.appendChild(element);
					}
				}
			}

			if(window.addEventListener) {
				window.addEventListener("load",downloadJSAtOnload,false);
			} else if (window.attachEvent){
				window.attachEvent("onload",downloadJSAtOnload); 
			} else { 
				window.onload=downloadJSAtOnload;
			}
		}(window));
		//</xsl:comment>
	</script>


>>>>>>> Stashed changes
<!-- 
	<script type="text/javascript" src="{$workspace}/js/plugins.min.js"></script>
	<script type="text/javascript" src="http://use.typekit.com/tix6unz.js"></script>
	<script type="text/javascript" src="{$workspace}/themes/active/js/common.js"></script>
 -->

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