<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" />

  <xsl:template match="films">
    <xsl:apply-templates select="film" />
  </xsl:template>

  <xsl:template match="film">
    <xsl:text>Title: </xsl:text>
    <xsl:value-of select="title" />
    <xsl:text>&#xA;</xsl:text>

    <xsl:text>Genres: </xsl:text>
    <xsl:apply-templates select="genres/genre" />
    <xsl:text>&#xA;</xsl:text>

    <xsl:text>Directors: </xsl:text>
    <xsl:apply-templates select="directors/director" />
    <xsl:text>&#xA;</xsl:text>

    </xsl:template>

  <xsl:template match="genre|director|composer|actor">
    <xsl:value-of select="." />
    <xsl:if test="position() != last()">, </xsl:if>
  </xsl:template>
</xsl:stylesheet>