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

     <xsl:if test="//alerts-global">

        <xsl:for-each select="//alerts-global/entry">
            <div>
                <xsl:choose>
                    <xsl:when test="type = 'warning'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-error</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="type = 'success'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-success</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="type = 'info'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-info</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
<!--                 <xsl:if test="can-be-closed = 'Yes'">
                    <a class="close" data-dismiss="alert">×</a>
                </xsl:if> -->

                <xsl:if test="url">
                    <a>
                        <xsl:choose>
                            <xsl:when test="//alerts-global/entry/type = 'warning'">
                                <xsl:attribute name="class">
                                    <xsl:text>btn</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>btn-danger</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>pull-right</xsl:text>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="//alerts-global/entry/type = 'success'">
                                <xsl:attribute name="class">
                                    <xsl:text>btn</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>btn-success</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>pull-right</xsl:text>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="//alerts-global/entry/type = 'info'">
                                <xsl:attribute name="class">
                                    <xsl:text>btn</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>btn-info</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>pull-right</xsl:text>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="class">
                                    <xsl:text>btn</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>btn-warning</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>pull-right</xsl:text>
                                </xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:attribute name="href">
                            <xsl:value-of select="url" />
                        </xsl:attribute>
                        <xsl:attribute name="target">
                            <xsl:text>_blank</xsl:text>
                        </xsl:attribute>
                        <xsl:text>More Info</xsl:text>
                    </a>

                </xsl:if>

                <xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />

            </div>
        </xsl:for-each>


    </xsl:if>

    <xsl:if test="//alerts-entries-by-tag">

        <xsl:for-each select="//alerts-entries-by-tag/entry">
            <div>
                <xsl:choose>
                    <xsl:when test="type = 'warning'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-error</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="type = 'success'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-success</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="type = 'info'">
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:text>alert-info</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">
                            <xsl:text>alert</xsl:text>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
<!--                 <xsl:if test="can-be-closed = 'Yes'">
                    <a class="close" data-dismiss="alert">×</a>
                </xsl:if> -->

                <xsl:if test="url">
                    <a>
                        <xsl:choose>
                            <xsl:when test="//alerts-entries-by-tag/entry/type = 'warning'">
                                <xsl:attribute name="class">
                                    <xsl:text>btn</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>btn-danger</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>pull-right</xsl:text>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="//alerts-entries-by-tag/entry/type = 'success'">
                                <xsl:attribute name="class">
                                    <xsl:text>btn</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>btn-success</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>pull-right</xsl:text>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="//alerts-entries-by-tag/entry/type = 'info'">
                                <xsl:attribute name="class">
                                    <xsl:text>btn</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>btn-info</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>pull-right</xsl:text>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="class">
                                    <xsl:text>btn</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>btn-warning</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:text>pull-right</xsl:text>
                                </xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:attribute name="href">
                            <xsl:value-of select="url" />
                        </xsl:attribute>
                        <xsl:attribute name="target">
                            <xsl:text>_blank</xsl:text>
                        </xsl:attribute>
                        <xsl:text>More Info</xsl:text>
                    </a>

                </xsl:if>

                <div class="alert-content pull-left">
                    <xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
                </div>


            </div>
        </xsl:for-each>


    </xsl:if>


</xsl:template>


</xsl:stylesheet>