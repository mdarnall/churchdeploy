<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-text">
	
	<xsl:param name="position" />
	
	<xsl:if test="count( //text-entries-by-tag/entry )">
	
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'text'" />
			</xsl:call-template>
			
			<xsl:for-each select="//text-entries-by-tag/entry">
				
				<div>
					
					<xsl:call-template name="class-rows" />
			
					<xsl:value-of select="content" disable-output-escaping="yes" />
				
				</div>
			
			</xsl:for-each>
			
		</div>
	
	</xsl:if>
	
</xsl:template>



</xsl:stylesheet>