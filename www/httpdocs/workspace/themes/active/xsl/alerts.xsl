<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-alerts">

    <xsl:param name="component" select="'alerts'" />
    <xsl:param name="entries" />

    <xsl:if test="count($entries)">

        <div class="alert">

            <xsl:for-each select="$entries">
                <xsl:if test="content">
                    <a class="close" data-dismiss="alert">×</a>
                </xsl:if>

                <xsl:value-of select="normalize-space(content)"  />

            </xsl:for-each>

        </div>

    </xsl:if>

</xsl:template>


</xsl:stylesheet>