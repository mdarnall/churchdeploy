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
	<xsl:comment><![CDATA[[if IE 7]>    <html class="no-js ie7 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]>    <html class="no-js ie8 oldie" lang="en" /> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if gt IE 8]><!]]></xsl:comment><html class="no-js" lang="en"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>
	
		<head>
            
            <link rel="dns-prefetch" href="//ajax.googleapis.com" />
            <link rel="sitemap" type="application/xml" title="Sitemap" href="{$root}/sitemap.xml" />
            
            <title>
            
                <xsl:value-of select="$website-name" />
                
            </title>
            
            <meta name="title" content="{$website-name}" />
            
            <meta property="og:image" content="{$workspace}/images/facebook.jpg" />
            <meta property="og:title" content="{$website-name}" />
            
            <meta name="keywords" content="" />
            <meta name="description" content="" />
            	
			<link rel="shortcut icon" href="{$workspace}/images/favicon.ico" />
			<!--<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/prettyPhoto.css" />-->		
			<link rel="stylesheet" type="text/css" href="{$workspace}/css/common.css" />
			
			<xsl:if test="$current-page = 'home'">
				<link rel="stylesheet" type="text/css" href="{$workspace}/css/slideshow.css" />
			</xsl:if>
			
			<link rel="stylesheet" href="{$workspace}/bootstrap/bootstrap.min.css" />
			<link rel="stylesheet" type="text/css" href="{$workspace}/css/common.css" />
			
            <xsl:comment><![CDATA[[if IE]><link rel="stylesheet" type="text/css" href="]]><xsl:value-of select="$workspace"/><![CDATA[/css/ie.css" media="screen" /><![endif]]]></xsl:comment>
  
		</head>
		
		<body class="page-{$current-page}">

            <div class="container">

                <xsl:apply-templates />
            
            </div>

			<xsl:element name="script">
                
                <!-- 
                
                Minify scripts 
                
            	( keep in mind, the URL can only be so long, 
            	too many files below and it will fail, 
            	if you have too many files, combine a few ) 
            	
            	-->
                
                <xsl:attribute name="type">text/javascript</xsl:attribute>
                    
                <xsl:attribute name="src">
                	
                    <xsl:value-of select="$workspace" />
                    <xsl:text>/min/f=</xsl:text>
                    
					<xsl:text>workspace/js/jquery-1.4.4.min.js,</xsl:text>
					<xsl:text>workspace/js/jquery-ui-1.8.7.custom.min.js,</xsl:text>
					<xsl:text>workspace/js/jquery.prettyPhoto.js,</xsl:text>
					<xsl:text>workspace/js/jquery.cycle.all.js,</xsl:text>
					<!--<xsl:text>workspace/js/jquery.cookie.js,</xsl:text>-->
					<!--<xsl:text>workspace/js/jquery.url.js,</xsl:text>-->
					<!--<xsl:text>workspace/js/jquery.widowFix-1.3.1.min.js,</xsl:text>-->
					<!--<xsl:text>workspace/js/jquery.animate-shadow-min.js,</xsl:text>-->
					<!--<xsl:text>workspace/js/jquery.timers.js,</xsl:text>-->
					<!--<xsl:text>workspace/js/slideshow.js,</xsl:text>-->
					<!--<xsl:text>workspace/js/jquery.animate.clip.1.0.0.js,</xsl:text>-->
					<!--<xsl:text>workspace/js/jquery.cycle.all.js,</xsl:text> -->
					<xsl:text>workspace/js/html5.js</xsl:text>	
                    
                </xsl:attribute>
			
			</xsl:element>
			
			<!--
			<script src="https://www.google.com/jsapi?key=ABQIAAAAeF7bVForzA_cqNUZNR1L2RRXhIxTuxlM4sHqZt4SzuM4PhOh6RSHYx4L7KSwlVE9MdL0ckWNr7HYkA" type="text/javascript"></script>
			<script type="text/javascript">
				<xsl:text>google.load('jquery', '1');</xsl:text>
				<xsl:text>google.load('jqueryui', '1');</xsl:text>
			</script>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			-->
			
			<script src="{$workspace}/js/common.js"></script>
            
		</body>
		
		
	</html>
	
</xsl:template>



</xsl:stylesheet>