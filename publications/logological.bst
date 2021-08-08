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
    longest.entry.name
    in.bibliography
  }

FUNCTION {init.state.consts}
{  #0 'debug.mode :=
   #1 'use.internal.latex2html :=
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
  %   #0 in.bibliography = 'skip$ {<entry>} if$
  %   record.marker

  "Code"
  #0 in.bibliography = 'skip$ {code} if$
  record.marker
  
  "Data"
  #0 in.bibliography = 'skip$ {data} if$
  record.marker

  "Video"
  #0 in.bibliography = 'skip$ {video} if$
  record.marker

  "Appendix"
  #0 in.bibliography = 'skip$ {appendix} if$
  record.marker

  "PDF"
  #0 in.bibliography = 'skip$ {pdf} if$
  record.marker
  
  "HTML"
  #0 in.bibliography = 'skip$ {html} if$
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
  "\textunderscore"  "_"  find.replace
  "\textbackslash"  "\"  find.replace
}

FUNCTION {latex2html.3}
{
  "\textbullet"  "•"  find.replace
  "\textnumero"  "№"  find.replace
  "\copyright"  "©"  find.replace
  "\textminus"  "−"  find.replace
}

FUNCTION {latex2html.4}
{
  "\textcent"  "¢"  find.replace
  "\texteuro"  "€"  find.replace
  "\textless"  "<"  find.replace
  "\LaTeXTeX"  "(La)TeX"  find.replace
}

FUNCTION {latex2html.5}
{
  "\textbar"  "|"  find.replace
  "\textdiv"  "÷"  find.replace
  "\BibTeX"  "BibTeX"  find.replace
  "\pounds"  "£"  find.replace
}

FUNCTION {latex2html.6}
{
  "\'{\i}"  "í"  find.replace
  "\={\i}"  "ī"  find.replace
  "\LaTeX"  "LaTeX"  find.replace
  "\Thorn"  "Þ"  find.replace
  "\^{\i}"  "î"  find.replace
  "\^{\j}"  "ĵ"  find.replace
  "\`{\i}"  "ì"  find.replace
}

FUNCTION {latex2html.7}
{
}

FUNCTION {latex2html.8}
{
  "\ldots"  "…"  find.replace
  "\slash"  "/"  find.replace
  "\thorn"  "þ"  find.replace
  "\" quote$ * "{A}" *  "Ä"  find.replace
  "\" quote$ * "{E}" *  "Ë"  find.replace
  "\" quote$ * "{I}" *  "Ï"  find.replace
  "\" quote$ * "{O}" *  "Ö"  find.replace
  "\" quote$ * "{U}" *  "Ü"  find.replace
  "\" quote$ * "{Y}" *  "Ÿ"  find.replace
  "\" quote$ * "{a}" *  "ä"  find.replace
  "\" quote$ * "{e}" *  "ë"  find.replace
}

FUNCTION {latex2html.9}
{
  "\" quote$ * "{o}" *  "ö"  find.replace
  "\" quote$ * "{u}" *  "ü"  find.replace
  "\" quote$ * "{y}" *  "ÿ"  find.replace
  "\'{A}"  "Á"  find.replace
  "\'{C}"  "Ć"  find.replace
  "\'{E}"  "É"  find.replace
  "\'{I}"  "Í"  find.replace
   "\'{L}"  "Ĺ"  find.replace
  "\'{N}"  "Ń"  find.replace
  "\'{O}"  "Ó"  find.replace
  "\'{R}"  "Ŕ"  find.replace
  "\'{S}"  "Ś"  find.replace
  "\'{U}"  "Ú"  find.replace
  "\'{Y}"  "Ý"  find.replace
  "\'{Z}"  "Ź"  find.replace
  "\'{a}"  "á"  find.replace
  "\'{c}"  "ć"  find.replace
  "\'{e}"  "é"  find.replace
  "\'{g}"  "ǵ"  find.replace
  "\'{l}"  "ĺ"  find.replace
  "\'{n}"  "ń"  find.replace
  "\'{o}"  "ó"  find.replace
  "\'{r}"  "ŕ"  find.replace
  "\'{s}"  "ś"  find.replace
  "\'{u}"  "ú"  find.replace
  "\'{y}"  "ý"  find.replace
  "\'{z}"  "ź"  find.replace
  "\.{C}"  "Ċ"  find.replace
  "\.{E}"  "Ė"  find.replace
}

