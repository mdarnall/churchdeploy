<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-images">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //images-entries-by-tag/entry )">
	
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'images'" />
			</xsl:call-template>
			
			<xsl:for-each select="//images-entries-by-tag/entry">
									
				<div>
					
					<xsl:call-template name="class-rows">
						<xsl:with-param name="class" select="' image'" />
					</xsl:call-template>
										
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
		
		</div>
	
	</xsl:if>
	
</xsl:template>



</xsl:stylesheet>