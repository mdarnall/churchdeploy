<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-events">
	
	<xsl:param name="position" /><!-- full width, center, or right -->
	<xsl:param name="entries" /><!-- xpath for entries -->

	<xsl:if test="count($entries)"><!-- Are there any entries? -->
		
		<!-- <div> -->

			<!-- <xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'events'" />
			</xsl:call-template> -->

			<xsl:choose>
				
				<xsl:when test="$position = 'column-right'">
					
					<h3>
						<xsl:call-template name="pluralize">
							<xsl:with-param name="singular" select="'Event'"/>
							<xsl:with-param name="plural" select="'Events'"/>
							<xsl:with-param name="xpath" select="$entries"/>
						</xsl:call-template>
					</h3>
					
					<ul class="events nav nav-tabs nav-stacked">

						<xsl:for-each select="$entries"><!-- Loop thru the entries -->
				
							<li>
								
								<!-- <xsl:call-template name="class-rows" /> --><!-- Add helpful classes like first, last, even, odd -->
								
								<a href="#">

									<div class="btn disabled pull-left">

										<div class="month">
											<span class="label label-important">
												<xsl:call-template name="format-date">
													<xsl:with-param name="date" select="date/date/start/@iso" />
													<xsl:with-param name="format" select="'%m-;'" />
												</xsl:call-template>
											</span>
										</div>

										<div class="day">
											<xsl:call-template name="format-date">
												<xsl:with-param name="date" select="date/date/start/@iso" />
												<xsl:with-param name="format" select="'%d;'" />
											</xsl:call-template>
										</div>

									</div>

									<div class="info">
									
										<h4>
											<xsl:text>&#160;&#160;</xsl:text>
											<xsl:value-of select="name" disable-output-escaping="yes" />
										</h4>

										<p>

											<xsl:text>&#160;&#160;</xsl:text>

											<i class="icon-map-marker"></i>

											<xsl:text>&#160;</xsl:text>

											<em>

												<xsl:variable name="location-id" select="location/item/@id" />

												<xsl:for-each select="//events-entries-by-tag-locations/entry[ @id = $location-id ]">

													<xsl:choose>

														<xsl:when test="string-length(name-casual)">
															<xsl:value-of select="name-casual" disable-output-escaping="yes" />
														</xsl:when>

														<xsl:otherwise>
															<xsl:value-of select="name-formal" disable-output-escaping="yes" />
														</xsl:otherwise>

													</xsl:choose>

												</xsl:for-each>

											</em>

										</p>		

									</div>			

								</a>

							</li>			

						</xsl:for-each>

					</ul>

				</xsl:when>
				<xsl:otherwise>
					
				</xsl:otherwise>
			</xsl:choose>

		<!-- </div> -->

	</xsl:if>

</xsl:template>



</xsl:stylesheet>