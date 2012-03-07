<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-members">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //members-entries-by-tag/entry )">
		
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'member'" />
			</xsl:call-template>
			
			<h3 class="header">Leader Contact</h3>
						
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



</xsl:stylesheet>