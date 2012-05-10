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
												<xsl:text>/image/2/72/72/2/0</xsl:text>
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
									<xsl:value-of select="first-name" disable-output-escaping="yes" />
									<xsl:text> </xsl:text>
									<xsl:value-of select="last-name" disable-output-escaping="yes" />
								</h4>
								<div>
									<span data-icon="M"></span>
									<span class="email"><xsl:value-of select="email" /></span>
								</div>
							</div>
						</a>
					</li>
				</xsl:for-each>

				<a href="/103/staff/" class="more">
					<span data-icon="g"></span>
					<xsl:text>Meet our staff</xsl:text>
				</a>
			
			</ul>

		</div>
	
	</xsl:if>
	
</xsl:template>


</xsl:stylesheet>