<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../themes/active/xsl/downloads.xsl" />
<xsl:include href="../themes/active/xsl/events.xsl" />
<xsl:include href="../themes/active/xsl/images.xsl" />
<xsl:include href="../themes/active/xsl/locations.xsl" />
<xsl:include href="../themes/active/xsl/members-roles.xsl" />
<xsl:include href="../themes/active/xsl/search.xsl" />
<xsl:include href="../themes/active/xsl/spacer.xsl" />
<xsl:include href="../themes/active/xsl/teachings.xsl" />
<xsl:include href="../themes/active/xsl/text.xsl" />
<xsl:include href="../themes/active/xsl/verses.xsl" />
<xsl:include href="../themes/active/xsl/videos.xsl" />


<xsl:template name="component">
	
	<xsl:param name="xpath" />
	
	<xsl:if test="count($xpath/item)">

		<xsl:choose>
			<xsl:when test="name($xpath) = 'column-full-width'">

				<div class="column-full-width">
					<xsl:call-template name="component-populate">
						<xsl:with-param name="xpath" select="$xpath" />
					</xsl:call-template>
				</div>

			</xsl:when>
			<xsl:when test="name($xpath) = 'column-center'">

				<div id="main-content" class="span8 column-center">
					<xsl:call-template name="component-populate">
						<xsl:with-param name="xpath" select="$xpath" />
					</xsl:call-template>
				</div>

			</xsl:when>
			<xsl:when test="name($xpath) = 'column-right'">
				
				<div id="sidebar" class="span4 column-right">

					<xsl:call-template name="template-column-right-top" />

					<xsl:call-template name="component-populate">
						<xsl:with-param name="xpath" select="$xpath" />
					</xsl:call-template>
				</div>

			</xsl:when>
		</xsl:choose>

	</xsl:if>
	
</xsl:template>



<xsl:template name="component-populate">
	
	<xsl:param name="xpath" />

	<xsl:for-each select="$xpath/item/label/@handle">
	
		<xsl:if test=". = 'downloads'">
			<xsl:call-template name="component-downloads">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="//downloads-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
	
		<xsl:if test=". = 'events'">

			<xsl:choose>

				<!-- Single ID -->
				<xsl:when test="count(//events-entry-by-id/entry)"> 
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//events-entry-by-id/entry" />
						<xsl:with-param name="single" select="true()" />
					</xsl:call-template>
				</xsl:when>

				<!-- Related entried -->
				<xsl:when test="count(//events-entries-by-tag-related/entry) and $pt5 = 'related'">
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//events-entries-by-tag-related/entry" />
					</xsl:call-template>
				</xsl:when>

				<!-- Past entries -->
				<xsl:when test="count(//events-all-entries-past-filtered/entry) and $pt5 = 'past'">
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//events-all-entries-past-filtered/entry" />
					</xsl:call-template>
				</xsl:when>

				<!-- Current entries -->
				<xsl:when test="$pt2 = 'events'">
					<!-- <xsl:when test="count(//events-all-entries-filtered/entry)"> -->
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//events-all-entries-filtered/entry" />
					</xsl:call-template>
				</xsl:when>

				<!-- Tagged entries -->
				<xsl:otherwise>
					<xsl:call-template name="component-events">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//events-entries-by-tag/entry" />
					</xsl:call-template>
				</xsl:otherwise>

			</xsl:choose>

		</xsl:if>
	
		<xsl:if test=". = 'images'">
			<xsl:call-template name="component-images">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="//images-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
		
		<xsl:if test=". = 'locations'">

			<xsl:choose>

				<xsl:when test="count(//events-entry-by-id/entry)"> <!-- if there are events, show associated locations -->
					<xsl:call-template name="component-locations">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//events-entry-by-id/entry/location/item" />
					</xsl:call-template>
				</xsl:when>

				<xsl:otherwise>
					<xsl:call-template name="component-locations">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//locations-entries-by-tag/entry" />
					</xsl:call-template>
				</xsl:otherwise>

			</xsl:choose>
			
		</xsl:if>
		
		<xsl:if test=". = 'members-roles'">
			<xsl:call-template name="component-members-roles">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="//members-roles-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if test=". = 'search'">
			<xsl:call-template name="component-search">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="//search/entry" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if test=". = 'spacer'">
			<xsl:call-template name="component-spacer" />
		</xsl:if>

		<xsl:if test=". = 'teachings'">
			<xsl:choose>

				<xsl:when test="number($pt3)">					
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//teachings-entry-by-id/entry" />
					</xsl:call-template>
				</xsl:when>

				<xsl:when test="$pt2 = 'teachings' and $pt3 = 'book'">					
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//teachings-entry-by-book-filtered/entry" />
					</xsl:call-template>
				</xsl:when>

				<xsl:when test="$pt2 = 'series'">					
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//teachings-series-entries-filtered/entry/teachings/item" />
					</xsl:call-template>
				</xsl:when>
				
				<xsl:when test="$pt2 = 'teachings' and $pt3 = 'tag'">					
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//teachings-entry-by-tag-filtered/entry" />
					</xsl:call-template>
				</xsl:when>

				<xsl:when test="$pt2 = 'teachings'">					
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="." />
					</xsl:call-template>
				</xsl:when>

			</xsl:choose>
		</xsl:if>

		<xsl:if test=". = 'text'">
			<xsl:call-template name="component-text">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="//text-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
		
		<xsl:if test=". = 'verses'">
			<xsl:call-template name="component-verses">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="//verses-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if test=". = 'videos'">
			<xsl:call-template name="component-videos">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="//videos-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>
	
	</xsl:for-each>

