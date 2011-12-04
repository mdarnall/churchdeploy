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



<xsl:include href="date-time-advanced.xsl" />
<xsl:include href="toolkit.xsl" />
<xsl:include href="classes.xsl" />
<xsl:include href="components.xsl" />



<xsl:variable name="pt1" select="'43'" />
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
				
				<meta name="description" content="{//seo-all-entries/entry[name='description']/content}" />
				<meta name="author" content="{$website-name}" />
				<meta name="viewport" content="width=device-width,initial-scale=1" />
				
				<!-- Pinned Site Name for IE9/Windows 7+ -->
				
					<meta name="application-name" content="{$website-name}" />
					<meta name="msapplication-tooltip" content="{//seo-all-entries/entry[name='msapplication-tooltip']/content}" />
					<meta name="msapplication-starturl" content="{//seo-all-entries/entry[name='msapplication-starturl']/content}" />
			
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
				
						<ul id="nav">
							
							<xsl:for-each select="//tags-all-entries/entry[ not( @id = 43 ) ]">

								<xsl:if test="not(parent/item)">

									<li>
										
										<xsl:attribute name="class">
											<xsl:if test="$pt1 = @id or //tags-all-entries/entry[ @id = $pt1 ]/parent/item/@id = @id">
												<xsl:text>active</xsl:text>
											</xsl:if>
										</xsl:attribute>
										
										<a href="{$root}/{@id}/{description/@handle}/">
											
											<xsl:call-template name="tag-href" />
											
											<!--<xsl:attribute name="title">
												<xsl:value-of select="description" />
											</xsl:attribute>-->
											
											<xsl:value-of select="tag" />
										
										</a>
									</li>

								</xsl:if>
							
							</xsl:for-each>
						</ul>
						<a href="{$root}" class="logo" title="Home">
							<xsl:value-of select="$website-name" />
						</a>
						
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
					
			<div class="content clearfix" role="main">
				
				<xsl:variable name="parents" select="//tags-all-entries/entry[ @id = $pt1 ]/parent" />
							
				<xsl:if test="
					count( //tags-all-entries/entry[ parent/item/@id = $parents/item/@id ] ) or
					count( //tags-all-entries/entry[ parent/item/@id = $pt1 ] )
				">
				
					<ul class="sub-menu">
						
						<xsl:for-each select="//tags-all-entries/entry[ parent/item/@id = $parents/item/@id and not( @id = 43 ) ]">
							<xsl:call-template name="nav-submenu-item" />
						</xsl:for-each>
						
						<xsl:for-each select="//tags-all-entries/entry[ parent/item/@id = $pt1 and not( @id = 43 ) ]">
							<xsl:call-template name="nav-submenu-item" />
						</xsl:for-each>
						
					</ul>
					
				</xsl:if>
				
				<div class="feature">
					
					<xsl:call-template name="component-image">
						<xsl:with-param name="position" select="'full-width'" />
					</xsl:call-template>
					
					<xsl:call-template name="component-verse">
						<xsl:with-param name="position" select="'full-width'" />
					</xsl:call-template>
				
				</div>
				
				<div class="col-1">
				
					<xsl:value-of select="//text-entries-by-tag/entry/content" disable-output-escaping="yes" />
					
					<xsl:call-template name="component-member">
						<xsl:with-param name="position" select="'column-center'" />
					</xsl:call-template>

				</div>
				
				<div class="col-2">
					
					<xsl:call-template name="component-event">
						<xsl:with-param name="position" select="'column-right'" />
					</xsl:call-template>
					
					<xsl:call-template name="component-member">
						<xsl:with-param name="position" select="'column-right'" />
					</xsl:call-template>
					
					<div class="resources"><h3 class="resources-header">Resources</h3></div>
		
				</div>
			
			</div>
				
			<div class="footer">
			
				<p>
					<xsl:text>© </xsl:text>
					<xsl:value-of select="$this-year" />
					<xsl:text>. </xsl:text>
					<a href="{$root}">
						<xsl:value-of select="$website-name" />
					</a>
					<xsl:text>. All rights reserved.</xsl:text>
				</p>
			
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



<xsl:template name="nav-submenu-item">

	<li>
		
		<xsl:attribute name="class">
			<xsl:if test="$pt1 = @id">
				<xsl:text>active</xsl:text>
			</xsl:if>
		</xsl:attribute>
		
		<a>
			<xsl:call-template name="tag-href" />
			
			<!--<xsl:attribute name="title">
				<xsl:value-of select="description" />
			</xsl:attribute>-->
			
			<xsl:value-of select="tag" />
		
		</a>
		
	</li>
	
</xsl:template>



<xsl:template name="tag-href">

	<xsl:attribute name="href">
	
		<xsl:value-of select="$root" disable-output-escaping="yes" />
		<xsl:text>/</xsl:text>
		
		<xsl:value-of select="@id" disable-output-escaping="yes" />
		<xsl:text>/</xsl:text>
		
		<xsl:if test="count(parent/item)">
			<xsl:value-of select="parent/item/@handle" disable-output-escaping="yes" />
			<xsl:text>/</xsl:text>
		</xsl:if>
		
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



</xsl:stylesheet>