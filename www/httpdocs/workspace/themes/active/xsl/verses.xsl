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
				
					<div class="row">
						<div class="span6 offset3">
							
							<blockquote>

								<span><xsl:text>&#8220;</xsl:text><xsl:value-of select="//xml-apibibliacom/text" /><xsl:text>&#8221;</xsl:text></span>

								<cite>
									<!-- <a href="#" class="verse"> -->
										<xsl:value-of select="passage" />
									<!-- </a> -->
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="link" select="concat($root, '/symphony/publish/verses/edit/', @id, '/')" />
									</xsl:call-template>
								</cite>

							</blockquote>
							
						</div>						
					</div>


				</xsl:for-each>

			</div>
		
		</div>
			
	</xsl:if>
	
</xsl:template>



</xsl:stylesheet>