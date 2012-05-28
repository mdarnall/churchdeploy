<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-teachings">
	
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		
		<div>

			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'teachings'" />
			</xsl:call-template>

			<xsl:choose>
				
				<xsl:when test="$position = 'column-full-width'">

					<div class="search">
						<form>
							<input name="search" value="Search.." onclick="this.select()" />
						</form>
						<p>You can search all of our media by category, speaker, etc. Try <span onclick="$('.search input').val('Jesus');">Jesus</span> or <span onclick="$('.search input').val('resurrection');">resurrection</span>...</p>
					</div>

					<xsl:for-each select="//teachings-featured-filtered/entry">
						<div class="latest">
							<iframe src="http://player.vimeo.com/video/{video/item/id}?title=0&amp;byline=0&amp;portrait=0&amp;color=d83629" frameborder="0" class="video" webkitAllowFullScreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowFullScreen="allowFullScreen"></iframe>

							<div class="actions">
								
								<i class="icon-headphones"></i>
								<strong>Audio</strong> <a href="">Listen</a>
								<xsl:text> | </xsl:text>
								<a href="">Download</a>
								<xsl:text> | </xsl:text> 
								<i class="icon-facetime-video"></i>
								<strong>Video</strong> <a href="">View</a>
								<xsl:text> | </xsl:text>
								<a href="">Download</a>
							</div>

							<h3>
								<xsl:value-of select="title" disable-output-escaping="yes" />
							</h3>

							<div class="meta">
								<span class="badge">
									<xsl:value-of select="filename" />
								</span>
								<xsl:text>Scripture: </xsl:text>
								<xsl:value-of select="book/item" />
								<xsl:text> </xsl:text>
								<xsl:value-of select="chapter" />
								<xsl:text> | </xsl:text>
								<xsl:call-template name="date-teaching">
									<xsl:with-param name="date" select="date/date/start/@iso"/>
								</xsl:call-template>
							</div>
							<div class="description">
								<xsl:value-of select="description"  disable-output-escaping="yes" />
							</div>
							<div class="tags">
								<i class="icon-tags"></i>
								<xsl:for-each select="tags/item">
									<a href="#">
										<xsl:value-of select="tag" disable-output-escaping="yes" />
									</a>
									<xsl:if test="position() &lt; last()">,</xsl:if>
									<xsl:text> </xsl:text>
								</xsl:for-each>
							</div>
						</div>
					</xsl:for-each>
					
					<div class="row">

						<div class="span8">
							<h2>Recent teachings</h2>

							<xsl:variable name="items-per-row" select="2" />

						    <xsl:for-each select="//teachings-recent-filtered/entry[position() mod $items-per-row = 1 and position() &lt; 3]">
						        <div class="row">
						            <xsl:for-each select=". | following-sibling::*[not(position() >= $items-per-row)]">
						            	<div class="span4">
											<h4>
												<xsl:value-of select="title" disable-output-escaping="yes" />
											</h4>
											<div class="meta">
												<xsl:call-template name="date-teaching">
													<xsl:with-param name="date" select="date/date/start/@iso"/>
												</xsl:call-template>
											</div>
											<xsl:choose>
												<xsl:when test="string-length(poster/@path)">
													<img data-responsimage="{poster/filename}" style="width: 100%; height: 168px" />
												</xsl:when>
												<xsl:otherwise>
													<img data-responsimage="teaching-general-large-4fc3806e8bb9f.jpg" style="width: 100%; height: 168px" />
												</xsl:otherwise>
											</xsl:choose>

											<div class="description">
												<p><xsl:apply-templates select="description" mode="truncate" /></p>
											</div>
										</div>
						            </xsl:for-each>
						        </div>
						    </xsl:for-each>

						    <h2>Recommended series</h2>

						    <xsl:for-each select="//teachings-recent-filtered/entry[position() mod $items-per-row = 1 and position() &lt; 5]">
						        <div class="row">
						            <xsl:for-each select=". | following-sibling::*[not(position() >= $items-per-row)]">
						            	<div class="span4">
											<h4>
												<xsl:value-of select="title" disable-output-escaping="yes" />
											</h4>
											<div class="meta">
												<xsl:call-template name="date-teaching">
													<xsl:with-param name="date" select="date/date/start/@iso"/>
												</xsl:call-template>
											</div>
											<xsl:choose>
												<xsl:when test="string-length(poster/@path)">
													<img data-responsimage="{poster/filename}" style="width: 100%; height: 168px" />
												</xsl:when>
												<xsl:otherwise>
													<img data-responsimage="teaching-general-large-4fc3806e8bb9f.jpg" style="width: 100%; height: 168px" />
												</xsl:otherwise>
											</xsl:choose>

											<div class="description">
												<p><xsl:apply-templates select="description" mode="truncate" /></p>
											</div>
										</div>
						            </xsl:for-each>
						        </div>
						    </xsl:for-each>

						</div>

						<div class="span4">
							<h3>Search media by</h3>
							<div class="widget filter">
								<h4>Books of the Bible</h4>
								<div class="collection">
									<h5>Old Testament</h5>
									<xsl:for-each select="//books-of-the-bible/entry[ testament/@handle = 'old-testament' ]">
										<xsl:call-template name="bible-book">
											<xsl:with-param name="book" select="name"/>
										</xsl:call-template>
										<xsl:if test="position() &lt; last()">, </xsl:if>
									</xsl:for-each>
								</div>
								<div class="collection">
									<h5>New Testament</h5>
									<xsl:for-each select="//books-of-the-bible/entry[ testament/@handle = 'new-testament' ]">
										<xsl:call-template name="bible-book">
											<xsl:with-param name="book" select="name"/>
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
								<div class="collection">
									<xsl:for-each select="//teachings-tags-random-entries/entry">
										<a href="#">
											<xsl:value-of select="tag" disable-output-escaping="yes" />
										</a>
										<xsl:if test="position() &lt; last()">, </xsl:if>
									</xsl:for-each>

								</div>
								<a href="" class="more">See all tags</a>
							</div>
						</div>

					</div>

					<xsl:for-each select="$entries">

						<div>

							<xsl:call-template name="class-rows" />

							<div class="header">

							</div>

						</div>
						
					</xsl:for-each>

				</xsl:when>

			</xsl:choose>

		</div>

	</xsl:if>

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
	<a href="">
		<xsl:value-of select="$book" />
	</a>
