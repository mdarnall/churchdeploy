<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-downloads">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //downloads-entries-by-tag/entry )">
	
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'downloads'" />
			</xsl:call-template>
			
			<h3 class="header">Downloads</h3>
			
			<xsl:for-each select="//downloads-entries-by-tag/entry">
	
				<div>
					
					<xsl:call-template name="class-rows" />
					
					<div>
						
						<xsl:attribute name="class">
							
							<xsl:text>icon</xsl:text>
							
						</xsl:attribute>
					
					</div>
					
					<a class="description">
						
						<xsl:attribute name="href">
							
							<xsl:value-of select="$workspace" />
							<xsl:value-of select="file/@path" />
							<xsl:text>/</xsl:text>
							<xsl:value-of select="file/filename" />
							
						</xsl:attribute>
						
						<span class="name">
							<xsl:value-of select="name" disable-output-escaping="yes" />
						</span>
						
						<span class="meta">
							
							<span class="filename">
								<xsl:value-of select="file/filename" disable-output-escaping="yes" />
							</span>
							
							<span class="filesize">
								<xsl:value-of select="file/@size" disable-output-escaping="yes" />
							</span>
							
							<span class="filetype">
								<xsl:value-of select="file/@type" disable-output-escaping="yes" />
							</span>
							
							<span class="creation-date">
								<xsl:value-of select="file/meta/@creation" disable-output-escaping="yes" />
							</span>
							
						</span>
						
					</a>
					
				</div>
				
			</xsl:for-each>
			
		</div>

	</xsl:if>

</xsl:template>



</xsl:stylesheet>