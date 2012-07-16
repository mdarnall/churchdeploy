<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:include href="../utilities/date-time-advanced.xsl"/>

<xsl:template match="/">

	<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">
        <channel>
            <title>Athey Creek | Audio Podcast</title>
            <itunes:summary>The Athey Creek Audio Podcast features teachings by Pastor Brett Meador and other leaders at Athey Creek Christian Fellowship. Brett's radio program, Day by Day is featured on radio stations in the Portland area, Southern Oregon and Vanuatu. Athey Creek is fellowship of believers that strive to worship God, follow Jesus, study the Bible, and serve one another. We believe church is supposed to be like a hospital, a place of healing and refreshment.</itunes:summary>
            <description>The Athey Creek Audio Podcast features teachings by Pastor Brett Meador and other leaders at Athey Creek Christian Fellowship. Brett's radio program, Day by Day is featured on radio stations in the Portland area, Southern Oregon and Vanuatu. Athey Creek is fellowship of believers that strive to worship God, follow Jesus, study the Bible, and serve one another. We believe church is supposed to be like a hospital, a place of healing and refreshment.</description>
            <link><xsl:value-of select="$root" /></link>
            <itunes:subtitle>Teachings from God's inspired word.</itunes:subtitle>
            <itunes:author><xsl:value-of select="$website-name" /></itunes:author>
            <itunes:summary>Weekly teachings from <xsl:value-of select="$website-name" /></itunes:summary>
            <language>en-us</language>
            <copyright>© 1996-<xsl:value-of select="$this-year"/>. <xsl:value-of select="$website-name" />. All rights reserved.</copyright>
            <itunes:owner>
                <itunes:name><xsl:value-of select="$website-name" /></itunes:name>
                <itunes:email>web@atheycreek.com</itunes:email>
            </itunes:owner>
            <itunes:image>
                <xsl:attribute name="href">
                    <xsl:value-of select="$root" />
                    <xsl:text>/workspace/img/itunes-podcast.jpg</xsl:text>
                </xsl:attribute>
            </itunes:image>
            <!-- iTunes Browse Podcasts Category -->
            <itunes:category text="Religion &amp; Spirituality">
                <!-- iTunes Browse Podcasts Subcategory -->
                <itunes:category text="Christianity"></itunes:category>
            </itunes:category>
            <!-- Start Sermon Information -->
            <xsl:for-each select="//itunes-podcast/entry[hide = 'No']">
                <item>
                    <title>
                        <xsl:value-of select="title" />
                    </title>
                    <itunes:author>
                        <xsl:value-of select="speaker/item/first-name" />
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="speaker/item/last-name" />
                    </itunes:author>
                    <itunes:subtitle>
                        <xsl:value-of select="book/item" />
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="chapter" />
                    </itunes:subtitle>
                    <itunes:summary>
                        <xsl:text>A teaching in</xsl:text>
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="book/item" />
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="chapter" />
                        <xsl:text>&#160;</xsl:text>
                        <xsl:text>at Athey Creek Christian Fellowship by</xsl:text>
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="speaker/item/first-name" />
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="speaker/item/last-name" />
                        <xsl:text>.</xsl:text>
                    </itunes:summary>
                    <itunes:image>
                        <xsl:attribute name="href">
                            <xsl:value-of select="$root" />
                            <xsl:text>/workspace/img/itunes-podcast.jpg</xsl:text>
                        </xsl:attribute>
                    </itunes:image>
                    <enclosure>
                        <xsl:attribute name="url">
                            <xsl:text disable-output-escaping="yes">http://66.147.244.244/~atheycre/teachings/</xsl:text>
                            <xsl:value-of select="filename"/>
                            <xsl:text>.mp3</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="length">
                            <xsl:choose>
                                <xsl:when test="audio-filesize">
                                    <xsl:value-of select="audio-filesize" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>23456789</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:attribute name="type">
                            <xsl:text disable-output-escaping="yes">audio/mpeg</xsl:text>
                        </xsl:attribute>
                    </enclosure>
                    <guid>
                        <xsl:text disable-output-escaping="yes">http://66.147.244.244/~atheycre/teachings/</xsl:text>
                        <xsl:value-of select="filename"/>
                        <xsl:text>.mp3</xsl:text>
                    </guid>
                    <pubDate>
                        <xsl:value-of select="date/date/start/@iso"/>
                    </pubDate>
                    <itunes:duration>
                        <xsl:choose>
                            <xsl:when test="audio-duration">
                                <xsl:value-of select="audio-duration" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>00:60:00</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </itunes:duration>
                    <itunes:keywords>Brett Meador, Athey Creek, Day by Day, Portland, Wilsonville, Oregon, PDX</itunes:keywords>
                    <itunes:explicit>no</itunes:explicit>
                    <description>
                        <xsl:value-of select="book/item" />
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="chapter" />
                    </description>
                </item>
            </xsl:for-each>

        </channel>
    </rss>

</xsl:template>

</xsl:stylesheet>