<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-members">
	
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'member'" />
			</xsl:call-template>
			
			<h3 class="header">Leader Contact</h3>
			
			<ul class="contacts nav nav-tabs nav-stacked">

				<xsl:for-each select="//members-entries-by-tag/entry">
					
						<li class="entry">
							<a href="maito:{email}">
							
							<div class="pull-left">
								
								<img>

									<xsl:attribute name="src">
										
										<xsl:value-of select="$root" />
										
										<xsl:choose>
											<xsl:when test="$position = 'column-center'">
												<xsl:text>/image/2/129/151/2/0</xsl:text>
											</xsl:when>
											<xsl:when test="$position = 'column-right'">
												<xsl:text>/image/2/44/44/2/0</xsl:text>
											</xsl:when>
										</xsl:choose>
										
										<xsl:value-of select="photo/@path" />
										<xsl:text>/</xsl:text>
										<xsl:value-of select="photo/filename" />
										
									</xsl:attribute>
								
								</img>

							</div>
							
							<div class="info">
								
								<h4>
									<xsl:text>&#160;&#160;</xsl:text>
									<xsl:value-of select="first-name" disable-output-escaping="yes" />
									<xsl:text> </xsl:text>
									<xsl:value-of select="last-name" disable-output-escaping="yes" />
								</h4>
								
								<p>
									<xsl:text>&#160;&#160;</xsl:text>
									<span data-icon="M"></span>
									
									<xsl:text>&#160;&#160;</xsl:text>
					
									<span class="email"><xsl:value-of select="email" /></span>

								</p>
								
							</div>
							</a>
						</li>
					
					
				</xsl:for-each>
				<p><a href="/103/staff/" class="info-link"><span data-icon="g"></span> Meet our staff</a></p>
			
			</ul>

		</div>
	
	</xsl:if>
	
</xsl:template>



</xsl:stylesheet>