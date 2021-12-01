
    <xsl:template match="classe">
        <h2>
            <xsl:value-of select="concat('Les voiliers de la classe : ', @classe)"/>
        </h2>
        <xsl:apply-templates select="voilier"/>
    </xsl:template>

    <xsl:template match="voilier">
        <h3>
            <xsl:number count="voilier" format="1. "/>
            <xsl:value-of select="nom"/>
        </h3>
        <img src="{photo/@adresse}" alt="Photo du voilier {nom}" width="300"/>
        <xsl:apply-templates select="equipage/skipper"/>

    </xsl:template>

    <xsl:template match="skipper">
        <h4>Equipage</h4>
        <p>
            <img src="drapeaux/fr.png" width="30"/>
            <xsl:value-of select="concat(., '  ' )"/>
        </p>
    </xsl:template>

    </xsl:stylesheet> 



    <voiliers>
    <classe classe="Imoca">
        <voilier>
            <nom>ARKEA PAPREC</nom>
            <photo adresse="https://www.transatjacquesvabre.org/medias/01/23/12361/image-c-480-180.jpg"/>
            <equipage>
                <skipper pays="France" drapeau="drapeaux/fr.png">Sébastien Simon</skipper>
                <skipper pays="France" drapeau="drapeaux/fr.png">Yann Elies</skipper>
            </equipage>
        </voilier>

        <voilier>
            <nom>BUREAU VALLEE</nom>
            <photo adresse="https://www.transatjacquesvabre.org/medias/01/24/12420/image-c-480-180.jpg"/>
            <equipage>
                <skipper pays="France" drapeau="drapeaux/fr.png">Louis Burton</skipper>
                <skipper pays="France" drapeau="drapeaux/fr.png">Davy Beaudart</skipper>
            </equipage>
        </voilier>

        <voilier>
            <nom>CHARAL</nom>
            <photo adresse="https://www.transatjacquesvabre.org/medias/01/25/12518/image-c-480-180.jpg"/>
            <equipage>
                <skipper pays="France" drapeau="drapeaux/fr.png">Jeremie Beyou</skipper>
                <skipper pays="France" drapeau="drapeaux/fr.png">Christopher Pratt</skipper>
            </equipage>
        </voilier>
    </classe>
</voiliers>





<xsl:template match="classe" mode="sommaire">
    <h2>
        <a href= "#{@classe}"> <xsl:value-of select="concat('Les voiliers de la classe : ', @classe)"/> </a>
    </h2>
    <xsl:apply-templates select="voilier" mode="sommaire"/>
</xsl:template>