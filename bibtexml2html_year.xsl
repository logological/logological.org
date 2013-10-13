<?xml version="1.0"?>

<!--
    File    : $Id: bibtexml2html_year.xsl,v 1.1 2005/02/07 21:33:06 psy Exp $
    Abstract: Transform bibteXML file into a publication list HTML page
  -->

<!--
	Modified by SES 2003.01.15
	
	&#160; = &nbsp;

  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xt="http://www.jclark.com/xt"
                xmlns:bibxml="http://bibtexml.sf.net/"
                version="1.0"
                extension-element-prefixes="xt">

<xsl:output method="html"
            doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
            doctype-system="http://www.w3.org/TR/html4/loose.dtd"
	indent="yes"
	/>

<xsl:template match="/">
  <html>
    <head>
      <title>Bibtex to HTML</title>
      <style type="text/css">
/*<![CDATA[*/
        .pubicon {
        float: right;
        border: 0;
        padding-left: 5px;
        }

        .publication {
        margin-left: 3em;
        clear: both;
        padding: 1ex;
        background-color: #ddf;
        margin-top: 1ex;
        }

        h2 {
        border-bottom: solid 2px #B588C6;
        }
/*]]>*/
      </style>
    </head>
    <body>
      <xsl:apply-templates select="bibxml:file"/>
    </body>
  </html>
</xsl:template>

<!--
   - Template for complete file
  -->


<xsl:key name="entries-by-year" match="bibxml:entry" use="bibxml:*/bibxml:year" />

<xsl:template match="bibxml:file">
  <h1>Bibliography</h1>

  <xsl:for-each select="bibxml:entry[count(. | key('entries-by-year', */bibxml:year)[1]) = 1]">
    <xsl:sort select="*/bibxml:year" order="descending" />
    <h2><xsl:value-of select="*/bibxml:year" /></h2>
    <xsl:for-each select="key('entries-by-year', */bibxml:year)">
      <xsl:sort select="*/bibxml:title" />
      <div class="publication">
        <xsl:apply-templates select="./*/bibxml:pdf"/>
        <xsl:apply-templates select="./*/bibxml:ps"/>
        <xsl:apply-templates select="./*/bibxml:url"/>
        <xsl:apply-templates select="./*"/>
        <xsl:if test="./*/bibxml:abstract != ''">
          <blockquote style="font-size: smaller; text-align: justify">
            <strong>Abstract: </strong>
            <xsl:value-of select="./*/bibxml:abstract"/>
          </blockquote>
        </xsl:if>
      </div>
    </xsl:for-each>
  </xsl:for-each>

  <!-- 
     - Footer info 
     -->
  <hr sytle="clear: both" />
    <p><em>Generated using modified bibtex2xml.py and bibList.xsl.</em></p>
</xsl:template>

<!-- 
   - bibtex entry types 
   - follows bibtex specs mostly 
   -->

<!-- ========================= article ========================= -->
<xsl:template match="bibxml:article">
  <strong><xsl:apply-templates select="bibxml:title"/>.</strong><br />
  <xsl:apply-templates select="bibxml:author"/><br />
  <em><xsl:apply-templates select="bibxml:journal"/></em>,
  
  <xsl:choose>
    <!-- only a volume, no number -->
    <xsl:when test="bibxml:volume != '' and (not(bibxml:number) or bibxml:number = '')">
      <xsl:apply-templates select="bibxml:volume"/><xsl:if test="bibxml:pages != ''">:<xsl:value-of select="bibxml:pages"/></xsl:if>
    </xsl:when>
    <!-- volume and number -->
    <xsl:when test="bibxml:volume != '' and bibxml:number != '' ">
      <xsl:value-of select="bibxml:volume"/>(<xsl:value-of select="bibxml:number"/>)<xsl:if test="bibxml:pages != ''">:<xsl:value-of select="bibxml:pages"/></xsl:if>
    </xsl:when>
    <!-- only a number, no volume -->
    <xsl:when test="bibxml:number != '' ">
      <xsl:apply-templates select="bibxml:number" /><xsl:if test="bibxml:pages != ''">:<xsl:value-of select="bibxml:pages"/></xsl:if>
    </xsl:when>
  </xsl:choose>,
  <xsl:apply-templates select="bibxml:month"/>
  <xsl:apply-templates select="bibxml:year"/>.
  <xsl:if test="bibxml:note != ''">
    <br /><em><xsl:apply-templates select="bibxml:note"/>.</em>
  </xsl:if>
</xsl:template>

