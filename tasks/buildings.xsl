<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <head>
      <title>Знаменитые здания мировой архитектуры</title>
      <style>
        body { font-family: Arial; margin: 40px; }
        h1 { color: #2c3e50; }
        .country { margin: 20px 0; padding: 15px; border-left: 4px solid #3498db; }
        .architect { margin: 10px 0; font-style: italic; }
        .building { padding: 8px; background: #ecf0f1; margin: 5px 0; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #bdc3c7; padding: 8px; text-align: left; }
        th { background: #3498db; color: white; }
      </style>
    </head>
    <body>
      <h1>🏛️ Знаменитые здания архитектуры</h1>
      <p>Каталог: <strong><xsl:value-of select="@version"/></strong></p>
      
      <xsl:apply-templates/>
    </body>
  </html>
</xsl:template>

<xsl:template match="country">
  <div class="country">
    <h2>🇫🇷 <xsl:value-of select="name()"/> (ID: <xsl:value-of select="@id"/>)</h2>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="architect">
  <div class="architect">
    <strong>👨‍💼 <xsl:value-of select="@name"/></strong>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="building">
  <div class="building">
    🏗️ <strong><xsl:value-of select="name()"/></strong>
    <table>
      <tr><th>Год</th><td><xsl:value-of select="@year"/></td></tr>
      <xsl:if test="@height"><tr><th>Высота</th><td><xsl:value-of select="@height"/></td></tr></xsl:if>
      <xsl:if test="@type"><tr><th>Тип</th><td><xsl:value-of select="@type"/></td></tr></xsl:if>
      <xsl:if test="@status"><tr><th>Статус</th><td><xsl:value-of select="@status"/></td></tr></xsl:if>
    </table>
  </div>
</xsl:template>

</xsl:stylesheet>