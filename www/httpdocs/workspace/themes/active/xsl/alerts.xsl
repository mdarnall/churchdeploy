<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-alerts">

    <xsl:param name="component" select="'alerts'" />
    <xsl:param name="entries" />

    <xsl:if test="count($entries)">

        <div class="alert">
            <xsl:call-template name="class-rows" />

            <xsl:for-each select="$entries">
                <xsl:if test="can-be-closed">
                    <a class="close" data-dismiss="alert">×</a>
                </xsl:if>

                <xsl:value-of select="content" disable-output-escaping="yes" />

            </xsl:for-each>

        </div>

    </xsl:if>

</xsl:template>


</xsl:stylesheet>