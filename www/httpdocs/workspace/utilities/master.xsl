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
    indent="no" 
    />



<xsl:include href="date-time.xsl" />



<xsl:template match="/">

	<html>
	
		<head>
            
            <title>
            
                <xsl:value-of select="$website-name" />
                
                <xsl:variable name="title" select="//data/pages/entry/name[ @handle = $current-page ]" />
                
                <xsl:if test="$current-page != 'home' and $page-title">
                	<xsl:text> | </xsl:text>
                	<xsl:value-of select="$page-title" />
                </xsl:if>
                
                <!-- <xsl:if test="$current-page = 'blog' and ">
                	<xsl:text> | </xsl:text>
                	<xsl:value-of select="//blog-entry-by-id/entry/title" />
                </xsl:if> -->
                
            </title>
            
            <meta name="title" content="{$website-name}" />
            <meta property="og:image" content="{$workspace}/images/facebook.jpg" />
            <meta property="og:title" content="{$website-name}" />
            <meta name="keywords" content="wholesale, manufacturing, private label, activewear, sportswear, intimates, shapewear, swimwear, fashion, apparel, global" />
            <meta name="description" content="Trimera Group is a global business operating in retail, wholesale and manufacturing; selling products in Better and Contemporary Sportswear, Men’s and Women’s Activewear, Kids Apparel, Team Apparel, Intimates, Shapewear and Swimwear." />
            <meta name = "format-detection" content = "telephone=no" />
            	
			<link rel="shortcut icon" href="{$workspace}/images/favicon.ico" />
			<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/prettyPhoto.css" />		
			<!-- <link rel="stylesheet" type="text/css" href="{$workspace}/php/lessc.php?a=../less/common.less" /> -->
			<link rel="stylesheet" type="text/css" href="{$workspace}/css/common.css" />
			
			<xsl:if test="$current-page = 'home'">
				<link rel="stylesheet" type="text/css" href="{$workspace}/css/slideshow.css" />
			</xsl:if>
			
			<link rel="stylesheet" type="text/css" href="{$workspace}/css/common.css" />
			
            <xsl:comment><![CDATA[[if IE]><link rel="stylesheet" type="text/css" href="]]><xsl:value-of select="$workspace"/><![CDATA[/css/ie.css" media="screen" /><![endif]]]></xsl:comment>
  
		</head>
		
		<body class="page-{$current-page}">

            <div class="container">
                    
                </div>
                
                <xsl:apply-templates />
                
                <div class="footer">

                	

                </div>         
            
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
					<!--      <xsl:text>workspace/js/jquery.cookie.js,</xsl:text>-->
					<!-- <xsl:text>workspace/js/jquery.url.js,</xsl:text> -->
					<!--    <xsl:text>workspace/js/jquery.widowFix-1.3.1.min.js,</xsl:text>-->
					<!-- <xsl:text>workspace/js/jquery.animate-shadow-min.js,</xsl:text>
					<xsl:text>workspace/js/jquery.timers.js,</xsl:text>-->
					<!--  <xsl:text>workspace/js/slideshow.js,</xsl:text> -->
					<!--   <xsl:text>workspace/js/jquery.animate.clip.1.0.0.js,</xsl:text>-->
					<!-- <xsl:text>workspace/js/jquery.cycle.all.js,</xsl:text> -->
					<xsl:text>workspace/js/html5.js</xsl:text>
                    
                </xsl:attribute>
			
			</xsl:element>
			
			<script src="{$workspace}/js/common.js"></script>
            
		</body>
		
	</html>
	
</xsl:template>



<!-- 

Global date formatting

-->
<xsl:template name="date-with-format">

    <div class="date">
        <xsl:call-template name="format-date">
            <xsl:with-param name="date" select="date" />
            <xsl:with-param name="format" select="'m x, Y'" />
        </xsl:call-template>
    </div>

</xsl:template>



<!-- 

How to start a URL when using multi-lingual

-->
<xsl:template name="root">

    <xsl:choose>
    	<xsl:when test="$url-language">
            <xsl:value-of select="concat($root, '/', $url-language, '/')" />
    	</xsl:when>
    	<xsl:otherwise>
    		<xsl:value-of select="concat($root, '/')" />
    	</xsl:otherwise>
    </xsl:choose>
    
</xsl:template>



<!-- 

Removes HTML tags

-->
<xsl:template name="remove-html">
    <xsl:param name="text"/>
    <xsl:choose>
        <xsl:when test="contains($text, '&lt;')">
            <xsl:value-of select="normalize-space(substring-before($text, '&lt;'))"/>
            <xsl:text> </xsl:text>
            <xsl:call-template name="remove-html">
                <xsl:with-param name="text" select="normalize-space(substring-after($text, '&gt;'))"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="normalize-space($text)"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>



<!-- 

Strip out spaces in source

-->
<xsl:strip-space elements="*"/>

<xsl:template name="nbsp">
    
    <xsl:param name="text" />
    
    <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$text" />
        <xsl:with-param name="replace" select="' '" />
        <xsl:with-param name="by" select="'&#160;'" />
    </xsl:call-template>

</xsl:template>



<!-- 

Search and replace

-->
<xsl:template name="string-replace-all">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="by"/>
    <xsl:choose>
        <xsl:when test="contains($text,$replace)">
            <xsl:value-of select="substring-before($text,$replace)"/>
            <xsl:value-of select="$by"/>
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="substring-after($text,$replace)"/>
                <xsl:with-param name="replace" select="$replace"/>
                <xsl:with-param name="by" select="$by"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$text"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>



</xsl:stylesheet>