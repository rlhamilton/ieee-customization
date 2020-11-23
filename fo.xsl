<?xml version='1.0'?>
<!--
    XSL Stylesheet Customization for the DocBook stylesheets. This customization
    converts a DocBook article into fo that can be converted into pdf that
    conforms to the IEEE Conference Proceedings print format.

    Copyright (C) 2007 Richard L. Hamilton

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
-->
<xsl:stylesheet
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:exsl="http://exslt.org/common"
  version="1.0"
  exclude-result-prefixes="exsl">

  <!-- Edit the href to point to where you place the DocBook XSL stylsheets.
       The location shown here is used by some (?many?) Linux distributions.
  -->
  <xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/current/fo/docbook.xsl"/>

  <xsl:variable name="section1break">
    <xsl:choose>
      <xsl:when test="/d:book">page</xsl:when>
      <xsl:otherwise>auto</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- titles at this level and lower will be inline -->
  <xsl:param name="inline.header.level">3</xsl:param>

  <xsl:attribute-set name="section.level1.properties">
    <xsl:attribute name="break-before"><xsl:value-of select="$section1break"/></xsl:attribute>
  </xsl:attribute-set>

  <!-- Numbered headings -->
  <xsl:param name="section.autolabel">1</xsl:param>
  <xsl:param name="section.label.includes.component.label">1</xsl:param>

  <!-- bibliography related -->
  <xsl:param name="bibliography.numbered" select="1"/>
  <xsl:template name="bibliography.titlepage"/>


  <!-- Two column output -->
  <xsl:param name="column.count.body">2</xsl:param>
  <xsl:param name="column.gap.body">0.375in</xsl:param>

  <!-- Title placement -->
  <xsl:param name="formal.title.placement">
    figure after
    table before
  </xsl:param>

  <xsl:attribute-set name="formal.title.properties">
    <xsl:attribute name="font-size">10pt</xsl:attribute>
    <xsl:attribute name="font-family">Helvetica</xsl:attribute>
    <xsl:attribute name="font-style">normal</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="text-indent">0in</xsl:attribute>
  </xsl:attribute-set>

  <!-- Footnote properties -->
  <xsl:attribute-set name="footnote.properties">
    <xsl:attribute name="font-size">8pt</xsl:attribute>
    <xsl:attribute name="font-family">Times</xsl:attribute>
    <xsl:attribute name="font-style">normal</xsl:attribute>
    <xsl:attribute name="text-indent">0in</xsl:attribute>
  </xsl:attribute-set>

  <!-- Typography -->
  <xsl:param name="body.font.family">Times</xsl:param>
  <xsl:param name="body.font.master">10</xsl:param>
  <xsl:param name="title.font.family">Times</xsl:param>

  <!-- Margins -->
  <xsl:param name="page.height.portrait">11in</xsl:param>
  <xsl:param name="page.width.portrait">8.5in</xsl:param>
  <xsl:param name="page.margin.top">.5in</xsl:param>
  <xsl:param name="region.before.extent">.5in</xsl:param>
  <xsl:param name="body.margin.top">.375in</xsl:param>
  <xsl:param name="page.margin.bottom">.5in</xsl:param>
  <xsl:param name="region.after.extent">.5in</xsl:param>
  <xsl:param name="body.margin.bottom">.125in</xsl:param>
  <xsl:param name="page.margin.inner">1in</xsl:param>
  <xsl:param name="page.margin.outer">1in</xsl:param>
  <xsl:param name="body.start.indent">0pt</xsl:param>

  <!-- Section Titles -->
  <xsl:attribute-set name="section.title.level1.properties">
    <xsl:attribute name="font-size">12pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="section.title.level2.properties">
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="section.title.level3.properties">
    <xsl:attribute name="font-size">10pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:template match="d:title" mode="article.titlepage.recto.auto.mode">
    <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="article.titlepage.recto.style" keep-with-next.within-column="always" font-size="14pt" font-weight="bold">
      <xsl:call-template name="component.title">
        <xsl:with-param name="node" select="ancestor-or-self::d:article[1]"/>
      </xsl:call-template>
    </fo:block>
  </xsl:template>

  <!-- author, affiliation, and email handling -->
  <xsl:attribute-set name="ieee.title.block.properties">
    <xsl:attribute name="space-before.optimum">3em</xsl:attribute>
    <xsl:attribute name="space-before.minimum">2.8em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">3.2em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">2em</xsl:attribute>
    <xsl:attribute name="space-after.minimum">1.8em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">2.2em</xsl:attribute>
    <!-- <xsl:attribute name="span">all</xsl:attribute> -->
  </xsl:attribute-set>
  <xsl:attribute-set name="ieee.affiliation.properties">
    <xsl:attribute name="font-size">12pt</xsl:attribute>
    <xsl:attribute name="font-family">Times</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="ieee.author.properties">
    <xsl:attribute name="font-size">12pt</xsl:attribute>
    <xsl:attribute name="font-family">Times</xsl:attribute>
    <xsl:attribute name="font-style">normal</xsl:attribute>
  </xsl:attribute-set>

