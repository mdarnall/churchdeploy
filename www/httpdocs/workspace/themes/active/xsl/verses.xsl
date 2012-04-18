<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-verses">
	
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'verses'" />
			</xsl:call-template>
			
			<div>
					
				<xsl:call-template name="class-rows" />
					
				<xsl:for-each select="$entries">
				
					<blockquote>

						<h3>
							<xsl:value-of select="//xml-apibibliacom/text" />
						</h3>

						<cite>
							<a href="#" class="verse">
								<xsl:text>—</xsl:text>
								<xsl:value-of select="passage" />
							</a>
						</cite>

					</blockquote>
			
				</xsl:for-each>

			</div>
		
		</div>
			
	</xsl:if>
	
</xsl:template>



</xsl:stylesheet>