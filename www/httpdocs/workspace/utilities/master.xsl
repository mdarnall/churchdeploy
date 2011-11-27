<?xml 
    version="1.0" 
    encoding="UTF-8"
    ?>
    
<xsl:stylesheet 
    version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	>
	
<xsl:output
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding="UTF-8"
    method="xml" 
    omit-xml-declaration="yes" 
    indent="yes" 
    />



<xsl:include href="date-time.xsl" />
<xsl:include href="toolkit.xsl" />



<xsl:variable name="member-is-logged-in" select="boolean(//events/member-login-info/@logged-in = 'yes')"/>



<xsl:template match="/">
	
	<xsl:comment><![CDATA[[if lt IE 7]> <html class="no-js ie6 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 7]> <html class="no-js ie7 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]> <html class="no-js ie8 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if gt IE 8]><!]]></xsl:comment><html class="no-js" lang="en"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>
	
		<head>
            
            <title>
            	<!--Ministries | -->
            	<xsl:value-of select="$website-name" />
            </title>
            
            <!--link-->
            
	            <link rel="dns-prefetch" href="//ajax.googleapis.com" />
	            <link rel="sitemap" type="application/xml" title="Sitemap" href="{$root}/sitemap.xml" />
	
			<!--meta-->
			
				<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
				<meta http-equiv="imagetoolbar" content="false" />
				
				<meta name="description" content="{//advanced-seo/entry[name='description']/content}" />
				<meta name="author" content="{$website-name}" />
				<meta name="viewport" content="width=device-width,initial-scale=1" />
				
				<!-- Pinned Site Name for IE9/Windows 7+ -->
				
					<meta name="application-name" content="{$website-name}" />
					<meta name="msapplication-tooltip" content="{//advanced-seo/entry[name='msapplication-tooltip']/content}" />
					<meta name="msapplication-starturl" content="{//advanced-seo/entry[name='msapplication-starturl']/content}" />
			
			<!--stylesheets-->
			
				<link rel="stylesheet" href="{$workspace}/bootstrap/bootstrap.min.css" />
				<link rel="stylesheet" href="{$workspace}/css/main.css" />
			
			<!--javascript-->
				
				<script type="text/javascript" src="http://use.typekit.com/tix6unz.js"></script>
				<script type="text/javascript">try{Typekit.load();}catch(e){}</script>

		</head>
		
		<body>
			
			<xsl:attribute name="class">
				<xsl:text>page-</xsl:text>
				<xsl:value-of select="$current-page" />
			</xsl:attribute>
			
			<div class="header clearfix">
			
				<div class="topnav clearfix">
				
					<div class="wrapper">
				
						<!--<a href="/" class="logo">Athey Creek Christian Fellowship</a>-->
						<ul id="nav">
							
							<xsl:for-each select="//content-tags/entry">

								<xsl:if test="not(parent/item)">

									<li>
										
										<xsl:attribute name="class">
											<xsl:if test="$pt1 = tag/@handle">
												<xsl:text>active</xsl:text>
											</xsl:if>
										</xsl:attribute>
										
										<a href="{$root}/{$url-language}/{tag/@handle}/">
										
											<!--<xsl:attribute name="title">
												<xsl:value-of select="description" />
											</xsl:attribute>-->
											
											<xsl:value-of select="tag" />
										
										</a>
									</li>

								</xsl:if>
							
							</xsl:for-each>
							
						</ul>
				
					</div>
				
				</div>
				
				<div class="wrapper lower">
					<a href="{$root}" class="logomark" title="Home">
						<xsl:value-of select="$website-name" />
					</a>
					<h1>
						<xsl:choose>
							<xsl:when test="$pt2">
								<xsl:value-of select="//content-tags/entry/tag[ @handle = $pt2 ]/../description" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//content-tags/entry/tag[ @handle = $pt1 ]/../description" />
							</xsl:otherwise>
						</xsl:choose>
						
					</h1>
				</div>
				
			</div>
					
			<div class="content clearfix" role="main">
			
				<ul class="sub-menu">
					
					<xsl:for-each select="//content-tags/entry[ parent/item/@handle = $pt1 ]">
						
						<li>
							
							<xsl:attribute name="class">
								<xsl:if test="$pt2 = tag/@handle">
									<xsl:text>active</xsl:text>
								</xsl:if>
							</xsl:attribute>
							
							<a href="{$root}/{$url-language}/{$pt1}/{tag/@handle}/">
							
								<!--<xsl:attribute name="title">
									<xsl:value-of select="description" />
								</xsl:attribute>-->
								
								<xsl:value-of select="tag" />
							
							</a>
						</li>
					
					</xsl:for-each>
					
				</ul>
				
				<div class="feature">
					
					<img src="http://placehold.it/920x400/1A1A19/f4faff&amp;text=Sweet+Picture" width="920" height="400" />
				
					<blockquote class="scripture clearfix">I will therefore that men pray every where, lifting up holy hands, without wrath and doubting.<span class="verse">1 Timothy 2:8</span></blockquote>
				
				</div>
				
				<div class="col-1">
					
					<h3 class="subtitle">Kids of all ages have every opportunity to learn, grow and have fun at our fellowship.</h3>
				
					<p>Thanks for checking out our Children’s Ministry web page. The Lord has blessed us with a great bunch of kids at Athey Creek. We enjoy sharing the love of Jesus with them in a safe and secure environment. Feel free to click on the links on this page to get a better understanding of children’s ministry at Athey Creek.</p>
				
					<p>If you are looking for a way to plug into our Children’s Ministry, we ask that you sign up at the Children’s Ministry table in the Kid's Lobby. We will contact you about the process itself, and give you the information you will need as you pray through your involvement. If you simply want more information on our Children’s Ministry, please look through our Document Library.</p>
					
				</div>
				
				<div class="col-2">
					<ul class="event-box"><h3 class="side-header">Upcoming Events</h3>
						<li class="event grade-school">
							<div class="date">
								<span class="month">Jun</span>
								<span class="day">22</span>
							</div>
							<div class="info">
								<span class="description">Men's Breakfast</span>
								<span class="location">Sanctuary, Church Building</span>
							</div>
						</li>
						<li class="event grade-school even">
							<div class="date">
								<span class="month">Jul</span>
								<span class="day">5</span>
							</div>
							<div class="info">
								<span class="description">Snowshoe Adventure</span>
								<span class="location">Mt. Hood National Forest</span>
							</div>
						</li>
						<li class="event grade-school last">
							<div class="date">
								<span class="month">Dec</span>
								<span class="day">25</span>
							</div>
							<div class="info">
								<span class="description">Early Morning Worship</span>
								<span class="location">Bryn's House</span>
							</div>
						</li>
					</ul>
					<div class="leader-contact">
						<h3 class="side-header">Leader Contact</h3>
					</div>
					<div class="resources">
						<h3 class="resources-header">Resources</h3>
					</div>
		
				</div>
			
			</div>
				
			<div class="footer">
			
				<p>© <xsl:value-of select="$this-year" />. <xsl:value-of select="$website-name" />. All rights reserved.</p>
			
			</div>
				
			<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
			
			<!--<script type="text/javascript"><![CDATA[window.jQuery || document.write(']]><script type="text/javascript" src="{$workspace}/js/libs/jquery-1.6.4.min.js"></script><![CDATA[')]]></script>-->
			
			<script type="text/javascript" src="{$workspace}/js/libs/jquery-1.6.4.min.js"></script>
				
			<!-- scripts concatenated and minified via build script -->
			
				<script type="text/javascript" defer="defer" src="{$workspace}/js/plugins.js"></script>
				<script type="text/javascript" defer="defer" src="{$workspace}/js/script.js"></script>
		
			<!-- end scripts -->
			
			<!-- Asynchronous Google Analytics snippet. Change UA-XXXXX-X to be your site's ID.
			mathiasbynens.be/notes/async-analytics-snippet -->
			
			<script type="text/javascript">
				var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview'],['_trackPageLoadTime']];
				(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
				g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
				s.parentNode.insertBefore(g,s)}(document,'script'));
			</script>
			
			<!-- Prompt IE 6 users to install Chrome Frame. Remove this if you want to support IE 6.
			chromium.org/developers/how-tos/chrome-frame-getting-started -->
			
			<xsl:comment><![CDATA[[if lt IE 7 ]>
			<script type="text/javascript" defer="defer" src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
			<script type="text/javascript" defer="defer">window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
			<![endif]]]></xsl:comment>
				
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
            
		</body>
		
	</html>
	
</xsl:template>

</xsl:stylesheet>