<xsl:template match="d:email">
  <xsl:call-template name="inline.charseq">
    <xsl:with-param name="content">
      <fo:inline keep-together.within-line="always" hyphenate="false">
        <xsl:apply-templates/>
      </fo:inline>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- article copied to change span for title -->
<xsl:template match="d:article">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <xsl:variable name="master-reference">
    <xsl:call-template name="select.pagemaster"/>
  </xsl:variable>

  <fo:page-sequence hyphenate="{$hyphenate}"
                    master-reference="{$master-reference}">
    <xsl:attribute name="language">
      <xsl:call-template name="l10n.language"/>
    </xsl:attribute>
    <xsl:attribute name="format">
      <xsl:call-template name="page.number.format">
        <xsl:with-param name="master-reference" select="$master-reference"/>
      </xsl:call-template>
    </xsl:attribute>
    <xsl:attribute name="initial-page-number">
      <xsl:call-template name="initial.page.number">
        <xsl:with-param name="master-reference" select="$master-reference"/>
      </xsl:call-template>
    </xsl:attribute>

    <xsl:attribute name="force-page-count">
      <xsl:call-template name="force.page.count">
        <xsl:with-param name="master-reference" select="$master-reference"/>
      </xsl:call-template>
    </xsl:attribute>

    <xsl:attribute name="hyphenation-character">
      <xsl:call-template name="gentext">
        <xsl:with-param name="key" select="'hyphenation-character'"/>
      </xsl:call-template>
    </xsl:attribute>
    <xsl:attribute name="hyphenation-push-character-count">
      <xsl:call-template name="gentext">
        <xsl:with-param name="key" select="'hyphenation-push-character-count'"/>
      </xsl:call-template>
    </xsl:attribute>
    <xsl:attribute name="hyphenation-remain-character-count">
      <xsl:call-template name="gentext">
        <xsl:with-param name="key" select="'hyphenation-remain-character-count'"/>
      </xsl:call-template>
    </xsl:attribute>

    <xsl:apply-templates select="." mode="running.head.mode">
      <xsl:with-param name="master-reference" select="$master-reference"/>
    </xsl:apply-templates>

    <xsl:apply-templates select="." mode="running.foot.mode">
      <xsl:with-param name="master-reference" select="$master-reference"/>
    </xsl:apply-templates>

    <fo:flow flow-name="xsl-region-body">
      <xsl:call-template name="set.flow.properties">
        <xsl:with-param name="element" select="local-name(.)"/>
        <xsl:with-param name="master-reference" select="$master-reference"/>
      </xsl:call-template>

      <fo:block id="{$id}" span="all" xsl:use-attribute-sets="ieee.title.block.properties">
        <xsl:call-template name="article.titlepage"/>
      </fo:block>

      <xsl:variable name="toc.params">
        <xsl:call-template name="find.path.params">
          <xsl:with-param name="table" select="normalize-space($generate.toc)"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:if test="contains($toc.params, 'toc')">
        <xsl:call-template name="component.toc"/>
        <xsl:call-template name="component.toc.separator"/>
      </xsl:if>
      <xsl:apply-templates/>
    </fo:flow>
  </fo:page-sequence>