</xsl:template>


<xsl:template name="years-counter">

	<xsl:param name="howMany">1996</xsl:param>

	<xsl:if test="$howMany &lt; $this-year">
		<a href="#"><xsl:value-of select="$howMany" /></a>
		<xsl:text> </xsl:text>
		<xsl:call-template name="years-counter">
		<xsl:with-param name="howMany" select="$howMany + 1"/>
		</xsl:call-template>
	</xsl:if>

</xsl:template>


</xsl:stylesheet>

<!-- 

<xsl:call-template name="edit-entry">
							<xsl:with-param name="link" select="concat($root, '/symphony/publish/videos/edit/', @id, '/')" />
						</xsl:call-template>


<xsl:template name="teachings">
	
	<div class="teachings">
		
		<xsl:choose>
			<xsl:when test="$pt3 = 'date' and $pt4 = 'latest'">
				
				<xsl:call-template name="search-results">
					<xsl:with-param name="results" select="//teachings-all-entries-filtered" />
				</xsl:call-template>
				
			</xsl:when>
			<xsl:otherwise>	
			
				<xsl:call-template name="search-results">
					<xsl:with-param name="results" select="//teachings-all-entries-filtered" />
				</xsl:call-template>
				
			</xsl:otherwise>
		</xsl:choose>
		
		
		<h3>Filter</h3>
		
		<div class="section">
		
			<h4>Old Testament</h4>
			
			<p>
				<xsl:for-each select="//static-xml-books-of-the-bible/books-of-the-bible/entry[ testament/@handle = 'old-testament' ]">
					
					<a href="#">
						<xsl:value-of select="name" disable-output-escaping="yes" />
					</a>
					
					<xsl:if test="position() &lt; last()">, </xsl:if>
					
				</xsl:for-each>
			</p>
		</div>
		
		<div class="section">
		
			<h4>New Testament</h4>
			
			<p>
				<xsl:for-each select="//static-xml-books-of-the-bible/books-of-the-bible/entry[ testament/@handle = 'new-testament' ]">
					
					<a href="#">
						<xsl:value-of select="name" disable-output-escaping="yes" />
					</a>
					
					<xsl:if test="position() &lt; last()">, </xsl:if>
					
				</xsl:for-each>
			</p>
			
		</div>
		
	</div>

</xsl:template>



