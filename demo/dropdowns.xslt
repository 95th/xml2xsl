<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template name="dropdowns">
        <xsl:param name="listname"/>
        <xsl:param name="value"/>
        <xsl:choose>
            <xsl:when test="$listname='xyz'">
                <xsl:call-template name="option">
                    <xsl:with-param name="value">W</xsl:with-param>
                    <xsl:with-param name="label">Walkthrough</xsl:with-param>
                    <xsl:with-param name="selectedValue" select="$value"/>
                </xsl:call-template>
                <xsl:call-template name="option">
                    <xsl:with-param name="value">I</xsl:with-param>
                    <xsl:with-param name="label">Info</xsl:with-param>
                    <xsl:with-param name="selectedValue" select="$value"/>
                </xsl:call-template>
                <xsl:call-template name="option">
                    <xsl:with-param name="value">C</xsl:with-param>
                    <xsl:with-param name="label">Category</xsl:with-param>
                    <xsl:with-param name="selectedValue" select="$value"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$listname='yes_no_maybe'">
                <xsl:call-template name="option">
                    <xsl:with-param name="value">Y</xsl:with-param>
                    <xsl:with-param name="label">Yes</xsl:with-param>
                    <xsl:with-param name="selectedValue" select="$value"/>
                </xsl:call-template>
                <xsl:call-template name="option">
                    <xsl:with-param name="value">N</xsl:with-param>
                    <xsl:with-param name="label">No</xsl:with-param>
                    <xsl:with-param name="selectedValue" select="$value"/>
                </xsl:call-template>
                <xsl:call-template name="option">
                    <xsl:with-param name="value">M</xsl:with-param>
                    <xsl:with-param name="label">May be</xsl:with-param>
                    <xsl:with-param name="selectedValue" select="$value"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="option">
        <xsl:param name="label"/>
        <xsl:param name="value"/>
        <xsl:param name="selectedValue"/>
        <option value="{$value}">
            <xsl:if test="$value = $selectedValue">
                <xsl:attribute name="selected">selected</xsl:attribute>
            </xsl:if>
            <xsl:value-of select="$label"/>
        </option>
    </xsl:template>
</xsl:stylesheet>