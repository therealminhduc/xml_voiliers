<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="utf-8" method="html" version="5.0" indent="yes"/>

<!--Classe sommaire-->
<xsl:template match="classe" mode="sommaire">
    <p>
       <a href= "#{@classe}" class="summary_margin"> <xsl:value-of select="concat( '- ',@classe )"/> <br/> </a>
    </p>
</xsl:template>


<xsl:template match="classe">
    <div id="{@classe}">
        <h2>
            <xsl:value-of select="concat('Les voiliers de la classe : ', @classe)"/>
        </h2>
    <xsl:apply-templates select="voilier"/>
        <p>
            
        </p>
    </div>
</xsl:template>

<!--Voilier-->
<xsl:template match="voilier">
    <h3>
        <xsl:number count="voilier" format="1. "/>
        <xsl:value-of select="nom"/>
    </h3>
    <img src="{photo/@adresse}" alt="Photo du voilier {nom}" width="300"/>

    <xsl:apply-templates select="equipage/skipper"/>
    <a href="#top">Retourner vers le haut de la page</a>
</xsl:template>

<xsl:template match="voilier" mode="sommaire">
    <h3>
        <xsl:number count="voilier" format="1. "/>
        <xsl:value-of select="nom"/>
    </h3>
    <img src="{photo/@adresse}" alt="Photo du voilier {nom}" width="300"/>
    <xsl:apply-templates select="equipage/skipper"/>
</xsl:template>

<!--Skipper-->
<xsl:template match="skipper">
    <h4>Equipage</h4>
    <p>
        <img src="drapeaux/{@drapeau}" alt="{pays}" width="30"/>
        <xsl:value-of select="concat(., '   ' )"/>
    </p>
</xsl:template>

<!--Voiliers-->
<xsl:template match="voiliers">
    <html lang="fr">
        <head>
            <meta charset="utf-8"/>
            <link rel="stylesheet" href="route_du_cafe.css"/>
            <title>Route du Café - 2021</title>
        </head>

        <body>
            <div class="header">
                <a name="top"></a>
                <h1>Transat Jacques Vabre - Route du Café - Edition 2021
                    <br/> Le Havre - Fort de France     
                    
                </h1>
            </div>
            
            <div class="main">
                <div class="sommaire">
                    <xsl:apply-templates select="classe" mode="sommaire"/>
                </div>
                <div class="voiliers">
                    <xsl:apply-templates select="classe"/>
                </div>
            </div>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet> 