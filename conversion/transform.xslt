<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:gx="gx"
    version="1.0">

    <xsl:namespace-alias stylesheet-prefix="gx" result-prefix="xsl" />
    <xsl:variable name="APOS">'</xsl:variable>

    <xsl:output method="xml"/>
    <xsl:template match="/">
        <gx:stylesheet>
            <gx:template name="dropdowns">
                <gx:param name="listname"/>
                <gx:param name="value"/>
                <xsl:apply-templates/>
            </gx:template>
            <gx:template name="option">
                <gx:param name="label"/>
                <gx:param name="value"/>
                <gx:param name="selectedValue"/>
                <option value="{'{$value}'}">
                    <gx:if test="$value = $selectedValue">
                        <gx:attribute name="selected">selected</gx:attribute>
                    </gx:if>
                    <gx:value-of select="$label"/>
                </option>
            </gx:template>
        </gx:stylesheet>
    </xsl:template>

    <xsl:template match="dropdown">
        <gx:when test="{concat('$listname=', $APOS, @name, $APOS)}">
            <xsl:apply-templates/>
        </gx:when>
    </xsl:template>

    <xsl:template match="option">
        <gx:call-template name="option">
            <gx:with-param name="value"><xsl:value-of select="@value"/></gx:with-param>
            <gx:with-param name="label"><xsl:value-of select="."/></gx:with-param>
            <gx:with-param name="selectedValue" select="$value"/>
        </gx:call-template>
    </xsl:template>
</xsl:stylesheet>