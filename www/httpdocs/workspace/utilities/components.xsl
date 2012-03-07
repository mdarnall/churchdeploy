<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:include href="../themes/active/xsl/downloads.xsl" />
<xsl:include href="../themes/active/xsl/events.xsl" />
<xsl:include href="../themes/active/xsl/images.xsl" />
<xsl:include href="../themes/active/xsl/locations.xsl" />
<xsl:include href="../themes/active/xsl/members.xsl" />
<xsl:include href="../themes/active/xsl/text.xsl" />
<xsl:include href="../themes/active/xsl/verses.xsl" />



<xsl:template name="component">
	
	<xsl:param name="xpath" />
	
	<xsl:if test="count($xpath/item)">

		<xsl:choose>
			<xsl:when test="name($xpath) = 'column-full-width'">

				<!-- No container defaults for full width -->
				<xsl:call-template name="component-populate">
					<xsl:with-param name="xpath" select="$xpath"/>
				</xsl:call-template>

			</xsl:when>
			<xsl:when test="name($xpath) = 'column-center'">
				
				<section id="main-content" class="span8">
					<xsl:call-template name="component-populate">
						<xsl:with-param name="xpath" select="$xpath"/>
					</xsl:call-template>
				</section>

			</xsl:when>
			<xsl:when test="name($xpath) = 'column-right'">
				
				<section id="sidebar" class="span4">
					<xsl:call-template name="component-populate">
						<xsl:with-param name="xpath" select="$xpath"/>
					</xsl:call-template>
				</section>

			</xsl:when>
		</xsl:choose>

	</xsl:if>
	
</xsl:template>


<xsl:template name="component-populate">
	
	<xsl:param name="xpath" />

	<xsl:for-each select="$xpath/item/label/@handle">
	
		<xsl:if  test=". = 'downloads'">
			<xsl:call-template name="component-downloads">
				<xsl:with-param name="position" select="name($xpath)" />
			</xsl:call-template>
		</xsl:if>
	
		<xsl:if  test=". = 'events'">
			<xsl:call-template name="component-events">
				<xsl:with-param name="position" select="name($xpath)" />
			</xsl:call-template>
		</xsl:if>
	
		<xsl:if test=". = 'images'">
			<xsl:call-template name="component-images">
				<xsl:with-param name="position" select="name($xpath)" />
			</xsl:call-template>
		</xsl:if>
		
		<xsl:if  test=". = 'locations'">
			<xsl:call-template name="component-locations">
				<xsl:with-param name="position" select="name($xpath)" />
			</xsl:call-template>
		</xsl:if>
		
		<xsl:if  test=". = 'members'">
			<xsl:call-template name="component-members">
				<xsl:with-param name="position" select="name($xpath)" />
			</xsl:call-template>
		</xsl:if>
		
		<xsl:if test=". = 'text'">
			<xsl:call-template name="component-text">
				<xsl:with-param name="position" select="name($xpath)" />
			</xsl:call-template>
		</xsl:if>
		
		<xsl:if test=". = 'verses'">
			<xsl:call-template name="component-verses">
				<xsl:with-param name="position" select="name($xpath)" />
			</xsl:call-template>
		</xsl:if>
	
	</xsl:for-each>

</xsl:template>




</xsl:stylesheet>