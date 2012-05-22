<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-events">

	<xsl:param name="entries" />
	<xsl:param name="position" />
	<xsl:param name="single" />

	<xsl:if test="count($entries)">

		<div>

			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'events'" />
			</xsl:call-template>

			<xsl:choose>

				<xsl:when test="$position = 'column-right'">

					<h3>
						<xsl:call-template name="pluralize">
							<xsl:with-param name="singular" select="'Upcoming Event'"/>
							<xsl:with-param name="plural" select="'Upcoming Events'"/>
							<xsl:with-param name="xpath" select="$entries"/>
						</xsl:call-template>
					</h3>

					<ul class="events nav nav-tabs nav-stacked">
				
						<xsl:call-template name="class-position">
							<xsl:with-param name="component" select="'events'" />
							<xsl:with-param name="classes" select="'events nav nav-tabs nav-stacked'"/>
						</xsl:call-template> 

						<xsl:for-each select="$entries[ position() &lt; 4 ]">

							<xsl:call-template name="column-right-events-entry"/>

						</xsl:for-each>

						<a href="{$root}/20/events/1/{$events-entries-per-page}/related/{$pt1}/" class="more">
							<span class="icon">l</span>
							<span>See more events</span>
						</a>

					</ul>

				</xsl:when>

				<xsl:otherwise>

					<div class="component-header">

						<xsl:choose>

							<xsl:when test="$single">
								<p><a href="{$root}/{$pt1}/{$pt2}/">« Back to all events</a></p>
							</xsl:when>

							<xsl:otherwise>
								<xsl:call-template name="cd-pagination">
									<xsl:with-param name="pagination" select="$entries/../pagination" />
									<xsl:with-param name="pagination-url" select="concat( $root, '/', $pt1, '/', $pt2, '/', '$', '/', $pt4, '/', $pt5, '/', $pt6, '/' )" />
								</xsl:call-template>
							</xsl:otherwise>

						</xsl:choose>

					</div>

					<xsl:for-each select="$entries">

						<xsl:variable name="is-earlier">
						    <xsl:call-template name="date-compare">
						        <xsl:with-param name="first" select="date/date/start"/>
						        <xsl:with-param name="second" select="$today"/>
						    </xsl:call-template>
						</xsl:variable>

						<xsl:variable name="date-format" select="'%d-;, %m+; %d;, %y+;'"/>
						<xsl:variable name="time-format" select="'#h;:#0m; #TS;'"/>

						<xsl:variable name="start-date">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start/@iso" />
								<xsl:with-param name="format" select="$date-format" />
							</xsl:call-template>
						</xsl:variable>

						<xsl:variable name="start-time">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start/@iso" />
								<xsl:with-param name="format" select="$time-format" />
							</xsl:call-template>
						</xsl:variable>

						<xsl:variable name="end-date">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/end/@iso" />
								<xsl:with-param name="format" select="$date-format" />
							</xsl:call-template>
						</xsl:variable>

						<xsl:variable name="end-time">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/end/@iso" />
								<xsl:with-param name="format" select="$time-format" />
							</xsl:call-template>
						</xsl:variable>

						<div>

							<xsl:call-template name="class-rows" />

							<xsl:if test="$is-earlier &lt; 0">
								<xsl:text> </xsl:text>
								<div class="label label-warning">This occured in the past</div>
							</xsl:if>

							<div class="events-header">
								<h2 class="header">
									<xsl:choose>
										<xsl:when test="$single">
											<xsl:value-of select="name" disable-output-escaping="no" />
										</xsl:when>
										<xsl:otherwise>
											<a href="{$root}/20/events/{@id}/{name/@handle}/">
												<xsl:value-of select="name" disable-output-escaping="no" />
											</a>
										</xsl:otherwise>
									</xsl:choose>

					
								</h2>

								<div class="help-block clearfix">

									<span class="pull-left">

										<xsl:choose>

											<xsl:when test="$start-date = $end-date or not(date/date/end)">
												<span class="date">
													<span class="icon">\</span>
													<xsl:text> </xsl:text>
													<xsl:value-of select="$start-date" />
												</span>
												
												<xsl:text> &#160;</xsl:text>

												<span class="time">
													<span class="icon">t</span>
													<xsl:text> </xsl:text>
													<xsl:value-of select="$start-time" />

													<xsl:if test="date/date/end/@iso">
														<xsl:text> - </xsl:text>
														<xsl:value-of select="$end-time" />
													</xsl:if>
												</span>
											</xsl:when>
											
											<xsl:otherwise>

												<span class="date-range">

													<span class="icon">\</span>
													<xsl:text> </xsl:text>

													<span class="start">
														<span class="date">		
															<xsl:value-of select="$start-date" />
														</span>
														<xsl:text> </xsl:text>
														<span class="time">
															<xsl:value-of select="$start-time" />
														</span>
													</span>

													<span class="divider">
														<xsl:text> - </xsl:text>
													</span>
													
													<span class="end">
														<span class="date">		
															<xsl:value-of select="$end-date" />
														</span>
														<xsl:text> </xsl:text>
														<span class="time">
															<xsl:value-of select="$end-time" />
														</span>
													</span>

												</span>
											
											</xsl:otherwise>
										
										</xsl:choose>
							
									</span>

									<xsl:call-template name="edit-entry">
										<xsl:with-param name="link" select="concat($root, '/symphony/publish/events/edit/', @id, '/')" />
									</xsl:call-template>

								</div>

							</div>

							<div class="description">
								<xsl:choose>

									<xsl:when test="$single">
										<xsl:value-of select="description" disable-output-escaping="yes" />
									</xsl:when>

									<xsl:otherwise>
										<xsl:variable name="stripped">
										    <xsl:call-template name="remove-html">
										        <xsl:with-param name="text" select="description"/>
										    </xsl:call-template>
										</xsl:variable>
										<xsl:choose>
										    <xsl:when test="string-length($stripped) > 250">
										        <xsl:value-of select="substring($stripped, 0, 250)" disable-output-escaping="yes" />
										        <xsl:text>…</xsl:text>
										    </xsl:when>
										    <xsl:otherwise>
										        <xsl:value-of select="$stripped" disable-output-escaping="yes" />
										    </xsl:otherwise>
										</xsl:choose>										
									</xsl:otherwise>

								</xsl:choose>

							</div>

							<xsl:if test="$single">
								<p>
									<em>Paste link in email or IM</em>
									<br />
									<input type="text" name="permalink" class="span4" value="{$current-url}" onclick="selectAllText($(this))" />
								</p>
							</xsl:if>

						</div>

					</xsl:for-each>

				</xsl:otherwise>

			</xsl:choose>

			<xsl:if test="$pt2 = 'events'">

				<div class="component-footer">
					<xsl:call-template name="cd-pagination">
						<xsl:with-param name="pagination" select="$entries/../pagination" />
						<xsl:with-param name="pagination-url" select="concat( $root, '/', $pt1, '/', $pt2, '/', '$', '/', $pt4, '/', $pt5 )" />
					</xsl:call-template>

					<xsl:if test="not($single)">
						<xsl:choose>
							<xsl:when test="$pt2 = 'events' and not($pt5 = 'past')">
								<p>
									<xsl:choose>
										<xsl:when test="$pt5 = 'related'">
											<a href="{$root}/{$pt1}/{$pt2}/1/5/{$pt5}/{$pt6}/past/">« View past events</a>
										</xsl:when>
										<xsl:otherwise>
											<a href="{$root}/{$pt1}/{$pt2}/1/5/past/">« View past events</a>
										</xsl:otherwise>
									</xsl:choose>
								</p>
							</xsl:when>
							<xsl:otherwise>
								<p><a href="{$root}/{$pt1}/{$pt2}/">View current events »</a></p>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</div>

			</xsl:if>

		</div>

	</xsl:if>

</xsl:template>


<xsl:template name="column-right-events-entry">

	<li class="clearfix">

		<xsl:call-template name="class-rows" />

		<a href="{$root}/20/events/{@id}/{name/@handle}/">

			<div class="date">

				<div class="month">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="date/date/start/@iso" />
						<xsl:with-param name="format" select="'%m-;'" />
					</xsl:call-template>
				</div>

				<div class="day">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="date/date/start/@iso" />
						<xsl:with-param name="format" select="'%d;'" />
					</xsl:call-template>
				</div>

			</div>

			<table class="info">
				<tr>
					<td>
						<xsl:value-of select="name" disable-output-escaping="yes" />
					</td>
				</tr>
			</table>

		</a>

	</li>

</xsl:template>



</xsl:stylesheet>