FUNCTION {latex2html.10}
{
  "\.{G}"  "Ġ"  find.replace
  "\.{I}"  "İ"  find.replace
  "\.{Z}"  "Ż"  find.replace
  "\.{c}"  "ċ"  find.replace
  "\.{e}"  "ė"  find.replace
  "\.{g}"  "ġ"  find.replace
  "\.{z}"  "ż"  find.replace
  "\={A}"  "Ā"  find.replace
  "\={E}"  "Ē"  find.replace
  "\={I}"  "Ī"  find.replace
  "\={O}"  "Ō"  find.replace
  "\={U}"  "Ū"  find.replace
  "\={a}"  "ā"  find.replace
  "\={e}"  "ē"  find.replace
  "\={o}"  "ō"  find.replace
  "\={u}"  "ū"  find.replace
}

FUNCTION {latex2html.11}
{
  "\H{O}"  "Ő"  find.replace
  "\H{U}"  "Ű"  find.replace
  "\H{o}"  "ő"  find.replace
  "\H{u}"  "ű"  find.replace
  "\^{A}"  "Â"  find.replace
  "\^{C}"  "Ĉ"  find.replace
  "\^{E}"  "Ê"  find.replace
  "\^{G}"  "Ĝ"  find.replace
  "\^{H}"  "Ĥ"  find.replace
  "\^{I}"  "Î"  find.replace
  "\^{J}"  "Ĵ"  find.replace
  "\^{O}"  "Ô"  find.replace
  "\^{S}"  "Ŝ"  find.replace
  "\^{U}"  "Û"  find.replace
  "\^{W}"  "Ŵ"  find.replace
  "\^{Y}"  "Ŷ"  find.replace
  "\^{a}"  "â"  find.replace
  "\^{c}"  "ĉ"  find.replace
  "\^{e}"  "ê"  find.replace
  "\^{g}"  "ĝ"  find.replace
  "\^{h}"  "ĥ"  find.replace
  "\^{o}"  "ô"  find.replace
  "\^{s}"  "ŝ"  find.replace
  "\^{u}"  "û"  find.replace
  "\^{w}"  "ŵ"  find.replace
  "\^{y}"  "ŷ"  find.replace
  "\`{A}"  "À"  find.replace
  "\`{E}"  "È"  find.replace
  "\`{I}"  "Ì"  find.replace
}

FUNCTION {latex2html.12}
{
  "\`{O}"  "Ò"  find.replace
  "\`{U}"  "Ù"  find.replace
  "\`{a}"  "à"  find.replace
  "\`{e}"  "è"  find.replace
  "\`{o}"  "ò"  find.replace
  "\`{u}"  "ù"  find.replace
  "\cent"  "¢"  find.replace
  "\c{C}"  "Ç"  find.replace
}

FUNCTION {latex2html.13}
{
  "\c{G}"  "Ģ"  find.replace
  "\c{K}"  "Ķ"  find.replace
  "\c{L}"  "Ļ"  find.replace
  "\c{N}"  "Ņ"  find.replace
  "\c{R}"  "Ŗ"  find.replace
  "\c{S}"  "Ş"  find.replace
  "\c{T}"  "Ţ"  find.replace
  "\c{c}"  "ç"  find.replace
  "\c{k}"  "ķ"  find.replace
  "\c{l}"  "ļ"  find.replace
  "\c{n}"  "ņ"  find.replace
  "\c{r}"  "ŗ"  find.replace
  "\c{s}"  "ş"  find.replace
  "\c{t}"  "ţ"  find.replace
  "\k{A}"  "Ą"  find.replace
  "\k{E}"  "Ę"  find.replace
  "\k{I}"  "Į"  find.replace
  "\k{U}"  "Ų"  find.replace
  "\k{a}"  "ą"  find.replace
  "\k{e}"  "ę"  find.replace
  "\k{i}"  "į"  find.replace
  "\k{u}"  "ų"  find.replace
  "\r{U}"  "Ů"  find.replace
  "\r{u}"  "ů"  find.replace
  "\u{A}"  "Ă"  find.replace
  "\u{G}"  "Ğ"  find.replace
  "\u{U}"  "Ŭ"  find.replace
  "\u{a}"  "ă"  find.replace
  "\u{g}"  "ğ"  find.replace
}

FUNCTION {latex2html.14}
{
  "\u{u}"  "ŭ"  find.replace
  "\v{C}"  "Č"  find.replace
  "\v{D}"  "Ď"  find.replace
  "\v{E}"  "Ě"  find.replace
  "\v{L}"  "Ľ"  find.replace
  "\v{N}"  "Ň"  find.replace
  "\v{R}"  "Ř"  find.replace
  "\v{S}"  "Š"  find.replace
  "\v{T}"  "Ť"  find.replace
  "\v{Z}"  "Ž"  find.replace
  "\v{c}"  "č"  find.replace
  "\v{d}"  "ď"  find.replace
  "\v{e}"  "ě"  find.replace
  "\v{l}"  "ľ"  find.replace
  "\v{n}"  "ň"  find.replace
  "\v{r}"  "ř"  find.replace
  "\v{s}"  "š"  find.replace
  "\v{t}"  "ť"  find.replace
  "\v{z}"  "ž"  find.replace
  "\~{A}"  "Ã"  find.replace
  "\~{I}"  "Ĩ"  find.replace
  "\~{N}"  "Ñ"  find.replace
  "\~{O}"  "Õ"  find.replace
  "\~{U}"  "Ũ"  find.replace
  "\~{a}"  "ã"  find.replace
  "\~{n}"  "ñ"  find.replace
  "\~{o}"  "õ"  find.replace
  "\~{u}"  "ũ"  find.replace
  "\TeX"  "TeX"  find.replace
}

