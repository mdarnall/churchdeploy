<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-events">

	<xsl:param name="component" select="'events'" />
	<xsl:param name="entries" />
	<xsl:param name="position" />
	<xsl:param name="single" />

	<xsl:if test="count($entries)">

		<div>

			<xsl:choose>

				<xsl:when test="$position = 'column-right'">

					<xsl:call-template name="class-position">
						<xsl:with-param name="component" select="$component" />
					</xsl:call-template>

					<h3>
						<xsl:call-template name="pluralize">
							<xsl:with-param name="singular" select="'Upcoming Event'" />
							<xsl:with-param name="plural" select="'Upcoming Events'" />
							<xsl:with-param name="xpath" select="$entries" />
						</xsl:call-template>
					</h3>

					<ul class="events nav nav-tabs nav-stacked">
				
						<xsl:call-template name="class-position">
							<xsl:with-param name="component" select="'events'" />
							<xsl:with-param name="classes" select="'events nav nav-tabs nav-stacked'" />
						</xsl:call-template> 

						<xsl:for-each select="$entries[ position() &lt; 4 ]">

								<li class="clearfix">

									<xsl:call-template name="class-rows" />

									<a>
										<xsl:call-template name="url-events" />

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

									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$component"/>
									</xsl:call-template>

								</li>

						</xsl:for-each>

						<!-- <xsl:if test="count($entries) &gt; 3">
							<a href="{$x}/20/events/1/{$events-entries-per-page}/related/{$pt1}/" class="more">
								<span class="icon">l</span>
								<span>See more events</span>
							</a>							
						</xsl:if> -->

					</ul>

				</xsl:when>

				<xsl:when test="$position = 'column-full-width'">

					<xsl:call-template name="class-position">
						<xsl:with-param name="component">
							<xsl:text>events</xsl:text>
						</xsl:with-param>
					</xsl:call-template>

					<div class="component-header">

						<xsl:if test="$pt2 = 'events' and $pt5 = 'past'">
							<div class="back">
								<a class="link-large">
									<xsl:call-template name="url-events-home" />
									<xsl:text>Show current events &#8594;</xsl:text>
								</a>
							</div>
						</xsl:if>

						<xsl:choose>

							<xsl:when test="$single">
								<div class="back">
									<a class="link-large">
										<xsl:call-template name="url-events-home" />
										<xsl:text>&#8592; Back to all events</xsl:text>
									</a></div>
							</xsl:when>

							<xsl:otherwise>
								<xsl:call-template name="events-pagination">
									<xsl:with-param name="entries" select="$entries" />
								</xsl:call-template>
							</xsl:otherwise>

						</xsl:choose>

					</div>

					<xsl:for-each select="$entries">

						<xsl:variable name="is-earlier">
						    <xsl:call-template name="date-compare">
						        <xsl:with-param name="first" select="date/date/start" />
						        <xsl:with-param name="second" select="$today" />
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
											<a>
												<xsl:call-template name="url-events" />
												<xsl:value-of select="name" disable-output-escaping="no" />
											</a>
										</xsl:otherwise>
									</xsl:choose>

									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$component"/>
									</xsl:call-template>
									
								</h2>

								<div class="help-block clearfix">

									<span class="pull-left">

										<xsl:call-template name="timespan-format">
											<xsl:with-param name="date" select="date/date" />
										</xsl:call-template>

									</span>

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
										        <xsl:with-param name="text" select="description" />
										    </xsl:call-template>
										</xsl:variable>
										<xsl:choose>
										    <xsl:when test="string-length($stripped) > 250">
										        <xsl:value-of select="substring($stripped, 0, 250)" disable-output-escaping="yes" />
										        <xsl:text> .. </xsl:text><!-- … -->
										    </xsl:when>
										    <xsl:otherwise>
										        <xsl:value-of select="$stripped" disable-output-escaping="yes" />
										    </xsl:otherwise>
										</xsl:choose>										
									</xsl:otherwise>

								</xsl:choose>

							</div>

							<xsl:if test="$single">
								<p class="share">
									<label for="permalink">Paste link in email or IM</label>
									<input type="text" name="permalink" class="span4" value="{$current-url}" onclick="this.select()" />
								</p>
							</xsl:if>

						</div>

					</xsl:for-each>

				</xsl:when>

			</xsl:choose>

			<xsl:if test="$pt2 = 'events'">

				<div class="component-footer">

					<xsl:call-template name="events-pagination">
						<xsl:with-param name="entries" select="$entries" />
					</xsl:call-template>

					<xsl:if test="not($single)">
						<xsl:choose>
							<xsl:when test="$pt2 = 'events' and not($pt5 = 'past')">
								<div class="back">
									<xsl:choose>
										<xsl:when test="$pt5 = 'related'">
											<!-- <a href="{$x}/{$pt1}/{$pt2}/1/5/{$pt5}/{$pt6}/past/" class="link-large">&#8592; Show past events</a> -->
										</xsl:when>
										<xsl:otherwise>
											<a class="link-large">
												<xsl:call-template name="url-events-home-past" />
												<xsl:text>&#8592; Show past events</xsl:text>
											</a>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="back">
									<a class="link-large">
										<xsl:call-template name="url-events-home" />
										<xsl:text>Show current events &#8594;</xsl:text>
									</a>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</div>

			</xsl:if>

		</div>

	</xsl:if>

</xsl:template>


<xsl:template name="events-pagination">
	<xsl:param name="entries" />
	<xsl:call-template name="cd-pagination">
		<xsl:with-param name="pagination" select="$entries/../pagination" />
		<xsl:with-param name="pagination-url">
			<xsl:value-of select="$root" /><xsl:text>/</xsl:text>
			<xsl:if test="$pt1">
				<xsl:value-of select="$pt1" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt2">
				<xsl:value-of select="$pt2" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt3">
				<xsl:value-of select="'$'" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt4">
				<xsl:value-of select="$pt4" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt5">
				<xsl:value-of select="$pt5" /><xsl:text>/</xsl:text>
			</xsl:if>
		</xsl:with-param>

	</xsl:call-template>
</xsl:template>


</xsl:stylesheet>