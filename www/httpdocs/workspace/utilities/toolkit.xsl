<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!-- 

Toolkit

-->
<xsl:template name="toolkit">

    <xsl:if test="$pt1 = 'toolkit' and $pt2 = 'images'">
        
        <h2>New</h2>

        <xsl:if test="//images-create/message or //images-create/image/@message">
            <p>
                <b><xsl:value-of select="//images-create/message" /></b>
                <br />
                <xsl:value-of select="//images-create/image/@message" />
            </p>
        </xsl:if>
        
        <form method="post" action="" enctype="multipart/form-data">
            <label>Image <input name="fields[image]" type="file" style="width: 200px; background: #fff; border: solid 1px #ccc; padding: 15px; margin: 15px 0;" /></label>
            <input name="action[images-create]" type="submit" value="Submit" class="btn btn-primary" />
        </form>

        <p><a href="{$root}/symphony/publish/images/new/">Use the multiple file uploader »</a></p>

        <xsl:if test="//images-toolkit-all-entries-filtered/entry">
            <hr />
            <table border="1" style="border-collapse: collapse">
                <xsl:for-each select="//images-toolkit-all-entries-filtered/entry">
                    <tr>
                        <td style="padding: 10px">
                            <img src="{$root}/image/2/0/50/5/0{image/@path}/{image/filename}" style="border: #000 1px solid" />
                        </td>
                        <td style="padding: 10px">
                            <input value='&lt;img data-responsimage="{image/filename}" style="width: 350px; height: 200px;" class="inline" data-responsimage-anchor="5" /&gt;' style="width: 550px; font-size: 13px" onclick="this.select()" />
                            <p style="font-size: 12px; margin: 5px 0; font-family: helvetica">
                                Filesize: <xsl:value-of select="image/@size" /> | 
                                Type: <xsl:value-of select="image/@type" /> | 
                                Created: <xsl:value-of select="image/meta/@creation" /> | 
                                Original size: <xsl:value-of select="image/meta/@width" />x<xsl:value-of select="image/meta/@height" />
                            </p>
                        </td>
                        <td style="padding: 10px">
                            <a href="{$root}/symphony/publish/images/edit/{@id}/">Edit/Delete »</a>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </xsl:if>

    </xsl:if>

</xsl:template>


<!-- 

Global date formatting

-->
<xsl:template name="date-with-format">

    <div class="date">
        <xsl:call-template name="format-date">
            <xsl:with-param name="date" select="date" />
            <xsl:with-param name="format" select="'m x, Y'" />
        </xsl:call-template>
    </div>

</xsl:template>


<!-- 

Global Pagination

-->
<xsl:template name="cd-pagination">
    
    <xsl:param name="pagination"     select="$pagination" />
    <xsl:param name="pagination-url" select="$pagination-url" />

    <xsl:call-template name="pagination">

        <xsl:with-param name="pagination" select="$pagination" />
        <xsl:with-param name="pagination-url" select="$pagination-url" />
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

</xsl:template>


<!-- 

Pluralization

Count items to check for pluralization

USAGE:
    
    <xsl:call-template name="pluralize">
        <xsl:with-param name="singular" select="'Location'"/>
        <xsl:with-param name="plural" select="'Locations'"/>
        <xsl:with-param name="xpath" select="//locations-entries-by-tag/entry"/>
    </xsl:call-template>

-->
<xsl:template name="pluralize">
    
    <xsl:param name="singular"/>
    <xsl:param name="plural"/>
    <xsl:param name="xpath"/>

    <xsl:choose>
        <xsl:when test="count($xpath) &gt; 1">
            <xsl:value-of select="$plural" disable-output-escaping="yes" />
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$singular" disable-output-escaping="yes" />
        </xsl:otherwise>
    </xsl:choose>

</xsl:template>


<!-- 

How to start a URL when using multi-lingual

-->
<xsl:template name="root">

    <xsl:choose>
    	<xsl:when test="$url-language">
            <xsl:value-of select="concat($root, '/', $url-language, '/')" />
    	</xsl:when>
    	<xsl:otherwise>
    		<xsl:value-of select="concat($root, '/')" />
    	</xsl:otherwise>
    </xsl:choose>
    
</xsl:template>



<!-- 

Removes HTML tags

-->
<xsl:template name="remove-html">
    
    <xsl:param name="text"/>
    
    <xsl:choose>
        <xsl:when test="contains($text, '&lt;')">
            <xsl:value-of select="normalize-space(substring-before($text, '&lt;'))"/>
            <xsl:text> </xsl:text>
            <xsl:call-template name="remove-html">
                <xsl:with-param name="text" select="normalize-space(substring-after($text, '&gt;'))"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="normalize-space($text)"/>
        </xsl:otherwise>
    </xsl:choose>

</xsl:template>



<!-- 

Strip out spaces in source

-->
<xsl:strip-space elements="*"/>

<xsl:template name="nbsp">
    
    <xsl:param name="text" />
    
    <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$text" />
        <xsl:with-param name="replace" select="' '" />
        <xsl:with-param name="by" select="'&#160;'" />
    </xsl:call-template>

</xsl:template>



<!-- 

Search and replace

-->
<xsl:template name="string-replace-all">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="by"/>
    <xsl:choose>
        <xsl:when test="contains($text,$replace)">
            <xsl:value-of select="substring-before($text,$replace)"/>
            <xsl:value-of select="$by"/>
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="substring-after($text,$replace)"/>
                <xsl:with-param name="replace" select="$replace"/>
                <xsl:with-param name="by" select="$by"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$text"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>



</xsl:stylesheet>