FUNCTION {latex2html.15}
{
  "---"  "—"  find.replace
  "\@."  "."  find.replace
  "\AA"  "Å"  find.replace
  "\AA"  "Å"  find.replace
  "\AE"  "Æ"  find.replace
  "\DH"  "Ð"  find.replace
  "\DJ"  "Đ"  find.replace
  "\NG"  "Ŋ"  find.replace
  "\OE"  "Œ"  find.replace
  "\TH"  "Þ"  find.replace
  "\aa"  "å"  find.replace
  "\ae"  "æ"  find.replace
  "\dh"  "ð"  find.replace
  "\dj"  "đ"  find.replace
  "\ng"  "ŋ"  find.replace
  "\oe"  "œ"  find.replace
}

FUNCTION {latex2html.16}
{
  "\ss"  "ß"  find.replace
  "\th"  "þ"  find.replace
  "\@ "  " "  find.replace
  "\ "  " "  find.replace
  "!`"  "¡"  find.replace
  "!!"  "‼"  find.replace
  "''"  "”"  find.replace
  ",,"  "„"  find.replace
  "--"  "–"  find.replace
  "?`"  "¿"  find.replace
  "\#"  "#"  find.replace
  "\$"  "$"  find.replace
  "\%"  "%"  find.replace
  "\&"  "&"  find.replace
  "\-"  ""  find.replace
  "\L"  "Ł"  find.replace
  "\O"  "Ø"  find.replace
  "\P"  "¶"  find.replace
  "\S"  "§"  find.replace
  "\_"  "_"  find.replace
  "\i"  "ı"  find.replace
  "\l"  "ł"  find.replace
  "\o"  "ø"  find.replace
  "\{"  "{"  find.replace
  "\}"  "}"  find.replace
  "``"  "“"  find.replace
  "`"  "‘"  find.replace
  "~"  " "  find.replace
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

FUNCTION {output.nonnull}
{ latex2html
  's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
	{ add.period$ write$
	  in.span #0 >
	    { 
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
	        {
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

INTEGERS {first.icon}
FUNCTION {output.icons}
{ get.icon.data
  { record.marker = }
    { duplicate$ missing$
        { pop$ pop$ }
        {
	  "=> " swap$ url.escape * write$
	  "	" swap$ * write$
	  newline$
        }
      if$
    }
  while$
}

FUNCTION {output.bibitem}
{
  ""
  before.all 'output.state :=
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
    { "{" s * "}" * }
  if$
}

INTEGERS {j}
FUNCTION {output.entry}
{ duplicate$
  missing$
    {pop$ pop$}
    { 's :=
      't :=
      t write$
      longest.entry.name t string.length - 'j :=
      {j #0 >}
        { j #1 - 'j :=
          " " write$
        }
      while$
      t "month" =
        'format.abbreviated.month
         { "{" s * "}" * }
      if$
      newline$
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

FUNCTION {fin.entry}
{ add.period$ 
  write$
  newline$
  output.icons
  newline$
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
		{ " et al." * }
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
    { #1 in.span + 'in.span :=
      author format.names 
    }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { #1 in.span + 'in.span :=
      ""
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
    { new.block "DOI: " doi * }
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
    { booktitle }
    { booktitle }
  if$
}

FUNCTION {format.jtitle.link}
{ "" 'link :=
  bookurl empty$
    { journal }
    { journal }
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
    { title "t" change.case$ }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { #1 in.span + 'in.span :=
      ""
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
  title
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { " " }
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
	{ "In " format.editors * ", " * format.btitle.link *
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
  " [" * crossref * "]" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " et al." * }
    { #2 <
	'skip$
	{ editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
	    { " et al." * }
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
	    { series }
	  if$
	}
	{ key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " [" * crossref * "]" *
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
  " [" * crossref * "]" *
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.jtitle.link "journal" output.check
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
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
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
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
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

FUNCTION {begin.bib}
{
  #0 use.internal.latex2html =
    'skip$
    { "Using internal LaTeX to HTML translation: processing may take a while!" warning$ }
  if$

  #1 'in.bibliography :=
}

EXECUTE {init.string.consts}

EXECUTE {begin.bib}

ITERATE {call.type$}