<!-- ========================= book ========================= -->
<xsl:template match="bibxml:book">
  <strong><xsl:apply-templates select="bibxml:title"/>.</strong><br />
  <xsl:apply-templates select="bibxml:author"/><br />
  <xsl:if test="bibxml:editor != ''">
    <xsl:apply-templates select="bibxml:editor"/>
  </xsl:if>
  <xsl:choose>
    <xsl:when test="bibxml:volume != ''">
      <xsl:apply-templates select="bibxml:volume"/> of
    </xsl:when>
    <xsl:when test="bibxml:number != ''">
      <xsl:apply-templates select="bibxml:number"/> of
    </xsl:when>
  </xsl:choose>
  <xsl:choose>
    <xsl:when test="bibxml:series != ''">
      <xsl:apply-templates select="bibxml:series"/><xsl:if test="bibxml:pages != ''">, <xsl:apply-templates select="bibxml:pages"/>
      </xsl:if>.
    </xsl:when>
    <xsl:when test="bibxml:series = ''">
      <xsl:if test="bibxml:pages != ''">
        <xsl:apply-templates select="bibxml:pages"/>,
      </xsl:if>
    </xsl:when>
  </xsl:choose>
  <xsl:apply-templates select="bibxml:edition"/>
  <xsl:apply-templates select="bibxml:publisher"/>
  <xsl:apply-templates select="bibxml:address"/>
  <xsl:apply-templates select="bibxml:month"/>
  <xsl:apply-templates select="bibxml:year"/>.
  <xsl:if test="bibxml:note != ''">
    <br /><em><xsl:apply-templates select="bibxml:note"/>.</em>
  </xsl:if>
</xsl:template>

<!-- ========================= incollection ========================= -->
<xsl:template match="bibxml:incollection">
  <strong><xsl:apply-templates select="bibxml:title"/>.</strong><br />
  <xsl:apply-templates select="bibxml:author"/><br />
  <xsl:call-template name="format.in.ed.booktitle"/>
  <!--
  <xsl:choose>
    <xsl:when test="bibxml:volume != ''">
      <xsl:apply-templates select="bibxml:volume"/> of
    </xsl:when>
    <xsl:when test="bibxml:number != ''">
      <xsl:apply-templates select="bibxml:number"/> in
    </xsl:when>
  </xsl:choose>
  <xsl:choose>
    <xsl:when test="bibxml:series != ''">
      <xsl:apply-templates select="bibxml:series"/><xsl:if test="bibxml:pages != ''">, <xsl:apply-templates select="bibxml:pages"/>
      </xsl:if>.
    </xsl:when>
    <xsl:when test="bibxml:series = ''">
      <xsl:if test="bibxml:pages != ''">
        <xsl:apply-templates select="bibxml:pages"/>,
      </xsl:if>
    </xsl:when>
  </xsl:choose>
-->
  <xsl:call-template name="format.bvolume" />
  <!--
  <xsl:apply-templates select="bibxml:edition"/>
  <xsl:apply-templates select="bibxml:publisher"/>
  <xsl:apply-templates select="bibxml:address"/>
  <xsl:apply-templates select="bibxml:month"/>
  <xsl:apply-templates select="bibxml:year"/>.
  <xsl:if test="bibxml:note != ''">
    <xsl:apply-templates select="bibxml:note"/>.
  </xsl:if>
-->
</xsl:template>

<xsl:template match="bibxml:techreport">
  <xsl:apply-templates select="bibxml:title"/>
	<xsl:apply-templates select="bibxml:author"/>
	<xsl:apply-templates select="bibxml:booktitle"/>
	<xsl:value-of select="bibxml:institution"/>.
	<xsl:if test="bibxml:number != ''">
		<xsl:value-of select="bibxml:number"/>.
	</xsl:if>
	<xsl:if test="bibxml:type != ''">
		<xsl:value-of select="bibxml:type"/>.
	</xsl:if>
	<xsl:apply-templates select="bibxml:month"/>
	<xsl:apply-templates select="bibxml:year"/>
</xsl:template>

<xsl:template match="bibxml:phdthesis | bibxml:masterthesis">
	<xsl:apply-templates select="bibxml:title"/>
	<xsl:apply-templates select="bibxml:author"/>
	<xsl:if test="bibxml:school != ''">
		<xsl:value-of select="bibxml:school"/>.
	</xsl:if>
	<xsl:if test="bibxml:number != ''">
		<xsl:value-of select="bibxml:number"/>.
	</xsl:if>
	<xsl:apply-templates select="bibxml:year"/>
</xsl:template>

<xsl:template match="bibxml:misc">
	<xsl:if test="bibxml:title != ''">
		<xsl:apply-templates select="bibxml:title"/>
	</xsl:if>
	<xsl:apply-templates select="bibxml:author"/>
	<xsl:if test="bibxml:howpublished != ''">
		<xsl:value-of select="bibxml:howpublished"/>.
	</xsl:if>
	<xsl:apply-templates select="bibxml:month"/>
	<xsl:apply-templates select="bibxml:year"/>