</xsl:template>


  <xsl:template match="d:author" mode="titlepage.mode">
    <fo:block xsl:use-attribute-sets="inline.para.spacing ieee.author.properties">
      <xsl:call-template name="anchor"/>
      <xsl:call-template name="person.name"/>
      <xsl:if test="affiliation/orgname">
        <fo:block xsl:use-attribute-sets="ieee.affiliation.properties">
        <xsl:apply-templates select="affiliation/orgname"
          mode="titlepage.mode"/>
        </fo:block>
      </xsl:if>
      <xsl:if test="d:email|d:affiliation/d:address/d:email">
        <fo:block xsl:use-attribute-sets="ieee.affiliation.properties">
          <xsl:apply-templates select="(d:email|d:affiliation/d:address/d:email)[1]"/>
        </fo:block>
      </xsl:if>
    </fo:block>
  </xsl:template>

  <!-- abstract handling -->

  <xsl:attribute-set name="abstract.properties">
    <xsl:attribute name="font-style">italic</xsl:attribute>  
  </xsl:attribute-set>
  <xsl:attribute-set name="abstract.title.properties">
    <xsl:attribute name="font-size">12pt</xsl:attribute>  
    <xsl:attribute name="font-style">normal</xsl:attribute>  
  </xsl:attribute-set>

  <!-- nuke all TOCs -->
  <xsl:param name="generate.toc">
    article nop
  </xsl:param>

  <!-- indent first line of each paragraph -->
  <xsl:attribute-set name="normal.para.spacing">
    <xsl:attribute name="text-indent">.25in</xsl:attribute>
  </xsl:attribute-set>
  <!-- para spacing, without indent, for inline para -->
  <xsl:attribute-set name="inline.para.spacing">
    <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  </xsl:attribute-set>

  <!-- headers and footers -->
  <xsl:param name="header.rule">0</xsl:param>
  <xsl:param name="footer.rule">0</xsl:param>
  <xsl:template name="footer.content"/>
  <xsl:template name="header.content"/>

  <!-- miscellaneous -->
  <xsl:param name="draft.mode">no</xsl:param>

  <xsl:template match="d:para"
    mode="inline.para">
    <fo:inline xsl:use-attribute-sets="normal.para.spacing">
      <xsl:call-template name="anchor"/>
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  <xsl:template match="d:section/d:section/d:section/d:para[preceding-sibling::*[1][self::d:title]]">
  </xsl:template>
<xsl:template match="d:sect3/d:para[preceding-sibling::*[1][self::d:title]]">
  <!-- Turn off normal processing of this para so it doesn't repeat when the
          sect3 template does apply-templates -->
</xsl:template>


