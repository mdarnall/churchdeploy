<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="component-locations">
	
	<xsl:param name="entries" />
	<xsl:param name="position" />

	<xsl:if test="count($entries)">

		<div>
			
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="'locations'" />
			</xsl:call-template>
			
			<h3 class="header">
				<xsl:call-template name="pluralize">
					<xsl:with-param name="singular" select="'Location'"  />
					<xsl:with-param name="plural"   select="'Locations'" />
					<xsl:with-param name="xpath"    select="$entries"    />
				</xsl:call-template>
			</h3>
			
			<xsl:for-each select="$entries">
				
				<div>
					
					<xsl:call-template name="class-rows" />
					
					<xsl:if test="string-length(longitude) and string-length(latitude)">
						
						<div class="map">
						
							<iframe class="google-map" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q={latitude},{longitude}&amp;aq=&amp;sll={latitude},{longitude}&amp;sspn=0.021183,0.032616&amp;vpsrc=0&amp;safe=on&amp;ie=UTF8&amp;t=m&amp;z=14&amp;ll={latitude},{longitude}&amp;output=embed"></iframe>
							
							<p><a target="_blank" href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q={latitude},{longitude}&amp;aq=&amp;sll={latitude},{longitude}&amp;sspn=0.021183,0.032616&amp;vpsrc=0&amp;safe=on&amp;ie=UTF8&amp;t=m&amp;z=14&amp;ll={latitude},{longitude}"><span data-icon="G"></span> View on Google</a></p>
											
						</div>
						
					</xsl:if>
			
				</div>
			
			</xsl:for-each>
		
		</div>
		
	</xsl:if>
	
</xsl:template>



</xsl:stylesheet>