<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="dropdowns.xslt" />
    <xsl:output method="html" />

    <xsl:template name="dropdown">
        <xsl:param name="listname"/>
        <xsl:param name="value"/>
        <select>
            <xsl:call-template name="dropdowns">
                <xsl:with-param name="listname" select="$listname"/>
                <xsl:with-param name="value" select="$value"/>
            </xsl:call-template>
        </select>
    </xsl:template>
</xsl:stylesheet>