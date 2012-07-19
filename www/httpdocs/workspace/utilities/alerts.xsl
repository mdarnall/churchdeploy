<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="alerts">

	<xsl:if test="//status-all-entries/entry[name = 'ustream-status']/content = 'live'">
		<div class="alert alert-success alertLive hidden">
			<a class="close" data-dismiss="alert">×</a>
			<strong>We're broadcasting live right now!</strong>
			<a class="btn btn-success modalLiveLink">
				<xsl:text> Watch the broadcast »</xsl:text>
			</a>
		</div>
	</xsl:if>

    <xsl:if test="//alerts-entries-by-tag">


        <xsl:for-each select="//alerts-entries-by-tag/entry">
            <div class="alert">
            <xsl:if test="content">
                <a class="close" data-dismiss="alert">×</a>
            </xsl:if>

            <xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
            </div>
        </xsl:for-each>


    </xsl:if>

</xsl:template>


</xsl:stylesheet>