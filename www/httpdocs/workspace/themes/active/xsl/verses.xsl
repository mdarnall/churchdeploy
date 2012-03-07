<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-verses">
	
	<xsl:param name="position" />
	
	<xsl:if test="//verses-entries-by-tag/entry">
		
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'verses'" />
			</xsl:call-template>
			
			<xsl:for-each select="//verses-entries-by-tag/entry">
			
				<div>
					
					<xsl:call-template name="class-rows" />
					
					<xsl:value-of select="//dynamic-xml-apibibliacom/text" />
					
					<span class="verse">
						<xsl:value-of select="//verses-entries-by-tag/entry/passage" />
					</span>
					
				</div>
			
			</xsl:for-each>
		
		</div>
			
	</xsl:if>
	
</xsl:template>



</xsl:stylesheet>