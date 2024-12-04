<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Films</title>
        <style>
          table { border-collapse: collapse; width: 100%; }
          th, td { border: 1px solid black; padding: 8px; text-align: left; }
          th { background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h2>Films</h2>
        <table>
          <tr>
            <th>Title</th>
            <th>Genres</th>
            <th>Directors</th>
            <th>Composers</th>
            <th>Cast</th>
            <th>Release Date</th>
            <th>Box Office</th>
            <th>Rating</th>
            <th>Viewers</th>
            <th>Original Language</th>
          </tr>
          <xsl:for-each select="films/film">
            <tr>
              <td><xsl:value-of select="title"/></td>
              <td><xsl:for-each select="genres/genre"><xsl:value-of select="."/>, </xsl:for-each></td>
              <td><xsl:for-each select="directors/director"><xsl:value-of select="."/>, </xsl:for-each></td>
              <td><xsl:value-of select="composers/composer"/></td>
              <td><xsl:value-of select="cast/actor"/></td>
              <td><xsl:value-of select="release_date"/></td>
              <td><xsl:value-of select="box_office"/></td>
              <td><xsl:value-of select="rating"/></td>
              <td><xsl:value-of select="viewers"/></td>
              <td><xsl:value-of select="original_language"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>