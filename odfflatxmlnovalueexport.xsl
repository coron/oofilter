<?xml version='1.0' encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
  xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
  xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0"	
  xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0">

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="table:table-cell">
    <xsl:copy>
      <xsl:choose>
	<xsl:when test="@table:formula">
	   <xsl:for-each select="@*">
	     <xsl:if test="name()!='office:value'">
    	       <xsl:apply-templates select="."/>
	     </xsl:if>
	   </xsl:for-each>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates select="@*|node()"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>

<xsl:template match="text:date|text:time"/>

<xsl:template match="config:config-item[@config:name='CursorPositionX']
		     | config:config-item[@config:name='CursorPositionY']"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@office:mimetype[string(.)='application/vnd.oasis.opendocument.drawing']">
      <xsl:attribute name="office:mimetype">application/vnd.oasis.opendocument.graphics</xsl:attribute>
  </xsl:template>
</xsl:stylesheet>

