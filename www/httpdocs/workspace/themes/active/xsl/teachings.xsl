<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-teachings">

	<xsl:param name="component" select="'teachings'" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		<div>
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="$component" />
			</xsl:call-template>
			<div class="row">
				<xsl:choose>
	 				<xsl:when test="number($pt3)">
						<div class="span12">
							<xsl:for-each select="$entries">
								<div class="result">
									<xsl:attribute name="class">
										<xsl:if test="number($pt3)">
											<xsl:text>result individual</xsl:text>
										</xsl:if>
									</xsl:attribute>
									<xsl:call-template name="teaching-entry" />
								</div>
							</xsl:for-each>
						</div>
					</xsl:when>
					<xsl:when test="$pt3 = 'book' or $pt3 = 'tag' or $pt3 = 'year' or $pt3 = 'series'">
						<div class="span8 results">
							<h3>
								<xsl:choose>
									<xsl:when test="$pt3 = 'series'">
										<xsl:text disable-output-escaping="yes">Series: </xsl:text>
										<xsl:value-of select="$entries/../../title" disable-output-escaping="yes" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$entries/../pagination/@total-entries" disable-output-escaping="yes" />
										<xsl:text disable-output-escaping="yes"> results</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</h3>
							<xsl:for-each select="$entries">
								<div class="result">
									<xsl:call-template name="teaching-entry" />
								</div>
							</xsl:for-each>
							<xsl:call-template name="teachings-pagination">
								<xsl:with-param name="entries" select="$entries" />
							</xsl:call-template>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="//teachings-featured-filtered/entry">
							<div class="latest span8 offset2">
								<div class="search">
									<form method="get">
										<xsl:call-template name="form-search-action"/>
										<input type="hidden" name="sections" value="teachings,teachings-tags,teachings-series" />
										<input class="keywords" name="keywords" onclick="this.select()" autocomplete="off" />
									</form>
									<p>Type and hit enter. You can search all of our media by any keyword. Try <span onclick="$('.search input.keywords').val('Jesus');">Jesus</span> or <span onclick="$('.search input.keywords').val('resurrection');">resurrection</span>&#160;..</p>
								</div>
								<iframe src="http://player.vimeo.com/video/{video/item/id}?title=0&amp;byline=0&amp;portrait=0&amp;color=d83629" frameborder="0" class="video" webkitAllowFullScreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowFullScreen="allowFullScreen" style="width: 100%"></iframe>
								<xsl:call-template name="teaching-actions" />
								<h2>
									<a>
										<xsl:call-template name="url-teachings" />
										<xsl:value-of select="title" disable-output-escaping="yes" />
									</a>
								</h2>
								<div class="meta">
									<p>
										<span class="badge">
											<xsl:value-of select="filename" />
										</span>
										<span class="teacher">
											<em>by </em>
											<xsl:value-of select="speaker/item/first-name" disable-output-escaping="yes" />
											<xsl:text disable-output-escaping="yes"> </xsl:text>
											<xsl:value-of select="speaker/item/last-name" disable-output-escaping="yes" />
										</span>
										<span class="verse">
											<i class="icon-book"></i>
											<xsl:text> </xsl:text>
											<xsl:value-of select="book/item" />
											<xsl:text> </xsl:text>
											<xsl:value-of select="chapter" />
										</span>
										<span class="divider">|</span>
										<span class="date">
										<xsl:call-template name="date-teaching">
											<xsl:with-param name="date" select="date/date/start/@iso" />
										</xsl:call-template>
										</span>
									</p>
								</div>
								<div class="description">
									<xsl:value-of select="description" disable-output-escaping="yes" />
								</div>
								<xsl:call-template name="teaching-tag-list">
									<xsl:with-param name="tags" select="tags/item" />
								</xsl:call-template>
							</div>
						</xsl:for-each>
						<div class="span8">
							<h3>Recent</h3>
							<xsl:variable name="items-per-row" select="2" />
							<xsl:for-each select="//teachings-3-latest/entry[position() mod $items-per-row = 1 and position() &lt; 3]">
								<div class="row">
									<xsl:for-each select=". | following-sibling::*[not(position() >= $items-per-row)]">
										<div class="span4 recent">
											<a>
												<xsl:call-template name="url-teachings" />
												<xsl:call-template name="teaching-poster-or-default">
													<xsl:with-param name="poster" select="poster" />
												</xsl:call-template>
											</a>
											<a>
												<xsl:call-template name="url-teachings" />
												<h4>
													<xsl:value-of select="title" disable-output-escaping="yes" />
												</h4>
											</a>
											<div class="meta recent">
												<p>
													<xsl:call-template name="date-teaching">
														<xsl:with-param name="date" select="date/date/start/@iso" />
													</xsl:call-template>
												</p>
											</div>
											<div class="description">
												<xsl:call-template name="truncate">
													<xsl:with-param name="node" select="description" />
													<xsl:with-param name="length" select="90" />
												</xsl:call-template>
											</div>
										</div>
									</xsl:for-each>
								</div>
							</xsl:for-each>
							<div class="component-series">
								<h3>Series</h3>
								<xsl:for-each select="//teachings-series-entries-filtered/entry[position() mod $items-per-row = 1 and position() &lt; 5]">
									<div class="row">
										<xsl:for-each select=". | following-sibling::*[not(position() >= $items-per-row)]">
											<div class="span4 series">
												<a>
													<xsl:call-template name="url-teachings-series" />
													<xsl:call-template name="teaching-poster-or-default">
														<xsl:with-param name="poster" select="poster" />
													</xsl:call-template>
												</a>
												<div class="info">
													<a>
														<xsl:call-template name="url-teachings-series" />
														<h4>
															<xsl:value-of select="title" disable-output-escaping="yes" />
															<span class="meta">
																<xsl:text> (</xsl:text>
																<xsl:value-of select="teachings/@items" />
																<xsl:text>&#160;teachings)</xsl:text>
															</span>
														</h4>
													</a>
												</div>
											</div>
										</xsl:for-each>
									</div>
								</xsl:for-each>
							</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="$position = 'column-full-width' and not(number($pt3))">
						<div class="span4">
							<h3>Search</h3>
							<div class="widget filter">
								<h4>Books of the Bible</h4>
								<h5>Old Testament</h5>
								<div class="collection">
									<xsl:for-each select="//books-of-the-bible/entry[ testament/@handle = 'old-testament' ]">
										<xsl:call-template name="bible-book">
											<xsl:with-param name="book" select="name" />
										</xsl:call-template>
										<xsl:if test="position() &lt; last()">, </xsl:if>
									</xsl:for-each>
								</div>
								<h5>New Testament</h5>
								<div class="collection">
									<xsl:for-each select="//books-of-the-bible/entry[ testament/@handle = 'new-testament' ]">
										<xsl:call-template name="bible-book">
											<xsl:with-param name="book" select="name" />
										</xsl:call-template>
										<xsl:if test="position() &lt; last()">, </xsl:if>
									</xsl:for-each>
								</div>
							</div>
							<div class="widget filter">
								<h4>Year</h4>
								<div class="collection">
									<xsl:call-template name="years-counter" />
								</div>
							</div>
							<div class="widget filter">
								<h4>Tags</h4>
								<div class="inline-search">
									<form>
										<xsl:attribute name="action">
											<xsl:call-template name="url-search-home">
												<xsl:with-param name="url-only" select="true()" />
											</xsl:call-template>
										</xsl:attribute>
										<label for="keywords"><span class="icon">s</span></label>
										<input type="hidden" name="sections" value="teachings-tags" />
										<input name="keywords" class="keywords" placeholder="Search" autocomplete="off" onclick="this.select()" />
									</form>
								</div>
								<div class="collection">
									<xsl:for-each select="//teachings-tags-random-filtered/entry">
										<a href="{$root}/{//tags-all-entries/entry[tag/@handle = 'teachings']/@id}/teachings/tag/{@id}/">
											<xsl:value-of select="tag" disable-output-escaping="yes" />
										</a>
										<xsl:if test="position() &lt; last()">, </xsl:if>
									</xsl:for-each>
								</div>
								<!-- <a href="" class="more"><span class="icon">z</span> See all tags</a> -->
							</div>
						</div>
					</xsl:when>
				</xsl:choose>
			</div>
		</div>
	</xsl:if>

</xsl:template>


<xsl:template name="teaching-entry">

	<xsl:param name="entry" select="." />

	<xsl:for-each select="$entry">
		<xsl:if test="number($pt3)">
			<h1>
				<xsl:value-of select="title" disable-output-escaping="yes" />
				<br />
				<span class="verse">
					<xsl:text> </xsl:text>
					<xsl:value-of select="book/item" />
					<xsl:text> </xsl:text>
					<xsl:value-of select="chapter" />
				</span>
			</h1>
		</xsl:if>
		<xsl:if test="not($pt1) and video/item">
			<iframe src="http://player.vimeo.com/video/{video/item/id}?title=0&amp;byline=0&amp;portrait=0&amp;color=d83629" frameborder="0" class="video" webkitAllowFullScreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowFullScreen="allowFullScreen" style="width:620px; height:349px; margin: 0 0 20px 0"></iframe>
		</xsl:if>
		<xsl:if test="number($pt3) and video/item">
			<iframe src="http://player.vimeo.com/video/{video/item/id}?title=0&amp;byline=0&amp;portrait=0&amp;color=d83629" frameborder="0" class="video" webkitAllowFullScreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowFullScreen="allowFullScreen" style="width: 100%; height: 529px; margin: 0 0 20px 0"></iframe>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="not($pt1) and video/item">
				<h2>
					<a>
						<xsl:call-template name="url-teachings" />
						<xsl:value-of select="title" disable-output-escaping="yes" />
					</a>
				</h2>
				<div class="meta">
					<p>
						<span class="badge">
							<xsl:value-of select="filename" />
						</span>
						<span class="teacher">
							<em>by </em>
							<xsl:value-of select="speaker/item/first-name" disable-output-escaping="yes" />
							<xsl:text disable-output-escaping="yes"> </xsl:text>
							<xsl:value-of select="speaker/item/last-name" disable-output-escaping="yes" />
						</span>
						<span class="verse">
							<i class="icon-book"></i>
							<xsl:text> </xsl:text>
							<xsl:value-of select="book/item" />
							<xsl:text> </xsl:text>
							<xsl:value-of select="chapter" />
						</span>
						<span class="divider">|</span>
						<span class="date">
							<xsl:call-template name="date-teaching">
								<xsl:with-param name="date" select="date/date/start/@iso" />
							</xsl:call-template>
						</span>
					</p>
				</div>
				<div class="description">
					<xsl:value-of select="description" disable-output-escaping="yes" />
				</div>
				<xsl:call-template name="teaching-tag-list">
					<xsl:with-param name="tags" select="tags/item" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="not(number($pt3))">
					<h4>
						<a>
							<xsl:call-template name="url-teachings" />
							<xsl:value-of select="title" disable-output-escaping="yes" />
							<span class="verse">
								<xsl:text> </xsl:text>
								<xsl:value-of select="book/item" />
								<xsl:text> </xsl:text>
								<xsl:value-of select="chapter" />
							</span>
						</a>
					</h4>
				</xsl:if>
				<div class="meta">
					<p>
						<span class="badge">
							<xsl:value-of select="filename" />
						</span>
						<span class="teacher">
							<em>by </em>
							<xsl:value-of select="speaker/item/first-name" disable-output-escaping="yes" />
							<xsl:text disable-output-escaping="yes"> </xsl:text>
							<xsl:value-of select="speaker/item/last-name" disable-output-escaping="yes" />
						</span>
						<span class="date">
							<span class="divider">|</span>
							<xsl:call-template name="date-teaching">
								<xsl:with-param name="date" select="date/date/start/@iso" />
							</xsl:call-template>
						</span>
					</p>
				</div>
				<div class="description">
					<xsl:value-of select="description"  disable-output-escaping="yes" />
				</div>
				<xsl:if test="tags/item">
					<xsl:call-template name="teaching-tag-list">
						<xsl:with-param name="tags" select="tags/item" />
					</xsl:call-template>
				</xsl:if>
				<xsl:call-template name="teaching-actions" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>

</xsl:template>


<xsl:template name="teaching-actions">

	<xsl:param name="entry" select="." />

	<xsl:variable name="audio-url">
		<!-- <xsl:text>http://72.10.33.203/media/audio/teachings/</xsl:text> -->
		<xsl:text disable-output-escaping="yes">http://66.147.244.244/~atheycre/teachings/</xsl:text>
		<xsl:value-of select="translate(filename,$en-uppercase-letters,$en-lowercase-letters)"/>
		<xsl:text>.mp3</xsl:text>
	</xsl:variable>

	<div>
		<xsl:call-template name="class-rows" />
		<div class="actions">
			<xsl:if test="filename">
				<span class="action">
					<audio src="{$audio-url}" preload="none" />
					<a href="{$audio-url}" class="download" target="_blank"><span class="icon big">~</span></a>
				</span>
			</xsl:if>
<!-- 			<xsl:if test="video/item/@id">
				<span class="action video">
					<span class="icon">V</span>
					<strong>Video</strong>
					<xsl:text> </xsl:text>
					<a>
						<xsl:call-template name="url-teachings" />
						<xsl:text>Watch</xsl:text>
					</a>
					<span class="divider">|</span>
					<a href="{$entry/url}" target="_blank"><span class="icon big">~</span></a>
				</span>
			</xsl:if> -->
		</div>
	</div>

</xsl:template>


<xsl:template name="teaching-tag-list">

	<xsl:param name="tags" />

	<div class="tags">
		<span class="icon">z</span>
		<xsl:for-each select="tags/item">
			<a>
				<xsl:call-template name="url-teachings-tags" />
				<xsl:value-of select="tag" disable-output-escaping="yes" />
			</a>
			<xsl:if test="position() &lt; last()">,</xsl:if>
			<xsl:text> </xsl:text>
		</xsl:for-each>
	</div>

</xsl:template>


<xsl:template name="date-teaching">

	<xsl:param name="date" />

	<xsl:call-template name="format-date">
		<xsl:with-param name="date" select="$date" />
		<xsl:with-param name="format" select="'%d+;, %m+; %d;%ds;, %y+;'" />
	</xsl:call-template>

</xsl:template>


<xsl:template name="bible-book">

	<xsl:param name="book" />

	<a href="{$root}/{//tags-all-entries/entry[tag/@handle = 'teachings']/@id}/teachings/book/{$book/@handle}/">
		<xsl:value-of select="$book" />
	</a>

</xsl:template>


<xsl:template name="years-counter">

	<xsl:param name="howMany">1996</xsl:param>

	<xsl:if test="$howMany &lt; $this-year + 1">
		<a href="{$root}/{$pt1}/{$pt2}/year/{$howMany}/"><xsl:value-of select="$howMany" /></a>
		<xsl:if test="$howMany &lt; $this-year">, </xsl:if>
		<xsl:call-template name="years-counter">
		<xsl:with-param name="howMany" select="$howMany + 1" />
		</xsl:call-template>
	</xsl:if>

</xsl:template>


<xsl:template name="teaching-poster-or-default">

	<xsl:param name="poster" />

	<img style="width: 100%; height: 169px">
		<xsl:attribute name="data-responsimage">
			<xsl:choose>
				<xsl:when test="string-length(poster/@path)">
					<xsl:value-of select="$poster/filename" disable-output-escaping="yes" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">accf-flat-4fc3e05b81747.jpg</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</img>

</xsl:template>


<xsl:template name="teachings-pagination">

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
				<xsl:value-of select="$pt3" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt4">
				<xsl:value-of select="$pt4" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt5">
				<xsl:value-of select="'$'" /><xsl:text>/</xsl:text>
			</xsl:if>
		</xsl:with-param>
	</xsl:call-template>

</xsl:template>


</xsl:stylesheet>