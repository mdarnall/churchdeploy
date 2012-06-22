<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-events">

	<xsl:param name="entries" />
	<xsl:param name="position" />
	<xsl:param name="single" />

	<xsl:variable name="data-source" select="name($entries/../.)" />
	<xsl:variable name="is-recurring">
		<xsl:choose>
			<xsl:when test="substring($data-source, 1, 16) = 'events-recurring'">
				<xsl:value-of select="'Yes'" disable-output-escaping="yes" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'No'" disable-output-escaping="yes" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="component">
		<xsl:choose>
			<xsl:when test="$is-recurring = 'Yes'">
				<xsl:value-of select="'events-recurring'" disable-output-escaping="yes" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'events'" disable-output-escaping="yes" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:if test="count($entries)">
		<div>
			<xsl:choose>
				<xsl:when test="$position = 'column-right'">
					<xsl:call-template name="class-position">
						<xsl:with-param name="component" select="$component" />
					</xsl:call-template>
					<h3>
						<xsl:call-template name="pluralize">
							<xsl:with-param name="singular" select="'Upcoming'" />
							<xsl:with-param name="plural" select="'Upcoming'" />
							<xsl:with-param name="xpath" select="$entries" />
						</xsl:call-template>
					</h3>
					<ul class="entries">  <!-- nav nav-tabs nav-stacked -->
						<!-- <xsl:call-template name="class-position">
							<xsl:with-param name="component" select="'events'" />
							<xsl:with-param name="classes" select="'events nav nav-tabs nav-stacked'" />
						</xsl:call-template> -->
						<xsl:choose>
							<xsl:when test="$is-recurring = 'No'">
								<xsl:for-each select="$entries[ position() &lt; 4 ]">
									<xsl:call-template name="events-entry-column-right">
										<xsl:with-param name="component" select="$component" />
										<xsl:with-param name="is-recurring" select="$is-recurring" />
									</xsl:call-template>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="$entries">
									<xsl:call-template name="events-entry-column-right">
										<xsl:with-param name="component" select="$component" />
										<xsl:with-param name="is-recurring" select="$is-recurring" />
									</xsl:call-template>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="$entries/../pagination/@total-entries &gt; 3 and $is-recurring = 'No'">
							<a class="more">
								<xsl:call-template name="url-events-home" />
								<span class="icon">l</span>
								<span>See more events</span>
							</a>
						</xsl:if>
					</ul>
				</xsl:when>
				<xsl:when test="$position = 'column-full-width'">
					<xsl:call-template name="class-position">
						<xsl:with-param name="component">events</xsl:with-param>
						<xsl:with-param name="class">span8</xsl:with-param>
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
										<xsl:choose>
											<xsl:when test="Expr">
												<xsl:call-template name="url-events-home" />
												<xsl:text>&#8592; Back to all events</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="url-events-recurring-home" />
												<xsl:text>&#8592; Back to all recurring events</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</a></div>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="events-pagination">
									<xsl:with-param name="entries" select="$entries" />
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div class="entries">
						<xsl:for-each select="$entries">
							<xsl:variable name="is-earlier">
								<xsl:call-template name="date-compare">
									<xsl:with-param name="first" select="date/date/start" />
									<xsl:with-param name="second" select="$today" />
								</xsl:call-template>
							</xsl:variable>
							<div>
								<xsl:choose>
									<xsl:when test="$single">
										<xsl:call-template name="class-rows">
											<xsl:with-param name="class" select="'entries span8'" />
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="class-rows" />
									</xsl:otherwise>
								</xsl:choose>
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
									<div class="date clearfix">
										<xsl:choose>
											<xsl:when test="$is-recurring = 'No'">
												<span class="icon">t</span>
												<xsl:call-template name="timespan-format">
													<xsl:with-param name="date" select="date/date" />
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<span class="icon">r</span>
												<xsl:value-of select="frequency" disable-output-escaping="yes" />
											</xsl:otherwise>
										</xsl:choose>
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
											<xsl:call-template name="truncate">
												<xsl:with-param name="node" select="$stripped" />
												<xsl:with-param name="length" select="236" />
											</xsl:call-template>
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
							<xsl:if test="$single">
								<div class="span4 column-right">
									<div class="component component-locations">
										<xsl:call-template name="component-locations">
											<xsl:with-param name="position" select="'column-right'" />
											<xsl:with-param name="entries" select="location/item" />
										</xsl:call-template>
									</div>
									<div class="component component-members-roles">
										<xsl:call-template name="component-members-roles">
											<xsl:with-param name="position" select="'column-right'" />
											<xsl:with-param name="entries" select="member-role/item" />
										</xsl:call-template>
									</div>
									<div class="component component-downloads">
										<xsl:call-template name="component-members-roles">
											<xsl:with-param name="position" select="'column-right'" />
											<xsl:with-param name="entries" select="downloads/item" />
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>
					</div>
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
		<xsl:if test="$position = 'column-full-width'">
			<div class="span3">
				<xsl:for-each select="//events-recurring-all-entries-filtered/entry">
					<xsl:call-template name="events-entry-column-right">
						<xsl:with-param name="component" select="$component" />
						<xsl:with-param name="is-recurring" select="'Yes'" />
					</xsl:call-template>
				</xsl:for-each>
			</div>
		</xsl:if>
	</xsl:if>

</xsl:template>


<xsl:template name="events-entry-column-right">

	<xsl:param name="component" />
	<xsl:param name="is-recurring" />

	<li class="clearfix">
		<xsl:call-template name="class-rows" />
		<a>
			<xsl:call-template name="url-events" />
			<xsl:choose>
				<xsl:when test="$is-recurring = 'No'">
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
				</xsl:when>
				<xsl:otherwise>
					<div class="frequency">
						<xsl:value-of select="frequency" disable-output-escaping="yes" />
					</div>
					<div class="title">
						<xsl:value-of select="name" disable-output-escaping="yes" />
					</div>
					<div class="location">
						<xsl:call-template name="location-name" />
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</a>
		<xsl:call-template name="edit-entry">
			<xsl:with-param name="component" select="$component"/>
		</xsl:call-template>
	</li>

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