<xsl:template name="search-results">
	
	<xsl:param name="results" />
	
	<h3>Results</h3>
	
	<div class="search-results">
	
		<xsl:if test="$results/pagination/@total-entries = 0">
			No entries here, try <a href="{$root}/{$pt1}/{$pt2}/{$pt3}/1/{$pt5}/">page 1</a>.
		</xsl:if>
		
		<xsl:call-template name="element-page-navigation">
			<xsl:with-param name="results" select="$results" />
		</xsl:call-template>
		
		<xsl:for-each select="$results/entry">
	
			<div class="entry">
	
				<h5 class="title">
					<a href="#">
						<xsl:value-of select="msg-title" disable-output-escaping="yes" />
					</a>
				</h5>
				
				<div class="description">
					<xsl:value-of select="msg-description" disable-output-escaping="yes" />
				</div>
				
				<div class="details">
					
					<a href="">
						<xsl:value-of select="book" disable-output-escaping="yes" />
					</a>
					<xsl:text> </xsl:text>
					<xsl:value-of select="msg-chapter" disable-output-escaping="yes" />
						
					<xsl:text>&#160;&#160;|&#160;&#160;</xsl:text>
					
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="msg-date" />
						<xsl:with-param name="format" select="'%m+; %d;%ds;, %y+;'" />
					</xsl:call-template>
					
					<xsl:text>&#160;&#160;|&#160;&#160;</xsl:text>
						
					<a href="http://66.147.244.244/~atheycre/teachings/{msg-number}.lq.mp3">Download MP3</a>
					
				</div>
				
			</div>
				
		</xsl:for-each>	
		
		<xsl:call-template name="element-page-navigation">
			<xsl:with-param name="results" select="$results" />
		</xsl:call-template>
		
	</div>

</xsl:template>



<xsl:template name="element-page-navigation">
	
	<xsl:param name="results" />
	
	<xsl:if test="$results/pagination/@total-entries > 0">
		
		<p>
			Showing 
			<xsl:value-of select="$pt5" disable-output-escaping="yes" /> 
			of 
			<xsl:value-of select="$results/pagination/@total-entries" disable-output-escaping="yes" /> 
			entries
		</p> 
		
		<div class="page-navigation clearfix">
		
			<xsl:call-template name="pagination">
			
				<xsl:with-param name="pagination" select="$results/pagination" />
				<xsl:with-param name="pagination-url" select="concat( $root, '/', $current-page, '/', $pt2, '/', $pt3, '/', '$', '/', $pt5 )" />
				<xsl:with-param name="show-range" select="5" />
				
				<xsl:with-param name="label-previous" select="'← Previous'" />
				<xsl:with-param name="label-next" select="'Next →'" />
				
				<xsl:with-param name="class-pagination" select="'pagination'" />
				<xsl:with-param name="class-page" select="''" />
				<xsl:with-param name="class-next" select="'next'" />
				<xsl:with-param name="class-previous" select="'prev'" />
				<xsl:with-param name="class-selected" select="'active'" />
				<xsl:with-param name="class-disabled" select="'disabled'" />
				<xsl:with-param name="class-ellipsis" select="'disabled'" />
				
			</xsl:call-template>
		
			
			<div class="number-to-display pagination">
				<ul>
					<li class="description disabled">
						<a href="">Show</a>
					</li>
					<li>
						<xsl:if test="$pt5 = 5">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/{$pt1}/{$pt2}/{$pt3}/{$pt4}/5/">5</a>
					</li>
					<li>
						<xsl:if test="$pt5 = 10">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/{$pt1}/{$pt2}/{$pt3}/{$pt4}/10/">10</a>
					</li>
					<li>
						<xsl:if test="$pt5 = 25">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/{$pt1}/{$pt2}/{$pt3}/{$pt4}/25/">25</a>
					</li>
					<li>
						<xsl:if test="$pt5 = 50">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/{$pt1}/{$pt2}/{$pt3}/{$pt4}/50/">50</a>
					</li>
					<li class="next">
						<xsl:if test="$pt5 = 100">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<a class="" href="{$root}/{$pt1}/{$pt2}/{$pt3}/{$pt4}/100/">100</a>
					</li>
				</ul>
			</div>
		
		</div>
			
	</xsl:if>
	 -->

	
<!--	<div class="pagination">
	  <ul>
	    <li class="prev disabled"><a href="#">← Previous</a></li>
	    <li class="active"><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li class="next"><a href="#">Next →</a></li>
	  </ul>
	</div>-->