<xsl:template name="section.heading">
  <xsl:param name="level" select="1"/>
  <xsl:param name="marker" select="1"/>
  <xsl:param name="title"/>
  <xsl:param name="marker.title"/>

  <xsl:choose>
    <xsl:when test="$level >= $inline.header.level">
        <fo:block xsl:use-attribute-sets="inline.para.spacing">
          <xsl:call-template name="inline.section.heading">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="title" select="$title"/>
            <xsl:with-param name="marker" select="$marker"/>
            <xsl:with-param name="marker.title" select="$marker.title"/>
          </xsl:call-template>
          <xsl:apply-templates select="following-sibling::*[1]"
            mode="inline.para"/>
        </fo:block>
    </xsl:when>
    <xsl:otherwise>
      <fo:block xsl:use-attribute-sets="section.title.properties">
        <xsl:if test="$marker != 0">
          <fo:marker marker-class-name="section.head.marker">
            <xsl:copy-of select="$marker.title"/>
          </fo:marker>
        </xsl:if>

        <xsl:choose>
          <xsl:when test="$level=1">
            <fo:block xsl:use-attribute-sets="section.title.level1.properties">
              <xsl:copy-of select="$title"/>
            </fo:block>
          </xsl:when>
          <xsl:when test="$level=2">
            <fo:block xsl:use-attribute-sets="section.title.level2.properties">
              <xsl:copy-of select="$title"/>
            </fo:block>
          </xsl:when>
          <xsl:when test="$level=3">
            <fo:block xsl:use-attribute-sets="section.title.level3.properties">
              <xsl:copy-of select="$title"/>
            </fo:block>
          </xsl:when>
          <xsl:when test="$level=4">
            <fo:block xsl:use-attribute-sets="section.title.level4.properties">
              <xsl:copy-of select="$title"/>
            </fo:block>
          </xsl:when>
          <xsl:when test="$level=5">
            <fo:block xsl:use-attribute-sets="section.title.level5.properties">
              <xsl:copy-of select="$title"/>
            </fo:block>
          </xsl:when>
          <xsl:otherwise>
            <fo:block xsl:use-attribute-sets="section.title.level6.properties">
              <xsl:copy-of select="$title"/>
            </fo:block>
          </xsl:otherwise>
        </xsl:choose>
      </fo:block>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="inline.section.heading">
  <xsl:param name="level" select="1"/>
  <xsl:param name="marker" select="1"/>
  <xsl:param name="title"/>
  <xsl:param name="marker.title"/>

  <fo:inline xsl:use-attribute-sets="section.title.properties">
    <xsl:if test="$marker != 0">
      <fo:marker marker-class-name="section.head.marker">
        <xsl:copy-of select="$marker.title"/>
      </fo:marker>
    </xsl:if>

    <xsl:choose>
      <xsl:when test="$level=1">
        <fo:inline xsl:use-attribute-sets="section.title.level1.properties">
          <xsl:copy-of select="$title"/>
        </fo:inline>
      </xsl:when>
      <xsl:when test="$level=2">
        <fo:inline xsl:use-attribute-sets="section.title.level2.properties">
          <xsl:copy-of select="$title"/>
        </fo:inline>
      </xsl:when>
      <xsl:when test="$level=3">
        <fo:inline xsl:use-attribute-sets="section.title.level3.properties">
          <xsl:copy-of select="$title"/>
        </fo:inline>
      </xsl:when>
      <xsl:when test="$level=4">
        <fo:inline xsl:use-attribute-sets="section.title.level4.properties">
          <xsl:copy-of select="$title"/>
        </fo:inline>
      </xsl:when>
      <xsl:when test="$level=5">
        <fo:inline xsl:use-attribute-sets="section.title.level5.properties">
          <xsl:copy-of select="$title"/>
        </fo:inline>
      </xsl:when>
      <xsl:otherwise>
        <fo:inline xsl:use-attribute-sets="section.title.level6.properties">
          <xsl:copy-of select="$title"/>
        </fo:inline>
      </xsl:otherwise>
    </xsl:choose>
  </fo:inline>
</xsl:template>

<xsl:template match="d:biblioentry">
  <xsl:param name="label">
    <xsl:call-template name="biblioentry.label"/>
  </xsl:param>

  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="string(.) = ''">
      <xsl:variable name="bib" select="document($bibliography.collection,.)"/>
      <xsl:variable name="entry" select="$bib/bibliography/*[@xml:id=$id][1]"/>
      <xsl:choose>
        <xsl:when test="$entry">
          <xsl:choose>
            <xsl:when test="$bibliography.numbered != 0">
              <xsl:apply-templates select="$entry">
                <xsl:with-param name="label" select="$label"/>
              </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="$entry"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:message>
            <xsl:text>No bibliography entry: </xsl:text>
            <xsl:value-of select="$id"/>
            <xsl:text> found in </xsl:text>
            <xsl:value-of select="$bibliography.collection"/>
          </xsl:message>
          <fo:block id="{$id}" xsl:use-attribute-sets="inline.para.spacing">
            <xsl:text>Error: no bibliography entry: </xsl:text>
            <xsl:value-of select="$id"/>
            <xsl:text> found in </xsl:text>
            <xsl:value-of select="$bibliography.collection"/>
          </fo:block>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <fo:block id="{$id}" xsl:use-attribute-sets="inline.para.spacing"
                start-indent="0in" text-indent="0in">
        <xsl:copy-of select="$label"/>
        <xsl:apply-templates mode="bibliography.mode"/>
      </fo:block>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


</xsl:stylesheet>
