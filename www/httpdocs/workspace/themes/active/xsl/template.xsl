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

	<link rel="canonical" href="{$current-url}" />
	<xsl:choose>
		<xsl:when test="number($pt1) and $pt1 = 20 and $pt3 or number($pt1) and $pt1 = 20 and $pt3">
			<link rel="shorturl" href="http://accf.co/{$pt3}" />
			<link rel="shortlink" href="http://accf.co/{$pt3}" />
		</xsl:when>
		<xsl:otherwise>
			<link rel="shorturl" href="http://accf.co/{$pt1}" />
			<link rel="shortlink" href="http://accf.co/{$pt1}" />
		</xsl:otherwise>
	</xsl:choose>
	<link rel="dns-prefetch" href="{$root}" />
	<!--
	<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
		<link rel="prerender" href="{$root}/{@id}/{description/@handle}/" />
		<link rel="prefetch" href="{$root}/{@id}/{description/@handle}/" />
	</xsl:for-each>
	<meta http-equiv="x-dns-prefetch-control" content="on" />

	<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
		<link rel="prerender" href="{$root}/{@id}/{description/@handle}/" />
		<link rel="prefetch" href="{$root}/{@id}/{description/@handle}/" />
	</xsl:for-each>
	-->
	<script type="text/javascript">
	<xsl:comment>
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-32000708-1']);
	_gaq.push(['_trackPageview']);

	(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
	//</xsl:comment>
	</script>

</xsl:template>

<xsl:template name="template-header-outside-container">

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<div>
					<ul class="nav pull-left">
						<li class="top-search">
							<form action="get">
								<xsl:call-template name="form-search-action" />
								<label for="keywords"><span class="icon">s</span></label>
								<input name="keywords" class="keywords" placeholder="SEARCH" autocomplete="off" onclick="this.select()" />
							</form>
						</li>
					</ul>
					<xsl:if test="$cookie-username">
						<div class="btn-group pull-right">
						  <button class="btn"><a href="/symphony/">Symphony</a></button>
						  <button class="btn dropdown-toggle" data-toggle="dropdown">
						    <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu">
						    <li>
						    	<a href="?debug">Debug</a>
						    </li>
						    <li>
						    	<a href="{$root}/symphony/logout/">Logout</a>
						    </li>
						  </ul>
						</div>
					</xsl:if>
					<ul class="nav pull-right">
						<li><a href="{$root}/24/give/"><span class="icon">&#160;</span>Give</a></li>
						<li class="divider-vertical"></li>
						<li class="last">
							<a href="{$root}/20/events/12962/tuesday-sunrise-worship/">
								<span class="icon">Z</span>
								<span class="worship">Sunrise Worship - </span>
								<xsl:value-of select="//misc-all-entries/entry[name='sunrise-worship']/content" disable-output-escaping="yes" />
							</a>
						</li>
						<xsl:if test="//status-all-entries/entry[name = 'ustream-status']/content = 'live'">
							<li class="divider-vertical"></li>
							<li>
								<a href="{$root}/24/give/">
									<xsl:attribute name="class">
										<xsl:text>modalLiveLink</xsl:text>
										<xsl:choose>
											<xsl:when test="//status-all-entries/entry[name = 'ustream-status']/content = 'live'">
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
	<div class="modal fade modalLive" id="modalLive">
		<div class="modal-header">
			<a class="close">×</a>
			<h3>
				<xsl:value-of select="$website-name" disable-output-escaping="yes" />
				<xsl:text> — Live</xsl:text>
			</h3>
		</div>
		<div class="modal-body">
			<div class="ustream-embed"></div>
			<span class="url hidden">http://www.ustream.tv/embed/4325662/?autoplay=true</span>
		</div>
	</div>
	<div class="header mast" id="overview">
		<div class="container">
			<xsl:call-template name="alerts" />
			<div class="row">
				<div class="span12">
					<a href="{$root}" class="logo standard">
						<span class="icon">2</span>
						<span class="icon white">,</span>
					</a>
					<ul class="main nav nav-pills">
						<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
							<xsl:call-template name="subnav-entry" />
						</xsl:for-each>
					</ul>
				</div>
			</div>
			<xsl:if test="not($pt1) or $pt1 = 43">
				<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='welcome']/content)" disable-output-escaping="yes" />
			</xsl:if>
		</div>
	</div>
	<xsl:if test="not($pt1) or $pt1 = 43">
		<div class="container main-container">
			<div class="row home">
				<div id="main-content" class="span8 column-center">
					<h3>Featured</h3>
					<div class="component component-teachings large">
						<div class="latest">
							<xsl:for-each select="//teachings-featured-filtered/entry">
								<xsl:call-template name="teaching-entry" />
							</xsl:for-each>
						</div>
					</div>
				</div>
				<div class="span4 column-right">
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="'column-right'" />
						<xsl:with-param name="entries" select="//events-3-latest/entry" />
					</xsl:call-template>
				</div>
			</div>
		</div>
	</xsl:if>

</xsl:template>