</xsl:template>

<xsl:template match="bibxml:unpublished">
	<xsl:apply-templates select="bibxml:title"/>
	<xsl:apply-templates select="bibxml:author"/>
	<xsl:apply-templates select="bibxml:note"/>
</xsl:template>

<xsl:template match="bibxml:manual">
	<xsl:apply-templates select="bibxml:title"/>
	<xsl:apply-templates select="bibxml:author"/>
	<xsl:if test="bibxml:organization != ''">
		<xsl:value-of select="bibxml:organization"/>.
	</xsl:if>
	<xsl:apply-templates select="bibxml:edition"/>
	<xsl:apply-templates select="bibxml:address"/>
	<xsl:apply-templates select="bibxml:month"/>
	<xsl:apply-templates select="bibxml:year"/>
	<xsl:apply-templates select="bibxml:note"/>
</xsl:template>

<xsl:template match="bibxml:proceedings">
	<xsl:apply-templates select="bibxml:title"/>
	<xsl:if test="bibxml:editor != ''">
		<xsl:value-of select="bibxml:editor"/>.
	</xsl:if>
	<xsl:if test="bibxml:publisher != ''">
		<xsl:value-of select="bibxml:publisher"/>.
	</xsl:if>
	<xsl:if test="bibxml:organization != ''">
		<xsl:value-of select="bibxml:organization"/>.
	</xsl:if>
	<xsl:apply-templates select="bibxml:address"/>
	<xsl:apply-templates select="bibxml:month"/>
	<xsl:apply-templates select="bibxml:year"/>
	<xsl:apply-templates select="bibxml:note"/>
</xsl:template>

<xsl:template match="bibxml:booklet">
	<xsl:apply-templates select="bibxml:title"/>
	<xsl:apply-templates select="bibxml:author"/>
	<xsl:if test="bibxml:howpublished != ''">
		<xsl:value-of select="bibxml:howpublished"/>.
	</xsl:if>
	<xsl:apply-templates select="bibxml:address"/>
	<xsl:apply-templates select="bibxml:month"/>
	<xsl:apply-templates select="bibxml:year"/>
	<xsl:apply-templates select="bibxml:note"/>
</xsl:template>


<xsl:template match="bibxml:inbook">
	<xsl:apply-templates select="bibxml:title"/>
	<xsl:if test="bibxml:chapter != ''">
		<xsl:value-of select="bibxml:chapter"/>.
	</xsl:if>
	<xsl:apply-templates select="bibxml:author"/>
	<xsl:if test="bibxml:editor != ''">
		Edited by <xsl:value-of select="bibxml:editor"/>.
	</xsl:if>
	<xsl:if test="bibxml:howpublished != ''">
		<xsl:value-of select="bibxml:howpublished"/>.
	</xsl:if>
	<xsl:apply-templates select="bibxml:address"/>

	<xsl:if test="bibxml:publisher != ''">
		<xsl:value-of select="bibxml:publisher"/>.
	</xsl:if>
	<xsl:if test="bibxml:series != ''">
		<xsl:value-of select="bibxml:series"/>.
	</xsl:if>
	<xsl:apply-templates select="bibxml:volume"/>
	<xsl:apply-templates select="bibxml:edition"/>

	<xsl:apply-templates select="bibxml:month"/>
	<xsl:apply-templates select="bibxml:year"/>
	<xsl:apply-templates select="bibxml:pages"/>
</xsl:template>

<!-- fields -->

<xsl:template match="bibxml:pdf">
  <a>
    <xsl:attribute name="href">
      <xsl:value-of select="."/>
    </xsl:attribute>
    <xsl:attribute name="title">
      <xsl:value-of select="../bibxml:title"/>
    </xsl:attribute>
    <img alt="PDF" src="icons/pdf.png" class="pubicon" />
  </a>
</xsl:template>

<xsl:template match="bibxml:ps">
  <a>
    <xsl:attribute name="href">
      <xsl:value-of select="."/>
    </xsl:attribute>
    <xsl:attribute name="title">
      <xsl:value-of select="../bibxml:title"/>
    </xsl:attribute>
    <img alt="PostScript" src="icons/ps.png" class="pubicon" />
  </a>
</xsl:template>

<xsl:template match="bibxml:dvi">
  <a>
    <xsl:attribute name="href">
      <xsl:value-of select="."/>
    </xsl:attribute>
    <xsl:attribute name="title">
      <xsl:value-of select="../bibxml:title"/>
    </xsl:attribute>
    <img alt="DVI" src="icons/dvi.png" class="pubicon" />
  </a>
