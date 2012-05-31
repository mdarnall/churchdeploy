<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-members-roles">
	
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		
		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'members-roles'" />
			</xsl:call-template>
			
			<h3 class="header">Our Staff</h3>
			
			<xsl:choose>
				<xsl:when test="$position = 'column-full-width'">

					<xsl:variable name="items-per-row" select="3" />

					<xsl:for-each select="$entries[position() mod $items-per-row = 1]">
	
						<div class="row">

				            <xsl:for-each select=". | following-sibling::*[not(position() >= $items-per-row)]">

								<div>
									<xsl:call-template name="class-rows">
										<xsl:with-param name="class" select="'span4'"/>
									</xsl:call-template>

									<img width="180" height="180">
										<xsl:attribute name="src">
											<xsl:value-of select="$root" />
											<xsl:text>/image/2/180/180/2/0</xsl:text>
											<xsl:value-of select="member/item/photo/@path" />
											<xsl:text>/</xsl:text>
											<xsl:value-of select="member/item/photo/filename" />
										</xsl:attribute>
									</img>

									<h4>
										<xsl:value-of select="role/item/role" disable-output-escaping="yes" />
									</h4>	

									<h3>
										<xsl:value-of select="member/item/first-name" />
										<xsl:text> </xsl:text>
										<xsl:value-of select="member/item/last-name" />

										<xsl:call-template name="edit-entry">
											<xsl:with-param name="link" select="concat($root, '/symphony/publish/members-roles/edit/', @id, '/')" />
										</xsl:call-template>
									</h3>

									<div class="content">
										<xsl:value-of select="member/item/about" disable-output-escaping="yes" />
									</div>	
								</div>

							</xsl:for-each>
						</div>
					</xsl:for-each>

				</xsl:when>
				<xsl:otherwise>
					
					<ul class="contacts nav nav-tabs nav-stacked">
						<xsl:for-each select="$entries">
							<li>
								<xsl:call-template name="class-rows" />
								<a href="mailto:{email}">
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
												<xsl:value-of select="member/item/photo/@path" />
												<xsl:text>/</xsl:text>
												<xsl:value-of select="member/item/photo/filename" />
											</xsl:attribute>
										</img>
									</div>
									<div class="info">
										<h4>
											<xsl:value-of select="member/item/first-name" disable-output-escaping="yes" />
											<xsl:text> </xsl:text>
											<xsl:value-of select="member/item/last-name" disable-output-escaping="yes" />
										</h4>
										<div>
											<span class="icon">M</span>
											<span class="email"><xsl:value-of select="member/item/email" /></span>
										</div>
									</div>
								</a>
								<xsl:call-template name="edit-entry">
									<xsl:with-param name="link" select="concat($root, '/symphony/publish/members-roles/edit/', @id, '/')" />
								</xsl:call-template>
							</li>
						</xsl:for-each>
						<a href="/103/staff/" class="more">
							<span class="icon">g</span>
							<xsl:text>Meet our staff</xsl:text>
						</a>
					</ul>

				</xsl:otherwise>
			</xsl:choose>

		</div>
	
	</xsl:if>
	
</xsl:template>


</xsl:stylesheet>