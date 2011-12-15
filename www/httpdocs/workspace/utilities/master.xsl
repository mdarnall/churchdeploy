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
<xsl:include href="pagination.xsl" />



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

			<div class="page-header clearfix">
			
				<div class="nav clearfix">
				
					<div class="wrapper">
				
						<xsl:call-template name="nav-1" />
						
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
				
				<xsl:if test="$current-page = 'teachings'">
					<xsl:call-template name="teachings" />
				</xsl:if>
				
				
				<xsl:variable name="parents" select="//tags-all-entries/entry[ @id = $pt1 ]/parent" />
							
				<xsl:if test="
					count( //tags-all-entries/entry[ parent/item/@id = $parents/item/@id ] ) or
					count( //tags-all-entries/entry[ parent/item/@id = $pt1 ] )
				">
				
					<xsl:call-template name="nav-2">
						<xsl:with-param name="parents" select="$parents" />
					</xsl:call-template>
					
				</xsl:if>
				
				<xsl:choose>
					
					<xsl:when test="count(//tags-entries-by-tag-layouts/entry)">
					
						<xsl:call-template name="component">
							<xsl:with-param name="xpath" select="//tags-entries-by-tag-layouts/entry/column-full-width" />
						</xsl:call-template>
						
						<xsl:call-template name="component">
							<xsl:with-param name="xpath" select="//tags-entries-by-tag-layouts/entry/column-center" />
						</xsl:call-template>
						
						<xsl:call-template name="component">
							<xsl:with-param name="xpath" select="//tags-entries-by-tag-layouts/entry/column-right" />
						</xsl:call-template>
						
					</xsl:when>
					
					<xsl:otherwise>
					
						<xsl:call-template name="component">
							<xsl:with-param name="xpath" select="//layouts-default-entry/entry/column-full-width" />
						</xsl:call-template>
						
						<xsl:call-template name="component">
							<xsl:with-param name="xpath" select="//layouts-default-entry/entry/column-center" />
						</xsl:call-template>
						
						<xsl:call-template name="component">
							<xsl:with-param name="xpath" select="//layouts-default-entry/entry/column-right" />
						</xsl:call-template>
						
					</xsl:otherwise>
					
				</xsl:choose>
				
				
							
			</div>
				
			<div class="footer clearfix">
				<div class="wrapper">
					<xsl:call-template name="nav-1">
						<xsl:with-param name="show-nested" select="1" />
					</xsl:call-template>
				</div>
			</div>
			
			<div class="smallprint">
				<div class="wrapper">
					<xsl:text>© </xsl:text>
					<xsl:value-of select="$this-year" />
					<xsl:text>. </xsl:text>
					<a href="{$root}">
						<xsl:value-of select="$website-name" />
					</a>
					<xsl:text>. All rights reserved.</xsl:text>
				</div>
			</div>
				
			<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
			
			<!--<script type="text/javascript"><![CDATA[window.jQuery || document.write(']]><script type="text/javascript" src="{$workspace}/js/libs/jquery-1.6.4.min.js"></script><![CDATA[')]]></script>-->
			
			<script type="text/javascript" src="{$workspace}/js/libs/jquery-1.6.4.min.js"></script>
			<script type="text/javascript" src="{$workspace}/js/libs/jquery-ui.custom.min.js"></script>
				
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




<xsl:template name="nav-1">

	<xsl:param name="show-nested" />

	<ul class="nav-1">
		
		<xsl:for-each select="//tags-all-entries/entry[ not( @id = 43 ) ]">
			
			<xsl:if test="not(parent/item)">
				
				<xsl:variable name="entry-id" select="@id" />
				
				<li>
					
					<xsl:attribute name="class">
						
						<xsl:text>entry </xsl:text>
					
						<xsl:if test="$pt1 = @id or //tags-all-entries/entry[ @id = $pt1 ]/parent/item/@id = @id">
							<xsl:text>active</xsl:text>
						</xsl:if>
						
					</xsl:attribute>
					
					<a href="{$root}/{@id}/{description/@handle}/">
						<xsl:call-template name="tag-href" />
						<xsl:value-of select="tag" />
					</a>
					
					<xsl:if test="$show-nested">
											
						<xsl:call-template name="nav-2">
							<xsl:with-param name="instance" select="'footer'" />
							<xsl:with-param name="parents" select="@id" />
						</xsl:call-template>
						
					</xsl:if>
					
				</li>

			</xsl:if>
		
		</xsl:for-each>
		
	</ul>

</xsl:template>


<xsl:template name="nav-2">
	
	<xsl:param name="instance" />
	<xsl:param name="parents" />
	
	<ul class="nav-2">
		
		<xsl:choose>
			<xsl:when test="$instance = 'footer'">
			
				<xsl:for-each select="//tags-all-entries/entry[ parent/item/@id = $parents and not( @id = 43 ) ]">
					<xsl:call-template name="nav-2-entry" />
				</xsl:for-each>
				
			</xsl:when>
			<xsl:otherwise>
			
				<xsl:for-each select="//tags-all-entries/entry[ parent/item/@id = $parents/item/@id and not( @id = 43 ) ]">
					<xsl:call-template name="nav-2-entry" />
				</xsl:for-each>
				
				<xsl:for-each select="//tags-all-entries/entry[ parent/item/@id = $pt1 and not( @id = 43 ) ]">
					<xsl:call-template name="nav-2-entry" />
				</xsl:for-each>
				
			</xsl:otherwise>
		</xsl:choose>
		
	</ul>

</xsl:template>



<xsl:template name="nav-2-entry">

	<li>
		
		<xsl:attribute name="class">
			
			<xsl:text>entry </xsl:text>
			
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








<xsl:template name="teachings">
	
	<div class="teachings">
		
		<xsl:choose>
			<xsl:when test="$pt2 = 'date' and $pt3 = 'latest'">
				
				<xsl:call-template name="search-results">
					<xsl:with-param name="results" select="//teachings-all-entries" />
				</xsl:call-template>
				
			</xsl:when>
			<xsl:otherwise>	
			
				<xsl:call-template name="search-results">
					<xsl:with-param name="results" select="//teachings-all-entries" />
				</xsl:call-template>
				
			</xsl:otherwise>
		</xsl:choose>
		
		
		
		
		
		<h3>Filter</h3>
		
		<div class="section">
		
			<h4>Old Testament</h4>
			
			<p>
				<xsl:for-each select="//static-xml-books-of-the-bible/books-of-the-bible/entry[ testament/@handle = 'old-testament' ]">
					
					<a href="#">
						<xsl:value-of select="name" disable-output-escaping="yes" />
					</a>
					
					<xsl:if test="position() &lt; last()">, </xsl:if>
					
				</xsl:for-each>
			</p>
		</div>
		
		<div class="section">
		
			<h4>New Testament</h4>
			
			<p>
				<xsl:for-each select="//static-xml-books-of-the-bible/books-of-the-bible/entry[ testament/@handle = 'new-testament' ]">
					
					<a href="#">
						<xsl:value-of select="name" disable-output-escaping="yes" />
					</a>
					
					<xsl:if test="position() &lt; last()">, </xsl:if>
					
				</xsl:for-each>
			</p>
			
		</div>
		
		
	</div>

</xsl:template>



<xsl:template name="search-results">
	
	<xsl:param name="results" />
	
	<h3>Results</h3>
	
	<div class="search-results">
	
		<xsl:if test="$results/pagination/@total-entries = 0">
			No entries here, try <a href="{$root}/teachings/{$pt1}/{$pt2}/1/{$pt4}/">page 1</a>.
		</xsl:if>
		
		<xsl:call-template name="element-page-navigation">
			<xsl:with-param name="results" select="$results" />
		</xsl:call-template>
		
		<xsl:for-each select="$results/entry">
	
			<div class="entry">
	
				<h5 class="title">
					<a href="#">
						<xsl:value-of select="msg-title" disable-output-escaping="yes" />
					</a>
				</h5>
				
				<div class="description">
					<xsl:value-of select="msg-description" disable-output-escaping="yes" />
				</div>
				
				<div class="details">
					
					<a href="">
						<xsl:value-of select="book" disable-output-escaping="yes" />
					</a>
					<xsl:text> </xsl:text>
					<xsl:value-of select="msg-chapter" disable-output-escaping="yes" />
						
					<xsl:text>&#160;&#160;|&#160;&#160;</xsl:text>
					
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="msg-date" />
						<xsl:with-param name="format" select="'%m+; %d;%ds;, %y+;'" />
					</xsl:call-template>
					
					<xsl:text>&#160;&#160;|&#160;&#160;</xsl:text>
						
					<a href="http://66.147.244.244/~atheycre/teachings/{msg-number}.lq.mp3">Download MP3</a>
					
				</div>
				
			</div>
				
		</xsl:for-each>	
		
		<xsl:call-template name="element-page-navigation">
			<xsl:with-param name="results" select="$results" />
		</xsl:call-template>
		
	</div>

</xsl:template>



<xsl:template name="element-page-navigation">
	
	<xsl:param name="results" />
	
	<xsl:if test="$results/pagination/@total-entries > 0">
		
		<p>
			Showing 
			<xsl:value-of select="$pt4" disable-output-escaping="yes" /> 
			of 
			<xsl:value-of select="$results/pagination/@total-entries" disable-output-escaping="yes" /> 
			entries
		</p> 
		
		<div class="page-navigation clearfix">
		
			<xsl:call-template name="pagination">
			
				<xsl:with-param name="pagination" select="$results/pagination" />
				<xsl:with-param name="pagination-url" select="concat( $root, '/', $current-page, '/', $pt1, '/', $pt2, '/', '$', '/', $pt4 )" />
				<xsl:with-param name="show-range" select="5" />
				
				<xsl:with-param name="label-previous" select="'← Previous'" />
				<xsl:with-param name="label-next" select="'Next →'" />
				
				<xsl:with-param name="class-pagination" select="'pagination'" />
				<xsl:with-param name="class-page" select="''" />
				<xsl:with-param name="class-next" select="'next'" />
				<xsl:with-param name="class-previous" select="'prev'" />
				<xsl:with-param name="class-selected" select="'active'" />
				<xsl:with-param name="class-disabled" select="'disabled'" />
				<xsl:with-param name="class-ellipsis" select="'disabled'" />
				
			</xsl:call-template>
		
			
			<div class="number-to-display pagination">
				<ul>
					<li class="description disabled">
						<a href="">Show</a>
					</li>
					<li>
						<xsl:if test="$pt4 = 5">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/teachings/{$pt1}/{$pt2}/{$pt3}/5/">5</a>
					</li>
					<li>
						<xsl:if test="$pt4 = 10">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/teachings/{$pt1}/{$pt2}/{$pt3}/10/">10</a>
					</li>
					<li>
						<xsl:if test="$pt4 = 25">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/teachings/{$pt1}/{$pt2}/{$pt3}/25/">25</a>
					</li>
					<li>
						<xsl:if test="$pt4 = 50">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/teachings/{$pt1}/{$pt2}/{$pt3}/50/">50</a>
					</li>
					<li class="next">
						<xsl:if test="$pt4 = 100">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/teachings/{$pt1}/{$pt2}/{$pt3}/100/">100</a>
					</li>
				</ul>
			</div>
		
		</div>
			
	</xsl:if>
	

	
<!--	<div class="pagination">
	  <ul>
	    <li class="prev disabled"><a href="#">← Previous</a></li>
	    <li class="active"><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li class="next"><a href="#">Next →</a></li>
	  </ul>
	</div>-->

</xsl:template>








</xsl:stylesheet>