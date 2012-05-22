<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-downloads">
	
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
	
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'downloads'" />
			</xsl:call-template>
			
			<h3>Documents</h3>
			
			<ul class="documents nav nav-tabs nav-stacked">

				<xsl:for-each select="$entries">
		
					<li class="entry">
						
						<xsl:call-template name="class-rows" />
						
						<a>
							
							<xsl:attribute name="href">
								
								<xsl:value-of select="$workspace" />
								<xsl:value-of select="file/@path" />
								<xsl:text>/</xsl:text>
								<xsl:value-of select="file/filename" />
								
							</xsl:attribute>
							
							<span class="icon">F</span>
							<xsl:text>&#160;&#160;</xsl:text>
							<xsl:value-of select="name" />
							
							<!-- <span class="meta">
								
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
								
							</span> -->
							
						</a>
						
					</li>
					
				</xsl:for-each>
			
			</ul>

		</div>

	</xsl:if>

</xsl:template>



</xsl:stylesheet>