</xsl:template>

<!-- 

URL helpers  //////////////////////////////////////////////////////////////////////////////

-->


<xsl:template name="url-downloads">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
		<xsl:value-of select="$workspace" />
		<xsl:value-of select="$node/file/@path" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$node/file/filename" />
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-events">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
		<xsl:value-of select="$root" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="//tags-all-entries/entry[tag/@handle = 'events']/@id" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$node/@id" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$node/name/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-events-recurring">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
		<xsl:value-of select="$root" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="//tags-all-entries/entry[tag/@handle = 'events']/@id" />
		<xsl:text>/events/</xsl:text>
		<xsl:value-of select="$node/name/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-events-home">
	<xsl:attribute name="href">
		<xsl:value-of select="$root" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="//tags-all-entries/entry[tag/@handle = 'events']/@id" />
		<xsl:text>/events/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-events-home-past">
	<xsl:attribute name="href">
		<xsl:value-of select="$root" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="//tags-all-entries/entry[tag/@handle = 'events']/@id" />
		<xsl:text>/events/1/5/past/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-tags">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
		<xsl:value-of select="$root" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$node/@id" />
		<xsl:text>/</xsl:text>
		<xsl:choose>
			<xsl:when test="string-length($node/slug)">
				<xsl:value-of select="$node/slug/@handle" disable-output-escaping="yes" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$node/tag/@handle" disable-output-escaping="yes" />
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-tags-by-text">
	<xsl:param name="node" select="." />
	<xsl:param name="tag" />
	<xsl:attribute name="href">
		<xsl:value-of select="$root" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$tag" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="//tags-all-entries/entry[@id = $tag]/tag/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-teachings">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
		<xsl:value-of select="$root" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="//tags-all-entries/entry[tag/@handle = 'teachings']/@id" />
		<xsl:text>/teachings/</xsl:text>
		<xsl:value-of select="$node/@id" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$node/title/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-teachings-series">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
		<xsl:value-of select="$root" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="//tags-all-entries/entry[tag/@handle = 'teachings']/@id" />
		<xsl:text>/teachings/series/</xsl:text>
		<xsl:value-of select="$node/@id" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$node/title/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="url-teachings-tags">
	<xsl:param name="node" select="." />
	<xsl:attribute name="href">
		<xsl:value-of select="$root" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="//tags-all-entries/entry[tag/@handle = 'teachings']/@id" />
		<xsl:text>/teachings/tag/</xsl:text>
		<xsl:value-of select="$node/@id" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$node/tag/@handle" />
		<xsl:text>/</xsl:text>
	</xsl:attribute>
</xsl:template>


<xsl:template name="edit-entry">
	
	<xsl:param name="component" />
	<xsl:param name="link">
		<xsl:value-of select="$root" />
		<xsl:text>/symphony/publish/</xsl:text>
		<xsl:value-of select="$component" />
		<xsl:text>/edit/</xsl:text>
		<xsl:value-of select="@id" />
		<xsl:text>/</xsl:text>
	</xsl:param>
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


<xsl:template name="form-search-action">
	<xsl:attribute name="action">
		<xsl:value-of select="$root" />
		<xsl:text>/</xsl:text>
		<xsl:value-of select="//tags-all-entries/entry[tag/@handle = 'search']/@id" />
		<xsl:text>/search/</xsl:text>
	</xsl:attribute>	
</xsl:template>












</xsl:stylesheet>