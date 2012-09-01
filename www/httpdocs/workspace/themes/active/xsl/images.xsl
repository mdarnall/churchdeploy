<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-images">

	<xsl:param name="component" select="'images'" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="count($entries)">
		<div>
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="$component" />
			</xsl:call-template>
			<xsl:for-each select="$entries">
				<div>
					<xsl:call-template name="class-rows">
						<xsl:with-param name="class" select="'image'" />
					</xsl:call-template>
					<img width="100%">
						<xsl:attribute name="data-responsimage">
							<xsl:value-of select="image/filename" />
						</xsl:attribute>
						<xsl:attribute name="data-responsimage-anchor">
							<xsl:choose>
								<xsl:when test="position = 'Top left'"     >1</xsl:when>
								<xsl:when test="position = 'Top center'"   >2</xsl:when>
								<xsl:when test="position = 'Top right'"    >3</xsl:when>
								<xsl:when test="position = 'Middle left'"  >4</xsl:when>
								<xsl:when test="position = 'Middle center'">5</xsl:when>
								<xsl:when test="position = 'Middle right'" >6</xsl:when>
								<xsl:when test="position = 'Bottom left'"  >7</xsl:when>
								<xsl:when test="position = 'Bottom center'">8</xsl:when>
								<xsl:when test="position = 'Bottom right'" >9</xsl:when>
								<xsl:otherwise>5</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</img>
					<xsl:call-template name="edit-entry">
						<xsl:with-param name="component" select="$component"/>
					</xsl:call-template>
				</div>
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>


</xsl:stylesheet>