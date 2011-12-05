<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="class-position">
	
	<xsl:param name="component" />
	<xsl:param name="position" />
	
	<xsl:attribute name="class">
		
		<xsl:text>component </xsl:text>
		
		<xsl:text>component-</xsl:text>
		<xsl:value-of select="$component" disable-output-escaping="yes" />
		
		<xsl:text> </xsl:text>
		
		<xsl:value-of select="$position" disable-output-escaping="yes" />
	
	</xsl:attribute>
	
</xsl:template>



<xsl:template name="class-rows">

	<xsl:attribute name="class">
	
		<xsl:text>entry clearfix</xsl:text>
		
		<xsl:choose>
			<xsl:when test="position() mod 2 = 0">
				<xsl:text> even</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text> odd</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:if test="position() = 1">
			<xsl:text> first</xsl:text>
		</xsl:if>
		
		<xsl:if test="position() &gt; 1 and position() &lt; last()">
			<xsl:text> middle</xsl:text>
		</xsl:if>
		
		<xsl:if test="position() = last()">
			<xsl:text> last</xsl:text>
		</xsl:if>
		
		<xsl:for-each select="tags/item">
			<xsl:text> category-</xsl:text>
			<xsl:value-of select="@id" />
		</xsl:for-each>
		
	</xsl:attribute>

</xsl:template>



</xsl:stylesheet>