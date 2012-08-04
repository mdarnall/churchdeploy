<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<h2>
		<span><xsl:value-of select="/data/recipients/name" /> (preview)</span>
		<a href="{concat($root, '/symphony/extension/email_newsletter_manager/recipientgroups/edit/', /data/context/item[@index = 2])}" class="button">Edit Recipient Source</a>
	</h2>
	<form method="post" action="{$current-url}">
		<!-- <xsl:call-template name="debug" /> -->
		<table>
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Email Adress</th>
					<th scope="col">Valid</th>
				</tr>
			</thead>
			<tbody>
				<xsl:if test="/data/recipients/records/item">
					<xsl:apply-templates select="/data/recipients/records/item"/>
				</xsl:if>
				<xsl:if test="not(/data/recipients/records/item)">
					<tr>
						<td class="inactive" colspan="3">
							<xsl:text>None found</xsl:text>
						</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
		<xsl:if test="/data/recipients/total-pages &gt; 1">
			<ul class="page">
				<li><xsl:if test="/data/recipients/current-page &gt; 1">
						<a href="{concat($root, '/symphony/extension/email_newsletter_manager/recipientgroups/preview/', /data/context/item[@index = 2], '?pg=1')}">First</a>
					</xsl:if>
					<xsl:if test="not(/data/recipients/current-page &gt; 1)">
						First
					</xsl:if></li>
				<li>
					<xsl:if test="/data/recipients/current-page &gt; 1">
						<a href="{concat($root, '/symphony/extension/email_newsletter_manager/recipientgroups/preview/', /data/context/item[@index = 2], '?pg=', /data/recipients/current-page - 1)}">&#8592; Previous</a>
					</xsl:if>
					<xsl:if test="not(/data/recipients/current-page &gt; 1)">
						&#8592; Previous
					</xsl:if>
				</li>
				<li title="Viewing {/data/recipients/start} - {/data/recipients/start + /data/recipients/entries-per-page - 1} of {/data/recipients/total-entries} entries">Page <xsl:value-of select="/data/recipients/current-page" /> of <xsl:value-of select="/data/recipients/total-pages" /></li>
				<li>
					<xsl:if test="/data/recipients/remaining-pages &gt; 0">
						<a href="{concat($root, '/symphony/extension/email_newsletter_manager/recipientgroups/preview/', /data/context/item[@index = 2], '?pg=', /data/recipients/current-page + 1)}">Next &#8594;</a>
					</xsl:if>
					<xsl:if test="not(/data/recipients/remaining-pages &gt; 0)">
						Next &#8594;
					</xsl:if>
				</li>
				<li>
					<xsl:if test="/data/recipients/remaining-pages &gt; 0">
						<a href="{concat($root, '/symphony/extension/email_newsletter_manager/recipientgroups/preview/', /data/context/item[@index = 2], '?pg=', /data/recipients/total-pages)}">Last</a>
					</xsl:if>
					<xsl:if test="not(/data/recipients/remaining-pages &gt; 0)">
						Last
					</xsl:if>
				</li>
			</ul>
		</xsl:if>
	</form>
</xsl:template>

<xsl:template match="recipients/records/item">
	<tr>
		<xsl:if test="not(valid)">
			<xsl:attribute name="class">
				<xsl:text>invalid</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<td>
			<xsl:choose>
				<xsl:when test="../../source = 'system:authors'">
					<a href="{concat($root, '/symphony/system/authors/edit/', id)}"><xsl:value-of select="name" /></a>
				</xsl:when>
				<xsl:when test="../../source = 'system:static_recipients'">
					<xsl:value-of select="name" />
				</xsl:when>
				<xsl:otherwise>
					<a href="{concat($root, '/symphony/publish/', ../../source, '/edit/', id)}"><xsl:value-of select="name" /></a>
				</xsl:otherwise>
			</xsl:choose>

		</td>
		<td>
			<xsl:value-of select="email"/>
		</td>
		<td>
			<xsl:if test="valid = 1">
				<xsl:text>yes</xsl:text>
			</xsl:if>
			<xsl:if test="not(valid)">
				<xsl:text>no</xsl:text>
			</xsl:if>
		</td>
	</tr>
</xsl:template>

<xsl:template name="debug">
	<textarea rows="30" class="code">
		<xsl:copy-of select="/" />
	</textarea>
</xsl:template>

</xsl:stylesheet>