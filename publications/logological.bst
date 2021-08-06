% BibTeX logological bibliography style, based on `biblet'
%
% Copyright (C) 1985 Oren Patashnik
% Copyright (C) 2021 Tristan Miller
%                    psychonaut@nothingisreal.com
%                    https://www.nothingisreal.com/biblet/
%
% This work may be distributed and/or modified under the conditions of
% the LaTeX Project Public License, either version 1.3 of this license
% or (at your option) any later version.  The latest version of this
% license is in <http://www.latex-project.org/lppl.txt> and version
% 1.3 or later is part of all distributions of LaTeX version
% 2003/12/01 or later.
%
% To do:
% - write documentation
% - make sure ' is not output inside attributes
% - make sure id cite keys are valid for XHTML
% - add "day" field
% - allow author/editor for inbook
%
% Changelog since prealpha:
% - sorted by year, then month
% - allow for both isbn and issn in proceedings
% - book covers
% - add "doi" field

ENTRY
  {
    abstract
    address
    appendix
    author
    booktitle
    bookurl
    chapter
    code
    cover
    data
    doi
    dvi
    edition
    editor
    howpublished
    html
    institution
    isbn
    issn
    journal
    key
    month
    note
    number
    organization
    pages
    pubtype
    pdf
    ps
    publisher
    school
    series
    tex
    title
    type
    video
    volume
    year
  }
  {}
  {}

% Global integers
INTEGERS
  {
    output.state 
    before.all 
    mid.sentence
    after.sentence
    after.block
    in.span
    debug.mode
    use.internal.latex2html
    latex2htmlize.abstracts
    longest.entry.name
    in.bibliography
  }

FUNCTION {init.state.consts}
{  #0 'debug.mode :=
   #1 'use.internal.latex2html :=
   #0 'latex2htmlize.abstracts :=
   #0 'before.all :=
   #1 'mid.sentence :=
   #2 'after.sentence :=
   #3 'after.block :=
   #0 'in.span :=
   #0 'in.bibliography :=
  #12 'longest.entry.name :=
}

% Global strings
STRINGS
  {
    s
    t
    null
    css.prefix
    cite.prefix
    heading.prefix
    current.pubtype
    current.year
    icon.path
    record.marker
    css.path
    covers.path
    css.filename
    link
  }

FUNCTION {init.string.consts}
{ "***NULL***"			'null			:=
  "***BEGIN_RECORD***"		'record.marker		:=
  "bib-"			'css.prefix		:=
  "cite-"			'cite.prefix		:=
  ""			'heading.prefix		:=
  "https://www.nothingisreal.com/icons/nuvola-1.0/48x48"	'icon.path		:=
  "css"				'css.path		:=
  "/images/covers"	'covers.path		:=
  null				'current.year		:=
  null				'current.pubtype	:=
}

FUNCTION {get.icon.data}
{ null

  % Link data has the following format:
  %
  %   <legend text>
  %   <CSS class name for icon>
  %   #0 in.bibliography = 'skip$ {<entry>} if$
  %   record.marker

  "Code"
  "mdi:source-repository"
  #0 in.bibliography = 'skip$ {code} if$
  record.marker
  
  "Data"
  "mdi:database"
  #0 in.bibliography = 'skip$ {data} if$
  record.marker

  "Video"
  "mdi:video"
  #0 in.bibliography = 'skip$ {video} if$
  record.marker

  "Appendix"
  "mdi:more"
  #0 in.bibliography = 'skip$ {appendix} if$
  record.marker

  "PDF"
  "mdi:file-pdf"
  #0 in.bibliography = 'skip$ {pdf} if$
  record.marker
  
  "HTML"
  "mdi:web"
  #0 in.bibliography = 'skip$ {html} if$
  record.marker
  
}

FUNCTION {get.link.data}
{ null

  % Link data has the following format:
  %
  %   <link rel>
  %   <link type>
  %   <link media>
  %   <link href>
  %   <link title>
  %   record.marker

  "alternate stylesheet"
  "text/css"
  "all"
  css.path "/plain.css" *
  "Plain"
  record.marker

  "alternate stylesheet"
  "text/css"
  "all"
  css.path "/traditional.css" *
  "Traditional"
  record.marker

  "alternate stylesheet"
  "text/css"
  "all"
  css.path "/breuel.css" *
  "Amethyst"
  record.marker

  "alternate stylesheet"
  "text/css"
  "all"
  css.path "/fruity.css" *
  "Fruity Typewriter"
  record.marker

  "alternate stylesheet"
  "text/css"
  "all"
  css.path "/boxy.css" *
  "Boxy"
  record.marker

  "stylesheet"
  "text/css"
  "all"
  css.path "/compact.css" *
  "Compact"
  record.marker

}

MACRO {jan} {"January"}
MACRO {feb} {"February"}
MACRO {mar} {"March"}
MACRO {apr} {"April"}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {jul} {"July"}
MACRO {aug} {"August"}
MACRO {sep} {"September"}
MACRO {oct} {"October"}
MACRO {nov} {"November"}
MACRO {dec} {"December"}

MACRO {acmcs} {"ACM Computing Surveys"}
MACRO {acta} {"Acta Informatica"}
MACRO {cacm} {"Communications of the ACM"}
MACRO {ibmjrd} {"IBM Journal of Research and Development"}
MACRO {ibmsj} {"IBM Systems Journal"}
MACRO {ieeese} {"IEEE Transactions on Software Engineering"}
MACRO {ieeetc} {"IEEE Transactions on Computers"}
MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}
MACRO {ipl} {"Information Processing Letters"}
MACRO {jacm} {"Journal of the ACM"}
MACRO {jcss} {"Journal of Computer and System Sciences"}
MACRO {scp} {"Science of Computer Programming"}
MACRO {sicomp} {"SIAM Journal on Computing"}
MACRO {tocs} {"ACM Transactions on Computer Systems"}
MACRO {tods} {"ACM Transactions on Database Systems"}
MACRO {tog} {"ACM Transactions on Graphics"}
MACRO {toms} {"ACM Transactions on Mathematical Software"}
MACRO {toois} {"ACM Transactions on Office Information Systems"}
MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}
MACRO {tcs} {"Theoretical Computer Science"}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

INTEGERS{ l }
FUNCTION{ string.length }
{
  #1 'l :=
  {duplicate$ duplicate$ #1 l substring$ = not}
    {l #1 + 'l :=}
  while$
  pop$ l
}


STRINGS{replace find text}
INTEGERS {find_length}
FUNCTION {find.replace}
{ 'replace :=
  'find :=
  'text :=
  find string.length 'find_length :=
  ""
    { text empty$ not }
    { text #1 find_length substring$ find =
        { replace *
	  text #1 find_length + global.max$ substring$ 'text :=
        }
	{ text #1 #1 substring$ *
	  text #2 global.max$ substring$ 'text :=
	}
      if$
    }
  while$
}
FUNCTION {latex2html.1}
{
}

FUNCTION {latex2html.2}
{
  "\textunderscore"  "&#x005F;"  find.replace
  "\textbackslash"  "&#x005C;"  find.replace
}

FUNCTION {latex2html.3}
{
  "\textbullet"  "&bull;"  find.replace
  "\textnumero"  "&#x2116;"  find.replace
  "\copyright"  "&copy;"  find.replace
  "\textminus"  "&minus;"  find.replace
}

FUNCTION {latex2html.4}
{
  "\textcent"  "&cent;"  find.replace
  "\texteuro"  "&euro;"  find.replace
  "\textless"  "&lt;"  find.replace
  "\LaTeXTeX"  "<span class='latex'>(L<sup>a</sup>)T<sub>e</sub>X</span>"  find.replace
}

FUNCTION {latex2html.5}
{
  "\textbar"  "&#x007C;"  find.replace
  "\textdiv"  "&divide;"  find.replace
  "\BibTeX"  "B<span style='font-variant:small-caps;'>ib</span><span class='tex'>T<sub>e</sub>X</span>"  find.replace
  "\pounds"  "&pound;"  find.replace
}

FUNCTION {latex2html.6}
{
  "\'{\i}"  "&iacute;"  find.replace
  "\={\i}"  "&#x012B;"  find.replace
  "\LaTeX"  "<span class='latex'>L<sup>a</sup>T<sub>e</sub>X</span>"  find.replace
  "\Thorn"  "&THORN;"  find.replace
  "\^{\i}"  "&icirc;"  find.replace
  "\^{\j}"  "&#x0135;"  find.replace
  "\`{\i}"  "&igrave;"  find.replace
}

FUNCTION {latex2html.7}
{
}

FUNCTION {latex2html.8}
{
  "\ldots"  "&hellip;"  find.replace
  "\slash"  "/"  find.replace
  "\thorn"  "&thorn;"  find.replace
  "\" quote$ * "{A}" *  "&Auml;"  find.replace
  "\" quote$ * "{E}" *  "&Euml;"  find.replace
  "\" quote$ * "{I}" *  "&Iuml;"  find.replace
  "\" quote$ * "{O}" *  "&Ouml;"  find.replace
  "\" quote$ * "{U}" *  "&Uuml;"  find.replace
  "\" quote$ * "{Y}" *  "&Yuml;"  find.replace
  "\" quote$ * "{a}" *  "&auml;"  find.replace
  "\" quote$ * "{e}" *  "&euml;"  find.replace
}

FUNCTION {latex2html.9}
{
  "\" quote$ * "{o}" *  "&ouml;"  find.replace
  "\" quote$ * "{u}" *  "&uuml;"  find.replace
  "\" quote$ * "{y}" *  "&yuml;"  find.replace
  "\'{A}"  "&Aacute;"  find.replace
  "\'{C}"  "&#x0106;"  find.replace
  "\'{E}"  "&Eacute;"  find.replace
  "\'{I}"  "&Iacute;"  find.replace
  "\'{L}"  "&#x0139;"  find.replace
  "\'{N}"  "&#x0143;"  find.replace
  "\'{O}"  "&Oacute;"  find.replace
  "\'{R}"  "&#x0154;"  find.replace
  "\'{S}"  "&#x015A;"  find.replace
  "\'{U}"  "&Uacute;"  find.replace
  "\'{Y}"  "&Yacute;"  find.replace
  "\'{Z}"  "&#x0179;"  find.replace
  "\'{a}"  "&aacute;"  find.replace
  "\'{c}"  "&#x0107;"  find.replace
  "\'{e}"  "&eacute;"  find.replace
  "\'{g}"  "&#x01F5;"  find.replace
  "\'{l}"  "&#x013A;"  find.replace
  "\'{n}"  "&#x0144;"  find.replace
  "\'{o}"  "&oacute;"  find.replace
  "\'{r}"  "&#x0155;"  find.replace
  "\'{s}"  "&#x015B;"  find.replace
  "\'{u}"  "&uacute;"  find.replace
  "\'{y}"  "&yacute;"  find.replace
  "\'{z}"  "&#x017A;"  find.replace
  "\.{C}"  "&#x010A;"  find.replace
  "\.{E}"  "&#x0116;"  find.replace
}

FUNCTION {latex2html.10}
{
  "\.{G}"  "&#x0120;"  find.replace
  "\.{I}"  "&#x0130;"  find.replace
  "\.{Z}"  "&#x017B;"  find.replace
  "\.{c}"  "&#x010B;"  find.replace
  "\.{e}"  "&#x0117;"  find.replace
  "\.{g}"  "&#x0121;"  find.replace
  "\.{z}"  "&#x017C;"  find.replace
  "\={A}"  "&#x0100;"  find.replace
  "\={E}"  "&#x0112;"  find.replace
  "\={I}"  "&#x012A;"  find.replace
  "\={O}"  "&#x014C;"  find.replace
  "\={U}"  "&#x016A;"  find.replace
  "\={a}"  "&#x0101;"  find.replace
  "\={e}"  "&#x0113;"  find.replace
  "\={o}"  "&#x014D;"  find.replace
  "\={u}"  "&#x016B;"  find.replace
}

FUNCTION {latex2html.11}
{
  "\H{O}"  "&#x0150;"  find.replace
  "\H{U}"  "&#x0170;"  find.replace
  "\H{o}"  "&#x0151;"  find.replace
  "\H{u}"  "&#x0171;"  find.replace
  "\^{A}"  "&Acirc;"  find.replace
  "\^{C}"  "&#x0108;"  find.replace
  "\^{E}"  "&Ecirc;"  find.replace
  "\^{G}"  "&#x011C;"  find.replace
  "\^{H}"  "&#x0124;"  find.replace
  "\^{I}"  "&Icirc;"  find.replace
  "\^{J}"  "&#x0134;"  find.replace
  "\^{O}"  "&Ocirc;"  find.replace
  "\^{S}"  "&#x015C;"  find.replace
  "\^{U}"  "&Ucirc;"  find.replace
  "\^{W}"  "&#x0174;"  find.replace
  "\^{Y}"  "&#x0176;"  find.replace
  "\^{a}"  "&acirc;"  find.replace
  "\^{c}"  "&#x0109;"  find.replace
  "\^{e}"  "&ecirc;"  find.replace
  "\^{g}"  "&#x011D;"  find.replace
  "\^{h}"  "&#x0125;"  find.replace
  "\^{o}"  "&ocirc;"  find.replace
  "\^{s}"  "&#x015D;"  find.replace
  "\^{u}"  "&ucirc;"  find.replace
  "\^{w}"  "&#x0175;"  find.replace
  "\^{y}"  "&#x0177;"  find.replace
  "\`{A}"  "&Agrave;"  find.replace
  "\`{E}"  "&Egrave;"  find.replace
  "\`{I}"  "&Igrave;"  find.replace
}

FUNCTION {latex2html.12}
{
  "\`{O}"  "&Ograve;"  find.replace
  "\`{U}"  "&Ugrave;"  find.replace
  "\`{a}"  "&agrave;"  find.replace
  "\`{e}"  "&egrave;"  find.replace
  "\`{o}"  "&ograve;"  find.replace
  "\`{u}"  "&ugrave;"  find.replace
  "\cent"  "&cent;"  find.replace
  "\c{C}"  "&Ccedil;"  find.replace
}

FUNCTION {latex2html.13}
{
  "\c{G}"  "&#x0122;"  find.replace
  "\c{K}"  "&#x0136;"  find.replace
  "\c{L}"  "&#x013B;"  find.replace
  "\c{N}"  "&#x0145;"  find.replace
  "\c{R}"  "&#x0156;"  find.replace
  "\c{S}"  "&#x015E;"  find.replace
  "\c{T}"  "&#x0162;"  find.replace
  "\c{c}"  "&ccedil;"  find.replace
  "\c{k}"  "&#x0137;"  find.replace
  "\c{l}"  "&#x013C;"  find.replace
  "\c{n}"  "&#x0146;"  find.replace
  "\c{r}"  "&#x0157;"  find.replace
  "\c{s}"  "&#x015F;"  find.replace
  "\c{t}"  "&#x0163;"  find.replace
  "\k{A}"  "&#x0104;"  find.replace
  "\k{E}"  "&#x0118;"  find.replace
  "\k{I}"  "&#x012E;"  find.replace
  "\k{U}"  "&#x0172;"  find.replace
  "\k{a}"  "&#x0105;"  find.replace
  "\k{e}"  "&#x0119;"  find.replace
  "\k{i}"  "&#x012F;"  find.replace
  "\k{u}"  "&#x0173;"  find.replace
  "\r{U}"  "&#x016E;"  find.replace
  "\r{u}"  "&#x016F;"  find.replace
  "\u{A}"  "&#x0102;"  find.replace
  "\u{G}"  "&#x011E;"  find.replace
  "\u{U}"  "&#x016C;"  find.replace
  "\u{a}"  "&#x0103;"  find.replace
  "\u{g}"  "&#x011F;"  find.replace
}

FUNCTION {latex2html.14}
{
  "\u{u}"  "&#x016D;"  find.replace
  "\v{C}"  "&#x010C;"  find.replace
  "\v{D}"  "&#x010E;"  find.replace
  "\v{E}"  "&#x011A;"  find.replace
  "\v{L}"  "&#x013D;"  find.replace
  "\v{N}"  "&#x0147;"  find.replace
  "\v{R}"  "&#x0158;"  find.replace
  "\v{S}"  "&Scaron;"  find.replace
  "\v{T}"  "&#x0164;"  find.replace
  "\v{Z}"  "&#x017D;"  find.replace
  "\v{c}"  "&#x010D;"  find.replace
  "\v{d}"  "&#x010F;"  find.replace
  "\v{e}"  "&#x011B;"  find.replace
  "\v{l}"  "&#x013E;"  find.replace
  "\v{n}"  "&#x0148;"  find.replace
  "\v{r}"  "&#x0159;"  find.replace
  "\v{s}"  "&scaron;"  find.replace
  "\v{t}"  "&#x0165;"  find.replace
  "\v{z}"  "&#x017E;"  find.replace
  "\~{A}"  "&Atilde;"  find.replace
  "\~{I}"  "&#x0128;"  find.replace
  "\~{N}"  "&Ntilde;"  find.replace
  "\~{O}"  "&Otilde;"  find.replace
  "\~{U}"  "&#x0168;"  find.replace
  "\~{a}"  "&atilde;"  find.replace
  "\~{n}"  "&ntilde;"  find.replace
  "\~{o}"  "&otilde;"  find.replace
  "\~{u}"  "&#x0169;"  find.replace
  "\TeX"  "<span class='tex'>T<sub>e</sub>X</span>"  find.replace
}

FUNCTION {latex2html.15}
{
  "---"  "&mdash;"  find.replace
  "\@."  "&#x002E;"  find.replace
  "\AA"  "&#x212B;"  find.replace
  "\AA"  "&Aring;"  find.replace
  "\AE"  "&AElig;"  find.replace
  "\DH"  "&ETH;"  find.replace
  "\DJ"  "&#x0110;"  find.replace
  "\NG"  "&#x014A;"  find.replace
  "\OE"  "&OElig;"  find.replace
  "\TH"  "&THORN;"  find.replace
  "\aa"  "&aring;"  find.replace
  "\ae"  "&aelig;"  find.replace
  "\dh"  "&eth;"  find.replace
  "\dj"  "&#x0111;"  find.replace
  "\ng"  "&#x014B;"  find.replace
  "\oe"  "&oelig;"  find.replace
}

FUNCTION {latex2html.16}
{
  "\ss"  "&szlig;"  find.replace
  "\th"  "&thorn;"  find.replace
  "\@ "  " "  find.replace
  "\ "  " "  find.replace
  "!`"  "&iexcl;"  find.replace
  "!!"  "&#x203C;"  find.replace
  "''"  "&rdquo;"  find.replace
  ",,"  "&ldquor;"  find.replace
  "--"  "&ndash;"  find.replace
  "?`"  "&iquest;"  find.replace
  "\#"  "&#x0023;"  find.replace
  "\$"  "&#x0024;"  find.replace
  "\%"  "&#x0025;"  find.replace
  "\&"  "&amp;"  find.replace
  "\-"  "&shy;"  find.replace
  "\L"  "&#x0141;"  find.replace
  "\O"  "&Oslash;"  find.replace
  "\P"  "&para;"  find.replace
  "\S"  "&sect;"  find.replace
  "\_"  "&#x005F;"  find.replace
  "\i"  "&#x0131;"  find.replace
  "\l"  "&#x0142;"  find.replace
  "\o"  "&oslash;"  find.replace
  "\{"  "&#x007B;"  find.replace
  "\}"  "&#x007D;"  find.replace
  "``"  "&ldquo;"  find.replace
  quote$  "&quot;"  find.replace
  "`"  "&lsquo;"  find.replace
  "~"  "&nbsp;"  find.replace
  "{"  ""  find.replace
  "}"  ""  find.replace
}

