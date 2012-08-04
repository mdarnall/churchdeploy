<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="extensions/email_newsletter_manager/content/utilities/filters.xsl" />
<xsl:import href="extensions/email_newsletter_manager/content/utilities/essentials.xsl" />
<xsl:import href="extensions/email_newsletter_manager/content/utilities/static-recipients.xsl" />
<xsl:import href="extensions/email_newsletter_manager/content/utilities/fields.xsl" />

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes"/>

<xsl:template match="/">
	<h2>
		<xsl:choose>
			<xsl:when test="/data/recipientgroups/entry/name">
				<span><xsl:value-of select="/data/recipientgroups/entry/name" /></span>
				<a href="{concat($root, '/symphony/extension/email_newsletter_manager/recipientgroups/preview/', /data/context/item[@index = 2])}" class="button">Preview Recipients</a>
			</xsl:when>
			<xsl:otherwise><span>New Recipient Group</span></xsl:otherwise>
		</xsl:choose>
	</h2>
	<form method="post">
		<!-- <xsl:call-template name="debug" /> -->
		<xsl:call-template name="essentials" />
		<xsl:call-template name="filters" />
		<xsl:call-template name="static-recipients" />
		<xsl:call-template name="fields" />
		<div class="actions">
			<input type="submit" accesskey="s" name="action[save]">
				<xsl:attribute name="value">
					<xsl:choose>
						<xsl:when test="not(/data/context/item[@index=1] = 'new')">Save Changes</xsl:when>
						<xsl:otherwise>Create Recipient Group</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</input>
			<xsl:if test="not(/data/context/item[@index=1] = 'new')" >
				<button name="action[delete]" class="button confirm delete" title="Delete this page" accesskey="d">Delete</button>
			</xsl:if>
		</div>
	</form>
</xsl:template>

<xsl:template name="debug">
	<textarea rows="30" class="code">
		<xsl:copy-of select="/" />
	</textarea>
</xsl:template>

</xsl:stylesheet>