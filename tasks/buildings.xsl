<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Говорим, что хотим HTML -->
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- Главный шаблон: срабатывает на корень документа -->
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Знаменитые здания</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 30px; }
          .country { margin-bottom: 30px; }
          .country-name { font-size: 24px; font-weight: bold; }
          .architect-name { font-size: 18px; margin-left: 10px; }
          .building-name { font-size: 14px; margin-left: 20px; }
          img { display: block; margin: 5px 0 15px 20px; max-width: 300px; height: auto; }
        </style>
      </head>
      <body>
        <h1>Знаменитые здания мировой архитектуры</h1>

        <!-- Обходим все страны -->
        <xsl:for-each select="/world_architecture/country">
          <div class="country">
            <!-- Страна крупным шрифтом -->
            <div class="country-name">
              Страна: <xsl:value-of select="@id"/>
            </div>

            <!-- Архитекторы в этой стране -->
            <xsl:for-each select="architect">
              <div class="architect-name">
                Архитектор: <xsl:value-of select="@name"/>
              </div>

              <!-- Здания этого архитектора -->
              <xsl:for-each select="building">
                <div class="building-name">
                  Сооружение: <xsl:value-of select="@code"/>
                  (<xsl:value-of select="@year"/>)
                </div>

                <!-- Фото берём из атрибута photo -->
                <img>
                  <xsl:attribute name="src">
                    <xsl:value-of select="@photo"/>
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="@code"/>
                  </xsl:attribute>
                </img>
              </xsl:for-each>

            </xsl:for-each>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>