<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-event">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //events-entries-by-tag/entry )">
	
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'event'" />
				<xsl:with-param name="position" select="$position" />
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
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //members-entries-by-tag/entry )">
		
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'member'" />
				<xsl:with-param name="position" select="$position" />
			</xsl:call-template>
			
			<xsl:if test="$position = 'column-right'">
				<h3 class="header">Leader Contact</h3>
			</xsl:if>
			
			<xsl:for-each select="//members-entries-by-tag/entry">
				
				<div>
					
					<xsl:call-template name="class-rows" />
					
					<div class="image">
					
						<xsl:attribute name="style">
							
							<xsl:text>background-image: url('</xsl:text>
							<xsl:value-of select="$root" />
							
							<xsl:choose>
								<xsl:when test="$position = 'column-center'">
									<xsl:text>/image/2/129/151/2/0</xsl:text>
								</xsl:when>
								<xsl:when test="$position = 'column-right'">
									<xsl:text>/image/2/75/75/2/0</xsl:text>
								</xsl:when>
							</xsl:choose>
							
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
						
						<h3 class="name">
							<xsl:value-of select="first-name" disable-output-escaping="yes" />
							<xsl:text> </xsl:text>
							<xsl:value-of select="last-name" disable-output-escaping="yes" />
						</h3>
						
						<h4>
							<xsl:value-of select="job-title" disable-output-escaping="yes" />
						</h4>
						
						<xsl:choose>
							<xsl:when test="$position = 'column-center'">
								<xsl:value-of select="about" disable-output-escaping="yes" />
							</xsl:when>
							<xsl:when test="$position = 'column-right'">
								<p class="email">
									<a href="mailto:{email}">
										<xsl:value-of select="email" disable-output-escaping="yes" />
									</a>
								</p>
							</xsl:when>
						</xsl:choose>
						
					</div>
					
				</div>
				
			</xsl:for-each>
			
		</div>
	
	</xsl:if>
	
</xsl:template>



<xsl:template name="component-verse">
	
	<xsl:if test="//verses-entries-by-tag/entry">
		
		<blockquote class="scripture clearfix">
			<xsl:value-of select="//dynamic-xml-apibibliacom/text" />
			<span class="verse">
				<xsl:value-of select="//verses-entries-by-tag/entry/passage" />
			</span>
		</blockquote>
			
	</xsl:if>
	
</xsl:template>


</xsl:stylesheet>