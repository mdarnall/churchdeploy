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

<!--
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
-->
				<!-- <a class="brand first" href="{$root}">
					<xsl:value-of select="$website-name" disable-output-escaping="yes" />
				</a> -->
				<div>
					<ul class="nav">
						<!-- <li class="entry "><a href="#">Login</a></li> -->
						<!-- <li>
							<a href="http://72.10.33.203/">Prayer Request</a>
						</li> -->
					</ul>
					<ul class="nav pull-right">
						<li><a href="{$root}/24/give/"><span class="icon">&#160;</span>Give</a></li>
						<li class="divider-vertical"></li>
						<li><a href="#"><span class="climacon">m</span><span class="worship">Sunrise Worship - </span>6:30 am</a></li>

						<xsl:if test="//status-all-entries/entry[name = 'ustream-status']/content = 'live'">
							<li class="divider-vertical"></li>
							<li>
								<a href="#">
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

	<!-- Hidden live broadcast modal -->

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

					<a href="{$root}" class="logo">
						<img data-responsimage="logo-big-4fbe1f82408e2.png" style="width: 120px; height: 120px;" />
					</a>
					
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
			<xsl:if test="not($pt1) or $pt1 = 43">

				<div class="row">
					<div class="span8">
						<h2>Welcome to Athey Creek</h2>
						<p style="width: 95%"><!-- We hope this website is helpful in communicating who we are.  -->To put it simply, we are a fellowship of believers that strive to worship God, follow Jesus, study 
the Bible, and serve one another. We believe church is supposed to be like a hospital, a place of healing and refreshment.</p>
					</div>
					<div class="span4">
						<div>
							<div class="link-bar">
							<a href="/7761/meetings/" class="link-home">Meeting Times</a>&#160;&#160;|&#160;&#160;<a href="/13391/im-new-here/" class="link-home">I'm New Here</a>
							</div>
							<blockquote>&#8220;For the bread of God is he which cometh down from heaven, and giveth life unto the world.&#8221;</blockquote>
							<cite>John 6:33</cite>
						</div>

					</div>
				</div>				
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
					<iframe src="http://player.vimeo.com/video/42127479?title=0&amp;byline=0&amp;portrait=0&amp;color=555555" frameborder="0" class="video" webkitallowfullscreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowfullscreen="allowFullScreen" width="620" height="349"></iframe>
					<div class="meta">
						<h2 class="title">Sanctification &amp; the Gospel</h2>
						<p>
							<span class="teacher"><em>by</em> Brett Meador</span>
							<span class="verse"><i class="icon-book"></i> 2 Thessalonians 2:1-12</span>
						</p>
						<p>
							<span class="day">Sunday</span>&#160;&#8226;&#160;
							<span class="date">April 15, 2012</span>
						</p>
					</div>
					<p class="description">This morning, we delve further into 2 Thessalonians as it relates to end times. We turn our attention to what the Bible says about the antichrist, a man of sin and a son of perdition.</p>
				</div>
			</div>	
		</div>
		<div id="sidebar" class="span4 column-right">
			<h3>Upcoming</h3>
 			<ul class="component component-events">
				<li class="entry clearfix odd first"><a href="http://atheycreek/20/events/12947/jr-high-bullwinkle-s-and-burgers/"><div class="date"><div class="month">Jul</div><div class="day">6</div></div><table class="info"><tbody><tr><td>Jr. High Bullwinkle’s and Burgers</td></tr></tbody></table></a><a href="http://atheycreek/symphony/publish/events/edit/12947/" target="blank" class="edit "><i class="icon-pencil"></i></a></li>
				<li class="entry clearfix even middle"><a href="http://atheycreek/20/events/12949/jr-high-boating-bonanza/"><div class="date"><div class="month">Jul</div><div class="day">12</div></div><table class="info"><tbody><tr><td>Jr. High Boating Bonanza</td></tr></tbody></table></a><a href="http://atheycreek/symphony/publish/events/edit/12949/" target="blank" class="edit "><i class="icon-pencil"></i></a></li>
				<li class="entry clearfix odd last"><a href="http://atheycreek/20/events/12952/jr-high-super-sliding-road-trip/"><div class="date"><div class="month">Aug</div><div class="day">17</div></div><table class="info"><tbody><tr><td>Jr. High Super Sliding Road Trip</td></tr></tbody></table></a><a href="http://atheycreek/symphony/publish/events/edit/12952/" target="blank" class="edit "><i class="icon-pencil"></i></a></li>
				<a href="http://atheycreek/20/events/1/5/related/29/" class="more"><span class="icon">l</span><span>See more events</span></a>
			</ul> 

			<xsl:call-template name="component-events">
				<xsl:with-param name="position" select="'column-right'" />
				<xsl:with-param name="entries" select="//events-home-filtered/entry" />
			</xsl:call-template>

		</div>
	</div>
</div>
</xsl:if>

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
	
	<h3>Series</h3>

    <xsl:for-each select="//teachings-series-home-filtered/entry">
        <div class="row">
            <xsl:for-each select=". | following-sibling::*[not(position() >= $items-per-row)]">
            	<div class="span4">
					<a href="">
						<xsl:choose>
							<xsl:when test="string-length(poster/@path)">
								<img data-responsimage="{poster/filename}" style="width: 100%;" />
							</xsl:when>
							<xsl:otherwise>
								<img data-responsimage="accf-flat-4fc3e05b81747.jpg" style="width: 100%;" />
							</xsl:otherwise>
						</xsl:choose>
					</a>
					<a href="#">
						<h4 style="display: inline">
							<xsl:value-of select="title" disable-output-escaping="yes" />
						</h4>
					</a>
					<br />
					<div class="meta" style="display: inline">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="teachings/@items" />
						<xsl:text>&#160;teachings)</xsl:text>
					</div>
				</div>
            </xsl:for-each>
        </div>
    </xsl:for-each>

	<p class="pull-right to-top"><a href="#">Back to top &#160;&#160;&#8613;</a></p>

	<div class="footer">
		<div class="twitter">
			<div class="container">
				<div class="row">
					<div class="span12">
						<xsl:for-each select="//twitter-latest-entry/entry">
							<strong><a href="http://twitter.com/atheycreek/" target="_blank">Recently on Twitter →</a></strong> 
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
					<h4>Main services</h4>
					<p>Saturday at 6:00 PM<br />
					Sunday at 8:30 and 11:00 AM<br />
					Wednesday at 7:00 PM</p>
					<h4>Online Giving</h4>
					<p>Athey Creek Christian Fellowship is supported solely through those who call Athey Creek their church home.</p>
					<p><a href="{$root}/24/give/" class="btn btn-primary give">Give →</a></p>
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
						<xsl:text>9:00 AM to 5:00 PM — Tue., Thr., Fri.</xsl:text><br />
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
						<xsl:text>. All&#160;rights&#160;reserved.</xsl:text>
					<a href="https://www.facebook.com/pages/Athey-Creek-Christian-Fellowship/138279749547289" class="pull-right facebook">Visit us on Facebook</a>				
					</div>
				</div>
			</div>
		</div>
	</div>

</xsl:template>


<xsl:template name="template-column-right-top">

	
	
</xsl:template>


<xsl:template name="template-footer-outside-container">
<!--
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
						"/workspace/themes/active/js/common.js"
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

  -->
	<script type="text/javascript" src="{$workspace}/js/plugins.min.js"></script>
	<script type="text/javascript" src="{$workspace}/themes/active/js/plugins.min.js"></script>
	<script type="text/javascript" src="{$workspace}/themes/active/js/common.js"></script>
	

</xsl:template>


</xsl:stylesheet>