</xsl:template>

<xsl:template match="bibxml:url">
  <a>
    <xsl:attribute name="href">
      <xsl:value-of select="."/>
    </xsl:attribute>
    <xsl:attribute name="title">
      <xsl:value-of select="../bibxml:title"/>
    </xsl:attribute>
    <img alt="HTML" src="icons/html.png" class="pubicon" />
  </a>
</xsl:template>

<xsl:template match="bibxml:pages">
	<xsl:if test=". != ''">
	     pages <xsl:value-of select="."/>
	</xsl:if>
</xsl:template>

<xsl:template match="bibxml:month">
	<xsl:if test=". != ''">
		<xsl:value-of select="."/>&#160;</xsl:if>
</xsl:template>

<xsl:template name="format.in.ed.booktitle">
  <xsl:if test="bibxml:booktitle != ''">
    In 
    <xsl:if test="bibxml:editor != ''">
      <xsl:apply-templates select="bibxml:editor"/>,
    </xsl:if>
    <em><xsl:apply-templates select="bibxml:booktitle"/></em>
  </xsl:if>
</xsl:template>

<xsl:template name="format.bvolume">
  <xsl:if test="bibxml:volume != '' ">
    volume <xsl:value-of select="bibxml:volume" />
  <xsl:if test="bibxml:series != '' ">
    of <em><xsl:apply-templates select="bibxml:series" /></em>
    </xsl:if>
    <xsl:if test="bibxml:number != '' ">
      <xsl:message>
        can't use both volume and number fields in <xsl:value-of select="../../bibxml:entry/@id" />
      </xsl:message>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template match="bibxml:number">
	<xsl:if test=". != ''">	
	     &#8470;&#160;<xsl:value-of select="."/>
	</xsl:if>
</xsl:template>

<xsl:template match="bibxml:edition">
	<xsl:if test=". != ''">	
	     <xsl:value-of select="."/>&#160;edition.
	</xsl:if>
</xsl:template>

<xsl:template match="bibxml:title">
  <xsl:if test=". != ''">	
  <xsl:value-of select="."/>
	</xsl:if>
</xsl:template>

<xsl:template match="bibxml:note">
  <xsl:if test=". != ''">
    <xsl:value-of select="."/>.
  </xsl:if>
</xsl:template>

<xsl:template match="bibxml:address">
  <xsl:if test=". != ''">
    <xsl:value-of select="."/>,
  </xsl:if>
</xsl:template>

<xsl:template match="bibxml:publisher">
  <xsl:if test=". != '' ">
    <xsl:value-of select="."/>,
  </xsl:if>
</xsl:template>


<xsl:template match="bibxml:booktitle | bibxml:journal">
     <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="bibxml:year">
	<xsl:if test=". != ''">
	     <xsl:value-of select="."/>
	</xsl:if>
</xsl:template>

<xsl:template match="bibxml:author">
        <xsl:value-of select="."/>
	<xsl:choose>
	<xsl:when test="position() = count(../bibxml:author)">. </xsl:when>
	<xsl:when test="count(../bibxml:author) = 2 and position() = 1"> and </xsl:when>
	<xsl:when test="position() + 1 != count(../bibxml:author)">, </xsl:when>
	<xsl:when test="position() + 1 = count(../bibxml:author)">, and </xsl:when>
	</xsl:choose>	
</xsl:template>

<xsl:template match="bibxml:editor">
  <xsl:value-of select="."/>
  <xsl:choose>
    <xsl:when test="count(../bibxml:editor) > 1 and position() = count(../bibxml:editor)">, editors</xsl:when>
    <xsl:when test="count(../bibxml:editor) = 1 and position() = count(../bibxml:editor)">, editor</xsl:when>
    <xsl:when test="count(../bibxml:editor) = 2 and position() = 1"> and </xsl:when>
    <xsl:when test="position() + 1 != count(../bibxml:editor)">, </xsl:when>
    <xsl:when test="position() + 1 = count(../bibxml:editor)">, and </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="bibxml:institution |
                    bibxml:organization |
                     bibxml:school |
                     bibxml:type | bibxml:bookshelf | 
                     bibxml:annotate | bibxml:crossref |
                     bibxml:issn | bibxml:isbn |  bibxml:uri | 
                     bibxml:urn">
     <xsl:value-of select="."/>
     <xsl:if test="position() + 1 != last()">[MISC] </xsl:if>
</xsl:template>

<!--
   - Do not print the following entries
   -->
<xsl:template match="bibxml:category | bibxml:key | 
                     bibxml:keywords "/>
</xsl:stylesheet>
