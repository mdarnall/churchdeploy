<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-events">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //events-entries-by-tag/entry )">
	
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'event'" />
			</xsl:call-template>
			
			<h3 class="header">Upcoming Events</h3>
			
			<xsl:for-each select="//events-entries-by-tag/entry">
	
				<div>
					
					<xsl:call-template name="class-rows" />
					
					<div class="date">
						
						<span class="month">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start/@iso" />
								<xsl:with-param name="format" select="'%m-;'" />
							</xsl:call-template>
						</span>
						
						<span class="day">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start/@iso" />
								<xsl:with-param name="format" select="'%d;'" />
							</xsl:call-template>
						</span>
					
					</div>
					
					<div class="info">
					
						<span class="description">
							<xsl:value-of select="name" disable-output-escaping="yes" />
						</span>
						
						<span class="location">
						
							<xsl:variable name="location-id" select="location/item/@id" />
								
							<xsl:for-each select="//events-entries-by-tag-locations/entry[ @id = $location-id ]">
								<xsl:choose>
									<xsl:when test="string-length(name-casual)">
										<xsl:value-of select="name-casual" disable-output-escaping="yes" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="name-formal" disable-output-escaping="yes" />
									</xsl:otherwise>
								</xsl:choose>
								
							</xsl:for-each>
							
						</span>
						
					</div>
					
				</div>
				
			</xsl:for-each>
			
		</div>

	</xsl:if>

</xsl:template>



</xsl:stylesheet>