<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-search">

	<xsl:param name="component" select="'search'" />	
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<!-- <xsl:if test="count($entries)"> -->
		
	<div>
		<xsl:call-template name="class-position">
			<xsl:with-param name="component" select="$component" />
		</xsl:call-template>

		<h1>
			<xsl:choose>
				<xsl:when test="$url-keywords">
					<xsl:choose>
						<xsl:when test="$entries/../pagination/@total-entries">
							<xsl:value-of select="$entries/../pagination/@total-entries" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>No</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text> </xsl:text>
					<xsl:call-template name="pluralize">
						<xsl:with-param name="singular" select="'result'" />
						<xsl:with-param name="plural" select="'results'" />
						<xsl:with-param name="xpath" select="$entries/../pagination/@total-entries" />
					</xsl:call-template>
					<xsl:text> for</xsl:text>
					<br />
					<xsl:text>“</xsl:text>
					<xsl:value-of select="$url-keywords" disable-output-escaping="yes" />
					<xsl:text>”</xsl:text>					
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Search</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</h1>

		<xsl:if test="$url-sections">
			<p style="text-align:center">Section filtering is <strong>on</strong>, <a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}">turn it off</a> to see all results</p>
		</xsl:if>

		<div class="search">
			<form method="get">
				<xsl:call-template name="form-search-action"/>
				<xsl:if test="$url-sections">
					<input type="hidden" name="sections" value="{$url-sections}" />	
				</xsl:if>
				<input name="keywords" class="keywords" value="{$url-keywords}" onclick="this.select()" autocomplete="off" />
			</form>
			<p>Type and hit enter. You can search our entire site. Try <span onclick="$('.search input.keywords').val('Jesus');">Jesus</span>, <span onclick="$('.search input.keywords').val('Baptism');">Baptism</span> or <span onclick="$('.search input.keywords').val('Wilsonville');">Wilsonville</span>&#160;..</p>
		</div>

		<xsl:call-template name="pagination-search">
			<xsl:with-param name="pagination" select="$entries/../pagination" />
		</xsl:call-template>

		<div class="entries results">
			<div class="row"> 
				<div class="span8">

					<xsl:if test="not(count($entries)) and $url-keywords">
						<p><strong>Sorry about that!</strong><br />Please, try another search or head to the <a href="{$root}">homepage</a></p>

						<xsl:if test="$url-sections">
							<br />
							<p>Try <a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}">searching everywhere</a></p>
						</xsl:if>
					</xsl:if>

					<xsl:for-each select="$entries">
						
						<xsl:variable name="tag">
							<xsl:value-of select="tags/item/@id" />
						</xsl:variable>

						<xsl:choose>  
							<xsl:when test="@section = 'downloads'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<h3>
										<a target="_blank">
											<xsl:call-template name="url-downloads" />
											<i class="icon-download-alt"></i> 
											<xsl:value-of select="name" disable-output-escaping="yes" />
											<span class="hyphen">—</span>
											<span class="meta">
												<xsl:value-of select="file/filename" />
											</span>
										</a>
									</h3>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'events' or @section = 'events-recurring'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<h3>
										<a>
											<xsl:call-template name="url-events-recurring" />
											<i class="icon-calendar"></i> 
											<xsl:value-of select="name" disable-output-escaping="yes" />
											<span class="hyphen">—</span>
											<span class="meta">
												<xsl:call-template name="timespan-format">
													<xsl:with-param name="date" select="date/date" />
												</xsl:call-template>
												<xsl:value-of select="frequency" disable-output-escaping="yes" />
											</span>
										</a>
									</h3>
									<div class="description">
										<xsl:call-template name="truncate">
											<xsl:with-param name="node">
												<xsl:call-template name="remove-html">
													<xsl:with-param name="text" select="description" />
												</xsl:call-template>
											</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="excerpt">
										<xsl:copy-of select="excerpt" disable-output-escaping="yes" />											
									</div>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'tags'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<h3>
										<a>
											<xsl:call-template name="url-tags" />
											<i class="icon-bookmark"></i> 
											<xsl:value-of select="tag" disable-output-escaping="yes" />
											<span class="hyphen">—</span>
											<span class="meta">
												<xsl:value-of select="description" disable-output-escaping="yes" />
											</span>
										</a>
									</h3>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'teachings'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<h3>
										<a>
											<xsl:call-template name="url-teachings" />
											<i class="icon-book"></i> 
											<xsl:value-of select="title" disable-output-escaping="yes" />
											<span class="hyphen">—</span>
											<span class="meta">
												<xsl:value-of select="book/item" />
												<xsl:text> </xsl:text>
												<xsl:value-of select="chapter" />
											</span>
										</a>
									</h3>
									<div class="description">
										<xsl:call-template name="truncate">
											<xsl:with-param name="node">
												<xsl:call-template name="remove-html">
													<xsl:with-param name="text" select="description" />
												</xsl:call-template>
											</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="excerpt">
										<xsl:copy-of select="excerpt" disable-output-escaping="yes" />											
									</div>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'teachings-series'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<h3>
										<a>
											<xsl:call-template name="url-teachings-series" />
											<i class="icon-th"></i> 
											<xsl:value-of select="title" disable-output-escaping="yes" />
											<span class="hyphen">—</span>
											<span class="meta">
												<xsl:text> (</xsl:text>
												<xsl:value-of select="teachings/@items" />
												<xsl:text>&#160;teachings)</xsl:text>
											</span>
										</a>
									</h3>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'teachings-tags'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<h3>
										<a>
											<xsl:call-template name="url-teachings-tags" />
											<i class="icon-tag"></i> 
											<xsl:value-of select="tag" disable-output-escaping="yes" />
											<span class="hyphen">—</span>
											<span class="meta">
												<xsl:text>Show associated teachings</xsl:text>
											</span>
										</a>
									</h3>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'text' and string-length(//tags-all-entries/entry[@id = $tag]) &gt; 0">
								<div>
									<xsl:call-template name="search-entry-class" />
									<h3>
										<a>
											<xsl:call-template name="url-tags-by-text">
												<xsl:with-param name="tag" select="$tag"/>
											</xsl:call-template>
											<i class="icon-align-justify"></i>
											<xsl:value-of select="//tags-all-entries/entry[@id = $tag]/tag" disable-output-escaping="yes" />
											<span class="hyphen">—</span>
											<span class="meta">
												<xsl:call-template name="truncate">
													<xsl:with-param name="node">
														<xsl:call-template name="remove-html">
															<xsl:with-param name="text" select="content" />
														</xsl:call-template>
													</xsl:with-param>
												</xsl:call-template>
											</span>
										</a>
									</h3>
									<div class="excerpt">
										<xsl:copy-of select="excerpt" disable-output-escaping="yes" />											
									</div>
								</div>	
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</div>
				<xsl:if test="$url-keywords">
					<div class="span4 filters">
						<xsl:if test="
							not(//search-suggestions/word = $url-keywords) and 
							count(//search-suggestions/word) &gt; 0">
							<div class="suggestions">
								<h4>Did you mean...</h4>
								<xsl:for-each select="//search-suggestions/word">
									<a href="{$root}/{$pt1}/{$pt2}/?sections={$url-sections}&amp;keywords={.}">
										<xsl:value-of select="." disable-output-escaping="yes" />
									</a>
									<xsl:if test="position() &lt; last()"><br /></xsl:if>
								</xsl:for-each>
							</div>
						</xsl:if>
						
						<xsl:if test="
							not(//alternative-keywords/keyword = $url-keywords) and 
							count(//alternative-keywords/keyword) &gt; 0 and 
							string-length(//alternative-keywords/keyword/@alternative)">
							<div class="alternatives">
								<h4>Alternative keywords</h4>
								<xsl:for-each select="//alternative-keywords/keyword">
									<a href="{$root}/{$pt1}/{$pt2}/?sections={$url-sections}&amp;keywords={@alternative}">
										<xsl:value-of select="@alternative" disable-output-escaping="yes" />
									</a>
									<xsl:if test="position() &lt; last()"><br /></xsl:if>
								</xsl:for-each>
							</div>
						</xsl:if>

						<div class="filter">
							<h4>Search sections</h4>
							<div class="collection">
								<ul>
									<li><a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}"><strong>Show all</strong></a></li>
									<li><a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=downloads">Downloads</a></li>
									<li><a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=events">Events</a></li>
									<li><a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=tags">Pages</a></li>
									<li><a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=text">Page contents</a></li>
									<li><a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=events-recurring">Recurring events</a></li>
									<li><a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=teachings">Teachings</a></li>
									<li><a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=teachings-series">Teachings series</a></li>
									<li><a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=teachings-tags">Teachings tags</a></li>
								</ul>
							</div>
						</div>	
					</div>				
				</xsl:if>
			</div>
		</div>

		<xsl:call-template name="pagination-search">
			<xsl:with-param name="pagination" select="$entries/../pagination" />
		</xsl:call-template>
	</div>

</xsl:template>


<xsl:template name="search-entry-class">
	
	<xsl:call-template name="class-rows">
		<xsl:with-param name="class">
			<xsl:text>type-</xsl:text>
			<xsl:value-of select="@section" disable-output-escaping="yes" />
		</xsl:with-param>
	</xsl:call-template>
	
</xsl:template>


<xsl:template name="pagination-search">
	<xsl:param name="pagination" />

	<xsl:call-template name="cd-pagination">
		<xsl:with-param name="pagination" select="$pagination" />
		<xsl:with-param name="pagination-url">
			<xsl:value-of select="$root" />
			<xsl:text>/</xsl:text>
			<xsl:value-of select="$pt1" />
			<xsl:text>/</xsl:text>
			<xsl:value-of select="$pt2" />
			<xsl:text>/?</xsl:text>
			<xsl:if test="$url-keywords">
				<xsl:text>&amp;keywords=</xsl:text>
				<xsl:value-of select="$url-keywords" />
			</xsl:if>
			<xsl:if test="$url-sections">
				<xsl:text>&amp;sections=</xsl:text>
				<xsl:value-of select="$url-sections" />
			</xsl:if>
			<xsl:text>&amp;page=</xsl:text>
			<xsl:value-of select="'$'" />
			
		</xsl:with-param>
	</xsl:call-template>
	
</xsl:template>


</xsl:stylesheet>
