<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="../themes/active/xsl/downloads.xsl" />
<xsl:include href="../themes/active/xsl/events.xsl" />
<xsl:include href="../themes/active/xsl/images.xsl" />
<xsl:include href="../themes/active/xsl/locations.xsl" />
<xsl:include href="../themes/active/xsl/members.xsl" />
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
						<xsl:with-param name="xpath" select="$xpath"/>
					</xsl:call-template>
				</div>

			</xsl:when>
			<xsl:when test="name($xpath) = 'column-center'">

				<div id="main-content" class="span8 column-center">
					<xsl:call-template name="component-populate">
						<xsl:with-param name="xpath" select="$xpath"/>
					</xsl:call-template>
				</div>

			</xsl:when>
			<xsl:when test="name($xpath) = 'column-right'">
				
				<div id="sidebar" class="span4 column-right">

					<xsl:call-template name="template-column-right-top"/>

					<xsl:call-template name="component-populate">
						<xsl:with-param name="xpath" select="$xpath"/>
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
		
		<xsl:if test=". = 'members'">
			<xsl:call-template name="component-members">
				<xsl:with-param name="position" select="name($xpath)" />
				<xsl:with-param name="entries" select="//members-entries-by-tag/entry" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if test=". = 'spacer'">
			<xsl:call-template name="component-spacer" />
		</xsl:if>

		<xsl:if test=". = 'teachings'">
			<xsl:choose>

				<xsl:when test="count(//teachings-all-entries-filtered/entry)">
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//teachings-all-entries-filtered/entry" />
					</xsl:call-template>
				</xsl:when>

				<xsl:otherwise>
					<xsl:call-template name="component-teachings">
						<xsl:with-param name="position" select="name($xpath)" />
						<xsl:with-param name="entries" select="//teachings-entries-by-tag/entry" />
					</xsl:call-template>
				</xsl:otherwise>

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



</xsl:stylesheet>