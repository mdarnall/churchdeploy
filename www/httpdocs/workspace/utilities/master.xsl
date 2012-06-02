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

<xsl:include href="../utilities/alerts.xsl" />
<xsl:include href="../utilities/classes.xsl" />
<xsl:include href="../utilities/components.xsl" />
<xsl:include href="../utilities/date-time-advanced.xsl" />
<xsl:include href="../utilities/date-utilities.xsl" />
<xsl:include href="../utilities/pagination.xsl" />
<xsl:include href="../utilities/toolkit.xsl" />
<xsl:include href="../utilities/url-encode.xsl" />

<xsl:include href="../themes/active/xsl/template.xsl" />

<xsl:param name="cookie-username" />
<xsl:param name="url-language" />

<xsl:variable name="pt1" select="'43'" />
<xsl:variable name="events-entries-per-page" select="'5'" />
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

			<!-- <link rel="stylesheet" href="{$workspace}/bootstrap/css/bootstrap-combined.min.css" /> -->
			<link rel="stylesheet" href="{$workspace}/themes/active/css/common.css" />

			<meta charset="utf-8" />

			<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
			<meta http-equiv="imagetoolbar" content="false" />

			<meta name="description" content="{//seo-all-entries/entry[name='description']/content}" />
			<meta name="author" content="{$website-name}" />
			<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
			<meta name="application-name" content="{$website-name}" />
			<meta name="msapplication-tooltip" content="{//seo-all-entries/entry[name='msapplication-tooltip']/content}" />
			<meta name="msapplication-starturl" content="{//seo-all-entries/entry[name='msapplication-starturl']/content}" />
			<meta name="responsimage" 
				data-server="{$root}/image/2/width/height/anchor/0/uploads/images/leaderboards/filename" 
				data-static="{$workspace}/img/spacer.gif"
				data-loading="{$workspace}/img/loading.gif"
			/>
			<link rel="apple-touch-icon-precomposed" href="{$workspace}/themes/active/img/apple-touch-icon.png" />

			<xsl:call-template name="template-head"/>

			<!-- <xsl:comment><![CDATA[[if IE 6]><link rel="stylesheet" type="text/css" href="]]><xsl:value-of select="$root"/><![CDATA[/workspace/assets/css/ie6patches-1.0.css" media="screen" /><![endif]]]></xsl:comment> -->

			
		</head>

		<body data-spy="scroll" data-target=".subnav" data-offset="50">

			<xsl:attribute name="class">
				<xsl:text>pageid-</xsl:text>
				<xsl:choose>
					<xsl:when test="$pt1">
						<xsl:value-of select="$pt1" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="//tags-all-entries/entry[tag/@handle = 'home']/@id" />
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:text>layout-</xsl:text>
				<xsl:value-of select="//layouts-ds-tags-entries-by-tag/entry/name/@handle" />
				<xsl:if test="number($pt3)">
					<xsl:text> profile</xsl:text>
				</xsl:if>
			</xsl:attribute>

			<xsl:if test="not($pt1 = 'toolkit')">
				<xsl:call-template name="edit-entry">
					<xsl:with-param name="link">
						<xsl:choose>
							<xsl:when test="$pt1">
								<xsl:value-of select="concat($root, '/symphony/publish/tags/edit/', $pt1, '/')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($root, '/symphony/publish/tags/edit/',//tags-all-entries/entry[tag/@handle = 'home']/@id , '/')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
					<xsl:with-param name="class" select="'edit-tag'" />
				</xsl:call-template>
				<a href="{$root}/symphony/logout/" style="position: absolute; top: 10px; left: 10px; z-index: 1000">Logout</a>				
			</xsl:if>
			
			<xsl:call-template name="template-header-outside-container"/>
			
			<div class="container main-container">
				<xsl:call-template name="template-header-inside-container"/>
				

				<xsl:choose>
					<xsl:when test="$pt1 = 'toolkit' and $cookie-username">
						<xsl:call-template name="toolkit" />
					</xsl:when>
					<xsl:otherwise>
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
					</xsl:otherwise>
				</xsl:choose>

				<xsl:call-template name="template-footer-inside-container"/>
			</div>

			<xsl:call-template name="template-footer-outside-container"/>
		
		</body>

	</html>

</xsl:template>


<xsl:template name="call-components">
	
	<xsl:param name="xpath" />

	<div class="row">
		<div class="span12">
			<xsl:call-template name="component">
				<xsl:with-param name="xpath" select="$xpath/column-full-width" />
			</xsl:call-template>
		</div>	
	</div>
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


<xsl:template name="topnav">

	<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
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
				<xsl:value-of select="tag" disable-output-escaping="yes" />
			</a>
		</li>
	</xsl:for-each>

</xsl:template>


<xsl:template name="nav-footer">

	<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-footer = 'Yes') ]">
		<xsl:variable name="entry-id" select="@id" />
		<div class="span2">
			<ul class="nav nav-list">
				<li class="nav-header">
					<a href="{$root}/{@id}/{description/@handle}/">
						<xsl:call-template name="tag-href" />
						<xsl:value-of select="tag" disable-output-escaping="yes" />
					</a>
				</li>
				<xsl:call-template name="subnav">
					<xsl:with-param name="instance" select="'footer'" />
					<xsl:with-param name="parents" select="@id" />
				</xsl:call-template>
			</ul>
		</div>
	</xsl:for-each>

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
			<xsl:value-of select="tag" disable-output-escaping="yes" />
		</a>
	</li>

</xsl:template>


<xsl:template name="edit-entry">
	
	<xsl:param name="link" />
	<xsl:param name="class" />

	<xsl:if test="$cookie-username">
		<a href="{$link}" target="blank">
			<xsl:attribute name="class">
				<xsl:text>edit </xsl:text>
				<xsl:if test="$class">		
					<xsl:value-of select="$class" />
				</xsl:if>
			</xsl:attribute>
			<i class="icon-pencil"></i>
		</a>
	</xsl:if>

</xsl:template>



</xsl:stylesheet>