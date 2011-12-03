<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-event">
	
	<xsl:if test="count( //events-entries-by-tag/entry )">
	
		<ul class="event-box">
		
			<h3 class="side-header">Upcoming Events</h3>
			
			<xsl:for-each select="//events-entries-by-tag/entry">
	
				<li>
					
					<xsl:call-template name="class-alternating-rows" />
					
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
					
				</li>
				
			</xsl:for-each>
			
		</ul>

	</xsl:if>

</xsl:template>



<xsl:template name="component-image">

	<xsl:for-each select="//images-entries-by-tag/entry">
							
		<div class="image">
			
			<xsl:attribute name="style">
				
				<xsl:text>background-image: url('</xsl:text>
				
				<xsl:value-of select="$root" />
				
				<xsl:text>/image/2/920/</xsl:text>
				
				<xsl:choose>
					<xsl:when test="string-length(height)">
						<xsl:value-of select="height" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>400</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				
				<xsl:text>/</xsl:text>
				
				<xsl:choose>
					<xsl:when test="position = 'Top left'"     >1</xsl:when>
					<xsl:when test="position = 'Top center'"   >2</xsl:when>
					<xsl:when test="position = 'Top right'"    >3</xsl:when>
					<xsl:when test="position = 'Middle left'"  >4</xsl:when>
					<xsl:when test="position = 'Middle center'">5</xsl:when>
					<xsl:when test="position = 'Middle right'" >6</xsl:when>
					<xsl:when test="position = 'Bottom left'"  >7</xsl:when>
					<xsl:when test="position = 'Bottom center'">8</xsl:when>
					<xsl:when test="position = 'Bottom right'" >9</xsl:when>
					<xsl:otherwise>5</xsl:otherwise>
				</xsl:choose>
				
				<xsl:text>/0</xsl:text>
				
				<xsl:value-of select="image/@path" />
				
				<xsl:text>/</xsl:text>
				
				<xsl:value-of select="image/filename" />
				
				<xsl:text>'); height: </xsl:text>
				
				<xsl:if test="string-length(height)">
					<xsl:value-of select="height" />
				</xsl:if>
				
				<xsl:text>px</xsl:text>
				
			</xsl:attribute>
			
			<div class="caption">
				<xsl:value-of select="caption" disable-output-escaping="yes" />
			</div>
			
		</div>
		
	</xsl:for-each>
	
</xsl:template>



<xsl:template name="component-member">
	
	<xsl:if test="count( //members-entries-by-tag/entry )">
		
		<ul class="leader-contact">
				
			<h3 class="side-header">Leader Contact</h3>
			
			<xsl:for-each select="//members-entries-by-tag/entry">
	
				<li>
					
					<xsl:call-template name="class-alternating-rows" />
					
					<div class="image">
						
						<xsl:attribute name="style">
							
							<xsl:text>background-image: url('</xsl:text>
							<xsl:value-of select="$root" />
							<xsl:text>/image/2/75/75/2/0</xsl:text>
							<xsl:value-of select="photo/@path" />
							<xsl:text>/</xsl:text>
							<xsl:value-of select="photo/filename" />
							<xsl:text>');</xsl:text>
							
						</xsl:attribute>
						
						<div class="caption">
							<xsl:value-of select="first-name" disable-output-escaping="yes" />
							<xsl:text> </xsl:text>
							<xsl:value-of select="last-name" disable-output-escaping="yes" />
						</div>
						
					</div>
					
					<div class="info">
						
						<h3>
							<xsl:value-of select="first-name" disable-output-escaping="yes" />
							<xsl:text> </xsl:text>
							<xsl:value-of select="last-name" disable-output-escaping="yes" />
						</h3>
						
						<h4>
							<xsl:value-of select="job-title" disable-output-escaping="yes" />
						</h4>
						
						<p class="email">
							<a href="mailto:{email}">
								<xsl:value-of select="email" disable-output-escaping="yes" />
							</a>
						</p>
						
					</div>
					
				</li>
				
			</xsl:for-each>
			
		</ul>
	
	</xsl:if>
	
</xsl:template>



</xsl:stylesheet>