<xsl:template name="template-header-inside-container">

	<xsl:variable name="parent" select="//tags-all-entries/entry[@id = $pt1]/parent/item/@id" />

	<xsl:if test="$pt1 and not($pt1 = //tags-all-entries/entry[tag/@handle = 'home']/@id)">
		<div class="jumbotron masthead" id="overview">
			<div class="subnav">
				<xsl:for-each select="//tags-all-entries/entry[@id = $pt1]/parent/item/@id">
					<xsl:call-template name="nav-tier" />
				</xsl:for-each>
				<xsl:call-template name="subnav-group">
					<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $pt1 and not(hide-from-header = 'Yes')]" />
				</xsl:call-template>
			</div>
		</div>
	</xsl:if>

</xsl:template>


<xsl:template name="nav-tier">

	<xsl:variable name="node" select="." />

	<xsl:for-each select="//tags-all-entries/entry[@id = $node]/parent/item/@id">
		<xsl:call-template name="nav-tier" />
	</xsl:for-each>
	<xsl:call-template name="subnav-group">
		<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $node and not(hide-from-header = 'Yes')]" />
	</xsl:call-template>

</xsl:template>


<xsl:template name="template-footer-inside-container">

	<xsl:if test="not($pt1) or $pt1 = 43">
		<div class="component-series">
			<h3>Recent Series</h3>
			<div class="row">
			    <xsl:for-each select="//teachings-series-home-filtered/entry">
	            	<div class="span4 series">
						<a>
							<xsl:call-template name="url-teachings-series" />
							<xsl:call-template name="teaching-poster-or-default">
								<xsl:with-param name="poster" select="poster" />
							</xsl:call-template>
						</a>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:if>

	<xsl:if test="not($pt1) or $pt1 = 43">
		<div class="component-teachings recent">
			<h3>Recent teachings</h3>
			<div class="row teachings-front">
			    <xsl:for-each select="//teachings-3-latest/entry">
	            	<div class="span4 recent">
						<a>
							<xsl:call-template name="url-teachings" />
							<xsl:call-template name="teaching-poster-or-default">
								<xsl:with-param name="poster" select="poster" />
							</xsl:call-template>
						</a>
						<a>
							<xsl:call-template name="url-teachings" />
							<h4>
								<xsl:value-of select="title" disable-output-escaping="yes" />
							</h4>
						</a>
						<div class="meta">
							<p>
								<xsl:call-template name="date-teaching">
									<xsl:with-param name="date" select="date/date/start/@iso" />
								</xsl:call-template>
							</p>
						</div>
						<div class="description">
							<xsl:call-template name="truncate">
								<xsl:with-param name="node" select="description" />
								<xsl:with-param name="length" select="90" />
							</xsl:call-template>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:if>

	<div class="row to-top">
		<p class="pull-right"><a href="#">Back to top <span class="icon">{</span></a></p>
	</div>
	<div class="footer">
		<div class="twitter">
			<div class="container">
				<div class="row">
					<div class="span12">
						<xsl:for-each select="//twitter-latest-entry/entry">
							<strong><a href="http://twitter.com/atheycreek/" target="_blank">Recently on Twitter →</a></strong>
							<span>
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
								<xsl:attribute name="id">
									<xsl:text>page</xsl:text>
									<xsl:value-of select="@id" />
								</xsl:attribute>
								<a href="{$root}/{@id}/{description/@handle}/">
									<xsl:call-template name="url-tags" />
									<xsl:value-of select="tag" />
								</a>
							</li>
							<xsl:variable name="parents" select="@id"/>
							<xsl:for-each select="//tags-all-entries/entry[parent/item/@id = $parents and not(hide-from-footer = 'Yes') ]">
								<xsl:call-template name="subnav-entry" />
							</xsl:for-each>
						</ul>
					</div>
				</xsl:for-each>
				<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='footer']/content)" disable-output-escaping="yes" />
			</div>
		</div>
		<div class="baseline">
			<div class="container">
				<div class="row">
					<div class="span12">
						<span class="facebook">
							<a href="https://www.facebook.com/pages/Athey-Creek-Christian-Fellowship/138279749547289" class="pull-right">Visit us on Facebook</a>
						</span>
						<div class="copyright">
						   <span class="dev">
						       <a href="{$root}/13563/our-website/"><strong>Built with Church Deploy</strong></a>
						       <span class="divider">|</span>
						       <a href="{$root}/13667/api/"><strong>API</strong></a>
						       <span class="divider">|</span>
						       <a href="mailto:web@atheycreek.com?subject=ACCF Web Support"><strong>Website Support</strong></a>
							   <br />
						   </span>
							<xsl:text>© </xsl:text>
							<xsl:value-of select="$this-year" />
							<xsl:text>. </xsl:text>
							<a href="{$root}"><xsl:value-of select="$website-name" /></a>
							<xsl:text>. All&#160;rights&#160;reserved. </xsl:text>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</xsl:template>


<xsl:template name="template-column-right-top"></xsl:template>


<xsl:template name="template-footer-outside-container">

	<script type="text/javascript">
		<xsl:comment>
		(function (window) {
			'use strict';
			function downloadJSAtOnload() {
				var js = {
					"scripts":[
						"/workspace/themes/active/js/common-ck.js"
					]
				}; 
        var supportsJson = (!!window.JSON &amp;&amp; !!JSON.parse);

        if(!supportsJson){
          js.scripts.push("/workspace/js/json2.min.js");
        }

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
			} else if (window.attachEvent) {
				window.attachEvent("onload",downloadJSAtOnload);
			} else {
				window.onload=downloadJSAtOnload;
			}
		}(window));
		//</xsl:comment>
	</script>

</xsl:template>


</xsl:stylesheet>