FUNCTION {latex2html}
{ use.internal.latex2html #0 =
    'skip$
    {
      latex2html.1
      latex2html.2
      latex2html.3
      latex2html.4
      latex2html.5
      latex2html.6
      latex2html.7
      latex2html.8
      latex2html.9
      latex2html.10
      latex2html.11
      latex2html.12
      latex2html.13
      latex2html.14
      latex2html.15
      latex2html.16
    }
  if$
}


FUNCTION {url.escape}
{
  "&"  "&amp;"  find.replace
  "'"  "%27"  find.replace
}

FUNCTION {html.escape}
{
  "&"  "&amp;"  find.replace
  ">"  "&gt;"  find.replace
  "<"  "&lt;"  find.replace
}

FUNCTION {output.nonnull}
{ latex2html
  's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
	{ add.period$ write$
	  in.span #0 >
	    { "</span>" write$
	      in.span #1 - 'in.span :=
            }
	    'skip$
	  if$
	  newline$
	}
	{ output.state before.all =
	    'write$
	    { add.period$ " " * write$
	      in.span #0 >
	        { "</span>" write$
		  in.span #1 - 'in.span :=
                }
	        'skip$
	      if$
            }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {output.citationicons}
{
  % Citation button
  "                <input type='radio' class='btn-check' name='" cite$ * "-btn-group-bib' id='" * cite$ * "-btn-citation' checked>" * write$
  newline$
  "                <label class='btn btn-outline-primary btn-sm' for='" cite$ * "-btn-citation' onclick=" * quote$ * "openTab('" * cite$ *
  "','" * "citation" * "')" * quote$ * ">" * write$
  newline$
  "                  <span class='iconify me-2' data-icon='mdi:format-quote-close'></span>Citation" write$
  newline$
  "                </label>" write$
  newline$

  % Abstract button
  abstract missing$
    'skip$
    {
      "                <input type='radio' class='btn-check' name='" cite$ * "-btn-group-bib' id='" * cite$ * "-btn-abstract'>" * write$
      newline$
      "                <label class='btn btn-outline-primary btn-sm' for='" cite$ * "-btn-abstract' onclick=" * quote$ * "openTab('" * cite$ *
      "','" * "abstract" * "')" * quote$ * ">" * write$
      newline$
      "                  <span class='iconify me-2' data-icon='mdi:sign-text'></span>Abstract" write$
      newline$
      "                </label>" write$
      newline$
    }
  if$

  % BibTeX button
  "                <input type='radio' class='btn-check' name='" cite$ * "-btn-group-bib' id='" * cite$ * "-btn-bibtex'>" * write$
  newline$
  "                <label class='btn btn-outline-primary btn-sm me-5' for='" cite$ * "-btn-bibtex' onclick=" * quote$ * "openTab('" * cite$ *
  "','" * "bibtex" * "')" * quote$ * ">" * write$
  newline$
  "                  <span class='iconify me-2' data-icon='mdi:library'></span>BibTeX" write$
  newline$
  "                </label>" write$
  newline$
}

INTEGERS {first.icon}
FUNCTION {output.icons}
{ get.icon.data
  { record.marker = }
    { duplicate$ missing$
        { pop$ pop$ pop$ }
        {
	  "                <a href='" swap$ url.escape * "' class='btn btn-outline-primary btn-sm me-1'>" * write$
	  newline$
	  "                  <span class='iconify me-1' data-icon='" swap$ * "'></span>" * swap$ * write$
	  newline$
	  "                </a>" write$
	  newline$
        }
      if$
    }
  while$
}

% Not implemented for logological.org
FUNCTION {output.pubtype.heading}
{  pubtype missing$
     {
       %"Missing pubtype in " cite$ * warning$
    }
    { current.pubtype pubtype =
        'skip$
        { 
          current.pubtype null =
            'skip$
            { "        </ol>" write$ newline$ }
          if$
          "<p></html>" write$ newline$
	  "==" pubtype * "==" * write$ newline$
          "<html></p>" write$ newline$
          "        <ol class='" css.prefix * "list'>" * write$ newline$
          pubtype 'current.pubtype :=
        }
      if$
    }
  if$
  newline$
}

FUNCTION {output.bibitem}
{ output.pubtype.heading

  "    <div class='card mb-0 mt-0 pb-3 pt-3 border-end-0 border-start-0 border-top-0 border-bottom-1' id='" cite$ * "'>" * write$
  newline$
  "      <div class='row g-0 align-items-center'>" write$
  newline$
  "        <div class='col-sm-2 text-center'>" write$
  newline$
  "          <img src='" covers.path * "/" * cite$ * ".jpg' alt='' class='border border-dark img-fluid'>" * write$
  newline$
  "        </div>" write$
  newline$
  "        <div class='col-sm-10'>" write$
  newline$
  "          <div class='card-body'>" write$
  newline$
  type$ "" =
    { "            <div class='" css.prefix * "unknown'>" * write$ }
    { "            <div class='" css.prefix * type$ * "'>" * write$ }
  if$
  newline$
  "              <div id='" cite$ * "-citation' class='" * cite$ * "-tab'>" * write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {output.abstract}
{ abstract missing$
    'skip$
    { "              <div id='" cite$ * "-abstract' class='d-none " * css.prefix * "abstract " * cite$ * "-tab'>" * 
      abstract * "</div>" *
      #0 latex2htmlize.abstracts =
        'skip$
        'latex2html
      if$
      write$
      newline$
    }
  if$
}

FUNCTION {format.abbreviated.month}
{ s "January" =
  s "February" = or
  s "March" = or
  s "April" = or
  s "May" = or
  s "June" = or
  s "July" = or
  s "August" = or
  s "September" = or
  s "October" = or
  s "November" = or
  s "December" = or
    { s "January" = { "jan" } 'skip$ if$
      s "February" = { "feb" } 'skip$ if$
      s "March" = { "mar" } 'skip$ if$
      s "April" = { "apr" } 'skip$ if$
      s "May" = { "may" } 'skip$ if$
      s "June" = { "jun" } 'skip$ if$
      s "July" = { "jul" } 'skip$ if$
      s "August" = { "aug" } 'skip$ if$
      s "September" = { "sep" } 'skip$ if$
      s "October" = { "oct" } 'skip$ if$
      s "November" = { "nov" } 'skip$ if$
      s "December" = { "dec" } 'skip$ if$
    }
    { "{" s html.escape * "}" * }
  if$
}

INTEGERS {j}
FUNCTION {output.entry}
{ duplicate$
  missing$
    {pop$ pop$}
    { 's :=
      't :=
      "<div class='" css.prefix * "field'>" * write$
      "<span class='" css.prefix * "field-name' >" * write$
      t write$
      longest.entry.name t string.length - 'j :=
      {j #0 >}
        { j #1 - 'j :=
          "&nbsp;" write$
        }
      while$
      "</span> = <span class='" css.prefix * "field-data'>" * write$
      t "month" =
        'format.abbreviated.month
         { "{" s html.escape * "}" * }
      if$
      "</span>,</div>" * write$ newline$
    }
  if$
}

FUNCTION {output.entries}
{
  "author" author output.entry
  "editor" editor output.entry
  "title" title output.entry
  "journal" journal output.entry
  "booktitle" booktitle output.entry

  "chapter" chapter output.entry
  "edition" edition output.entry
  "volume" volume output.entry
  "number" number output.entry
  "pages" pages output.entry

  "series" series output.entry
  "type" type output.entry

  "month" month output.entry
  "year" year output.entry

  "organization" organization output.entry
  "institution" institution output.entry
  "school" school output.entry
  "publisher" publisher output.entry
  "address" address output.entry
  "howpublished" howpublished output.entry

  "isbn" isbn output.entry
  "issn" issn output.entry
  "doi" doi output.entry
  "note" note output.entry
}

FUNCTION {output.bibtex}
{ %"{% raw %}" write$ newline$
  "<div id='" cite$ * "-bibtex' class='d-none " * css.prefix * "bibtex " * cite$ * "-tab'>" * write$ newline$
  "<span class='" css.prefix * "entry-type'>" * write$
  "@" type$ * "</span>{" * write$
  "<span class='" css.prefix * "entry-key'>" * cite$ *
  "</span>,<br>" * write$ newline$
  output.entries
  "}</div>" write$ newline$
  %"{% endraw %}" write$ newline$
}

FUNCTION {fin.entry}
{ add.period$ "</div>" *
  write$
  newline$
  output.abstract
  output.bibtex
  "              <div class='row'>" write$
  newline$
  "              <div class='col'>" write$
  newline$
  "                <div class='btn-group mt-3' role='group' aria-label='Bibliographic details' style='white-space: nowrap;'>" write$
  newline$
  output.citationicons
  "                </div> <!-- btn-group -->" write$
  newline$
  "              </div> <!-- col -->" write$
  newline$
  "              <div class='col'>" write$
  newline$
  "                <div class='btn-group mt-3' role='group' aria-label='Document links' style='white-space: nowrap;'>" write$
  newline$
  output.icons
  "                </div> <!-- btn-group -->" write$
  newline$
  "              </div> <!-- col -->" write$
  newline$
  "              </div> <!-- row -->" write$
  newline$
  "            </div> <!-- bib-" type$ * " -->" * write$ newline$
  "          </div> <!-- card-body -->" write$ newline$
  "        </div> <!-- col -->" write$ newline$
  "      </div> <!-- row -->" write$ newline$
  "    </div> <!-- card -->" write$ newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := 
    }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
	'skip$
	{ after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

%FUNCTION {emphasize}
%{ duplicate$ empty$
%    { pop$ "" }
%    { "<em>" swap$ * "</em>" * }
%  if$
%}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{ff~}{vv~}{ll}{, jj}" format.name$ 't :=
      nameptr #1 >
	{ namesleft #1 >
	    { ", " * t * }
	    { numnames #2 >
		{ "," * }
		'skip$
	      if$
	      t "others" =
		{ " et&nbsp;al." * }
		{ " and " * t * }
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { "<span class='" css.prefix * "author'>" * write$
      #1 in.span + 'in.span :=
      author format.names 
    }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { #1 in.span + 'in.span :=
      "<span class='" css.prefix * "editor'>" * 
      editor format.names *
      editor num.names$ #1 >
	{ ", editors" * }
	{ ", editor" * }
      if$
    }
  if$
}

FUNCTION {format.doi}
{ doi empty$
    { "" }
    { new.block "DOI: <a href='https://dx.doi.org/" doi * "'>" *
      doi * "</a>" * }
  if$
}

FUNCTION {format.isbn}
{ isbn empty$
    { "" }
    { new.block "ISBN " isbn * }
  if$
}

FUNCTION {format.issn}
{ issn empty$
    { "" }
    { new.block "ISSN " issn * }
  if$
}

FUNCTION {format.btitle.link}
{ "" 'link :=
  bookurl empty$
    { "<span class='" css.prefix * "booktitle'>" * booktitle * "</span>" * }
    {
      "<span class='" css.prefix * "booktitle'><a href='" * bookurl * "'>" *
      booktitle * "</a></span>" * 
    }
  if$
}

FUNCTION {format.jtitle.link}
{ "" 'link :=
  bookurl empty$
    {  "<span class='" css.prefix * "journaltitle'>" * journal * "</span>" *}
    {
      "<span class='" css.prefix * "journaltitle'><a href='" * bookurl * "'>" *
      journal * "</a></span>" * 
    }
  if$
}

FUNCTION {format.title.link}
{ "" 'link :=
  pdf empty$
    {
      html empty$
	{ }
	{ html 'link := }
      if$ 
    }
    { pdf 'link := }
  if$
  link empty$
    { title "t" change.case$ }
    {
      "<a href='" link * "'>" *
      %title=" *   quote$ * title latex2html * quote$ * ">" * 
      title "t" change.case$ * "</a>" * 
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { #1 in.span + 'in.span :=
      "<span class='" css.prefix * "title'>" * 
%      title "t" change.case$ *
      format.title.link *
    }
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
	{ t #1 #2 substring$ "--" = not
	    { "--" *
	      t #2 global.max$ substring$ 't :=
	    }
	    {   { t #1 #1 substring$ "-" = }
		{ "-" *
		  t #2 global.max$ substring$ 't :=
		}
	      while$
	    }
	  if$
	}
	{ t #1 #1 substring$ *
	  t #2 global.max$ substring$ 't :=
	}
      if$
    }
  while$
}

FUNCTION {format.date}
{ year empty$
    { month empty$
	{ "" }
	{ "there's a month but no year in " cite$ * warning$
	  month
	}
      if$
    }
    { month empty$
	'year
	{ month " " * year * }
      if$
    }
  if$
}

FUNCTION {format.btitle}
{  #1 in.span + 'in.span :=
  "<span class='" css.prefix * "booktitle'>" * title *
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "&nbsp;" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { "volume" volume tie.or.space.connect
      series empty$
	'skip$
	{ " of " * series * 
	  issn empty$
	  'skip$
	  { " (ISSN " * issn * ")" * }
	  if$
	}
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
	{ series field.or.null }
	{ output.state mid.sentence =
	    { "number" }
	    { "Number" }
	  if$
	  number tie.or.space.connect
	  series empty$
	    { "there's a number but no series in " cite$ * warning$ }
	    { " in " * series * }
	  if$
	}
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
	{ edition "l" change.case$ " edition" * }
	{ edition "t" change.case$ " edition" * }
      if$
    }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
	{ #1 'multiresult := }
	{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
	{ "pages" pages n.dashify tie.or.space.connect }
	{ "page" pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
  number empty$
    'skip$
    { "(" number * ")" * *
      volume empty$
	{ "there's a number but no volume in " cite$ * warning$ }
	'skip$
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
	{ pop$ format.pages }
	{ ":" * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
	{ "chapter" }
	{ type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
	'skip$
	{ ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
	{ "In " format.btitle.link * }
	{ "In " format.editors * "</span>, " * format.btitle.link *
	  in.span #1 - 'in.span :=
        }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
	{ "need key or journal for " cite$ * " to crossref " * crossref *
	  warning$
	  ""
	}
	{ "In " format.jtitle.link * }
      if$
    }
    { "In " key * }
  if$
  " <a href='#" * cite.prefix * crossref * "'>[" * crossref * "]</a>" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " et&nbsp;al." * }
    { #2 <
	'skip$
	{ editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
	    { " et&nbsp;al." * }
	    { " and " * editor #2 "{vv~}{ll}" format.name$ * }
	  if$
	}
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Volume" volume tie.or.space.connect
      " of " *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ series empty$
	    { "need editor, key, or series for " cite$ * " to crossref " *
	      crossref * warning$
	      "" *
	    }
	    { "<span class='" css.prefix * "series'>" * series * "</span>" * }
	  if$
	}
	{ key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " <a href='#" * cite.prefix * crossref * "'>[" * crossref * "]</a>" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ booktitle empty$
	    { "need editor, key, or booktitle for " cite$ * " to crossref " *
	      crossref * warning$
	      ""
	    }
	    { "In " format.btitle.link * }
	  if$
	}
	{ "In " key * }
      if$
    }
    { "In " format.crossref.editor * }
  if$
  " <a href='#" * cite.prefix * crossref * "'>[" * crossref * "]</a>" *
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  "<br>" write$ % Line break after authors
  new.block
  crossref missing$
    { format.jtitle.link "journal" output.check
      "<br>" write$ % Line break after title
      format.vol.num.pages output
      format.date "year" output.check
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  format.issn output
  new.block
  format.doi output
  new.block
  note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  crossref missing$
    { new.sentence
      author empty$ not editor empty$ not and
      { "Edited by " editor format.names * }
      { "" }
      if$
      output.nonnull
      new.sentence
      format.bvolume output
      new.block
      format.number.series output
      new.sentence
      publisher "publisher" output.check
      address output
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  new.block
  format.isbn output
  new.block
  format.doi output
  note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  new.block
  format.title "title" output.check
  howpublished address new.block.checkb
  howpublished output
  address output
  format.date output
  format.isbn output
  new.block
  format.doi output
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.number.series output
      new.sentence
      publisher "publisher" output.check
      address output
    }
    { format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  format.isbn output
  new.block
  format.doi output
  new.block
  note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  "<br>" write$ % Line break after authors
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      "<br>" write$ % Line break after title
      format.bvolume output
      format.number.series output
      format.chapter.pages output
      new.sentence
      publisher "publisher" output.check
      address output
      format.edition output
      format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  format.isbn output
  new.block
  format.doi output
  new.block
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  "<br>" write$ % Line break after authors
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      "<br>" write$ % Line break after title
      format.bvolume output
      format.number.series output
      format.pages output
      address empty$
	{ organization publisher new.sentence.checkb
	  organization output
	  publisher output
	  format.date "year" output.check
	}
	{ address output.nonnull
	  format.date "year" output.check
	  new.sentence
	  organization output
	  publisher output
	}
      if$
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  format.isbn output
  new.block
  format.doi output
  new.block
  note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
	'skip$
	{ organization output.nonnull
	  address output
	}
      if$
    }
    { format.authors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  author empty$
    { organization empty$
	{ address new.block.checka
	  address output
	}
	'skip$
      if$
    }
    { organization address new.block.checkb
      organization output
      address output
    }
  if$
  format.edition output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  "Master's thesis" format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  new.block
  format.doi output
  new.block
  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  title howpublished new.block.checkb
  format.title output
  howpublished new.block.checka
  howpublished output
  format.date output
  new.block
  format.issn output
  new.block
  format.doi output
  new.block
  note output
  fin.entry
  empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  "PhD thesis" format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  new.block
  format.doi output
  new.block
  note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  address empty$
    { editor empty$
	{ publisher new.sentence.checka }
	{ organization publisher new.sentence.checkb
	  organization output
	}
      if$
      publisher output
      format.date "year" output.check
    }
    { address output.nonnull
      format.date "year" output.check
      new.sentence
      editor empty$
	'skip$
	{ organization output }
      if$
      publisher output
    }
  if$
  format.isbn output
  new.block
  format.doi output
  new.block
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  format.date "year" output.check
  new.block
  format.doi output
  new.block
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  note "note" output.check
  format.date output
  fin.entry
}

FUNCTION {default.type} { misc }

READ

FUNCTION {sortify}
{ purify$
  "u" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
	{ "   " * }
	'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
	{ "et al" * }
	{ t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
	{ "to sort, need author or key in " cite$ * warning$
	  ""
	}
	{ key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
	{ key empty$
	    { "to sort, need author, editor, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
	{ key empty$
	    { "to sort, need author, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
	{ key empty$
	    { "to sort, need editor, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

INTEGERS {textlen i}
FUNCTION {invert}
{ 's :=
  s "" =
    { "ZZZZ" }
    { s string.length 'textlen :=
      #1 'i :=
      ""
      { i textlen #1 + < }
        {
          #122 s i #1 substring$ chr.to.int$ - int.to.chr$ *
          #1 i + 'i :=
        }
      while$
    }
  if$
}

FUNCTION {sort.format.month}
{ 't :=
  t #1 #3 substring$ "Jan" =
  t #1 #3 substring$ "jan" =
  or
  { "12" }
    { t #1 #3 substring$ "Feb" =
      t #1 #3 substring$ "feb" =
      or
      { "11" }
      { t #1 #3 substring$ "Mar" =
        t #1 #3 substring$ "mar" =
        or
        { "10" }
        { t #1 #3 substring$ "Apr" =
          t #1 #3 substring$ "apr" =
          or
          { "09" }
          { t #1 #3 substring$ "May" =
            t #1 #3 substring$ "may" =
            or
            { "08" }
            { t #1 #3 substring$ "Jun" =
              t #1 #3 substring$ "jun" =
              or
              { "07" }
              { t #1 #3 substring$ "Jul" =
                t #1 #3 substring$ "jul" =
                or
                { "06" }
                { t #1 #3 substring$ "Aug" =
                  t #1 #3 substring$ "aug" =
                  or
                  { "05" }
                  { t #1 #3 substring$ "Sep" =
                    t #1 #3 substring$ "sep" =
                    or
                    { "04" }
                    { t #1 #3 substring$ "Oct" =
                      t #1 #3 substring$ "oct" =
                      or
                      { "03" }
                      { t #1 #3 substring$ "Nov" =
                        t #1 #3 substring$ "nov" =
                        or
                        { "02" }
                        { t #1 #3 substring$ "Dec" =
                          t #1 #3 substring$ "dec" =
                          or
                          { "01" }
                          { "00" } % No month specified
                        if$
                        }
                      if$
                      }
                    if$
                    }
                  if$
                  }
                if$
                }
              if$
              }
            if$
            }
          if$
          }
        if$
        }
      if$
      }
    if$
    }
  if$
}

FUNCTION {presort}
{ pubtype field.or.null sortify
  "    "
  *
  year field.or.null sortify invert
  *
  "    "
  *
  month field.or.null sort.format.month
  *
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
	'editor.organization.sort
	{ type$ "manual" =
	    'author.organization.sort
	    'author.sort
	  if$
	}
      if$
    }
  if$
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

EXECUTE {init.state.consts}

% Not implemented for logological.org
FUNCTION {output.legend}
{
  "<!-- BEGIN BIBLET LEGEND -->" write$ newline$
  "    <div class='" css.prefix * "legend'>" * write$ newline$
  "      <ul>" write$ newline$
  get.icon.data
  { record.marker = }
    { "        <li><img " write$ newline$
      "src = '" swap$ url.escape * "'" * write$ newline$
      "alt = '"   swap$ * "'" * write$ newline$
      "title = '" swap$ * "'" * write$ newline$
      duplicate$ "" =
        'pop$
        { "width = '" swap$ * "'" * write$ newline$ }
      if$
      duplicate$ "" =
        'pop$
        { "height = '" swap$ * "'" * write$ newline$ }
      if$
      "/>" swap$ * "</li>" * write$ newline$
    }
  while$
  "      </ul>" write$ newline$
  "    </div>" write$ newline$
  "<!-- END BIBLET LEGEND -->" write$ newline$
}

FUNCTION {output.links}
{
  get.link.data
  { record.marker = }
    { "    <link " write$
      "title='" swap$ * "' " * write$
      "href='"  swap$ url.escape * "' " * write$
      "media='" swap$ * "' " * write$
      "type='"  swap$ * "' " * write$
      "rel='"   swap$ * "' " * write$
      "/>" write$ newline$
    }
  while$
}

% Not implemented for logological.org
FUNCTION {output.showhide}
{
  "<!-- BEGIN BIBLET SHOWHIDE -->" write$ newline$
  "    <div class='" css.prefix * "showhide'>" * write$ newline$
  "      <ul>" write$ newline$
  "        <li><a href='#' onclick=" quote$ *
  "toggleAll('" * css.prefix * "abstract')" * quote$ *
  ">Show/hide abstracts</a></li>" * write$ newline$
  "        <li><a href='#' onclick=" quote$ *
  "toggleAll('" * css.prefix * "bibtex')" * quote$ *
  ">Show/hide B<span style='font-variant:small-caps;'>ib</span><span class='tex'>T<sub>e</sub>X</span> records</a></li>" * write$ newline$
  "      </ul>" write$ newline$
  "    </div>" write$ newline$
  "<!-- END BIBLET SHOWHIDE -->" write$ newline$
}

FUNCTION {begin.bib}
{
  #0 use.internal.latex2html =
    'skip$
    { "Using internal LaTeX to HTML translation: processing may take a while!" warning$ }
  if$

  % HTML header
%  "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>" write$ newline$
%  "<!-- \end{document} -->" write$ newline$
%  "<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'>" write$ newline$
%  "  <head>" write$ newline$
%  "    <title>My publications</title>" write$ newline$
%  "    <meta http-equiv='Content-Type' content='text/html;charset=utf-8' />" write$ newline$
%  "    <meta name='generator' content='BibTeX and the biblet bibliography style -- https://www.nothingisreal.com/biblet/' />" write$ newline$
%  "    <script type='text/javascript' defer='defer' src='" script.path "/" * 
%    script.showhide * url.escape * "' /></script>" * write$ newline$
%  output.links
%  "  </head>" write$ newline$
%  "  <body>" write$ newline$
%  "    <h1>My publications</h1>" write$ newline$ newline$
%  output.legend newline$
%  output.showhide newline$
  "<!-- BEGIN BIBLET BIBLIOGRAPHY -->" write$ newline$
%  "    <div class='" css.prefix * "bibliography'>" * write$ newline$
%  "        <ol class='bib-list'>" write$ newline$
  #1 'in.bibliography :=
}

EXECUTE {init.string.consts}

EXECUTE {begin.bib}

ITERATE {call.type$}

FUNCTION {end.bib}
{ %"        </ol>" write$ newline$
  %"    </div>" write$ newline$
  "<!-- END BIBLET BIBLIOGRAPHY -->" write$ newline$ newline$
  %#0 'in.bibliography :=
  %"    <div class='" css.prefix * "footer'>" * write$ newline$
  %"      <hr /><p lang='en'>Generated with B<span style='font-variant:small-caps;'>ib</span><span class='tex'>T<sub>e</sub>X</span> and the "
  %"<a href='https://www.nothingisreal.com/biblet/'>biblet</a>" *
  %" bibliography style.</p>" * write$ newline$
  %"    </div>" write$ newline$
%  "  </body>" write$ newline$
%  "</html>" write$ newline$
}

EXECUTE {end.bib}
