<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <orm>
            <xsl:for-each select="orm/mapeamento">
                <mapeamento>
                    <xsl:attribute name="classe">
                        <xsl:value-of select="classe"/>
                    </xsl:attribute>
                    <tabela>
                        <xsl:attribute name="nome">
                            <xsl:value-of select="tabela"/>
                        </xsl:attribute>
                        <colunas>
                            <xsl:for-each select="coluna">
                                <coluna>
                                    <xsl:attribute name="tipo">
                                        <xsl:value-of select="tabela/@tipo"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="nome_col">
                                        <xsl:value-of select="tabela"/>
                                    </xsl:attribute>
                                    <xsl:if test="@chave_primaria">
                                        <xsl:attribute name="chave_primaria">
                                            <xsl:value-of select="@chave_primaria"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:if test="@valor_unico">
                                        <xsl:attribute name="valor_unico">
                                           <xsl:value-of select="@valor_unico"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:if test="@length">
                                        <xsl:attribute name="length">
                                            <xsl:value-of select="@length"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <classe>
                                        <xsl:attribute name="tipo">
                                            <xsl:value-of select="classe/@tipo"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="classe"/>
                                    </classe>
                                </coluna>
                            </xsl:for-each>
                        </colunas>
                        <relacionamentos>
                            <xsl:for-each select="relacionamento">
                                <relacionamento>
                                    <xsl:attribute name="tipo">
                                        <xsl:value-of select="@tipo"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="obrigatorio">
                                        <xsl:if test="@obrigatorio">
                                            <xsl:value-of select="@obrigatorio"/>
                                        </xsl:if>
                                        <xsl:if test="not(@obrigatorio)">
                                            false
                                        </xsl:if>
                                    </xsl:attribute>
                                    <par>
                                        <xsl:attribute name="classe">
                                            <xsl:value-of select="classe"/>
                                        </xsl:attribute>
                                            <xsl:if test="par/de/@chave_primaria">
                                                <xsl:attribute name="chave_primaria">
                                                    <xsl:value-of select="par/de/@chave_primaria"/>
                                                </xsl:attribute>
                                            </xsl:if>
                                        <para>
                                            <xsl:attribute name="tipo">
                                                <xsl:value-of select="par/para/@tipo"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="par/para"/>
                                        </para>
                                    </par>
                                </relacionamento>
                            </xsl:for-each>
                        </relacionamentos>
                    </tabela>
                </mapeamento>
            </xsl:for-each>
        </orm>
    </xsl:template>

</xsl:stylesheet>