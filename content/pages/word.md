Title: Please don't send me Microsoft Word documents
slug: word

# Please don't send me Microsoft Word documents

Most likely you have been directed to this document because you have
attempted to e-mail me a document in Microsoft Word format. I would like
to explain to you why I am probably not able to access this document,
why you should reconsider sending Word documents to people, and what
better alternatives are available for document exchange over the
Internet.

## Why it's a bad idea to send Microsoft Word documents

Microsoft Word documents cannot always be read by other word processors.
:   The specification for Microsoft Word documents is a closely-guarded
    secret, and as such only software from Microsoft is capable of
    reading Word files correctly. People who use other word processors,
    either by choice or by necessity, may be unable to open Word
    documents. It is unfair to assume that everyone to whom you send a
    Word document has Microsoft Word, or to expect them to buy it in
    order to read your document. In fact, Microsoft has deliberately
    decided *not* to publish versions of its word processor for many of
    the world's most popular operating systems, so buying the software
    is not even an option for many people.
:   In 2008, the latest version of the Microsoft Word file format,
    Office Open XML (OOXML), was published as an official standard by
    the international standards body ISO. In theory this will allow the
    developers of other word processors to update their software to work
    with these newer OOXML Word files. However, there are a number of
    technical and legal problems, and defects in the standard itself,
    which make this difficult or impossible. (In fact, even the current
    version of Microsoft Word itself does not fully support the OOXML
    standard.) For this reason OOXML cannot be seen as a solution to the
    problem of interoperability; OOXML is also subject to most of the
    same problems described later in this document.
Documents produced with one version of Microsoft Word cannot always be read by other versions of Microsoft Word.
:   Even if the person to whom you are sending a Word document does
    indeed have Microsoft Word, he or she *still* might be unable to
    read it. Because the Word file format is not standard and fixed,
    Microsoft can, and in fact often does, change it from time to time.
    As a result, documents saved with one version of Word often cannot
    be opened with previous versions of Word. Many people believe that
    Microsoft does this in an effort to force users of old versions to
    buy the latest version, even when they are otherwise content with
    the older version and have no reason to "upgrade".
Microsoft Word documents are not guaranteed to look and print the same way on every computer and printer.
:   Contrary to what you might expect from Word's supposedly WYSIWYG
    ("What You See Is What You Get") interface, a document produced with
    Word on one computer may, in fact, end up with radically different
    formatting and pagination even when viewed with the *same* version
    of Word on another computer! The reason for this is that Microsoft
    Word will silently reformat a document based on the user's printer
    settings. This is bad news for certain kinds of documents, such as
    forms, which rely on elements precisely positioned on a page.
Microsoft Word documents are extremely large compared to other file formats.
:   The Word file format is bloated and inefficient; documents are often
    many orders of magnitude larger than the amount of text they
    contain. Even in today's age of ample hard drives, a large
    collection of Microsoft Word files can quickly eat up one's
    available disk space. For the millions of people who still use
    telephone dialup for their Internet connection, receiving Word files
    in e-mail can mean minutes to hours of waiting for the documents to
    download. Compare this to the mere seconds it would take to transfer
    the equivalent amount of information as plain text.
Sending Microsoft Word files can violate your privacy.
:   Microsoft Word is often configured by default to automatically track
    and record changes you make to a document. What many people do not
    realize is that this record of changes is actually silently embedded
    *in the file* every time you save your document. When you send such
    a document to a third party, it is a trivial matter for them to
    recover this log and see how the document appeared several revisions
    ago. Thus compromising or confidential information you *thought* you
    removed from a document before sending it may in fact still be
    accessible to the recipient. Indeed, there have been at least a few
    high-profile cases of confidential information being leaked via
    publically-posted Word documents.
Microsoft Word files are a security hazard.
:   Unlike standard data formats, Word files can contain programming
    code which can be executed by your computer automatically when the
    document is opened. Microsoft's motivation for including this
    "feature" in Word was to allow word processing macros to be saved
    along with the document. However, it was not long before malicious
    people began exploiting this design flaw by writing Word macro code
    to surreptitiously delete random files or otherwise damage one's
    computer. As a result, Word files are now notorious as the vector
    for dozens of computer viruses. When you receive a Word attachment
    by e-mail, do you really want to take the risk of welcoming a
    proverbial (and in computing terms, literal) Trojan horse into your
    system?

Most of the preceding arguments apply not only to Microsoft Word, but
also to other proprietary word processors, such as WordPerfect. However,
Word attachments in particular are rapidly and unfortunately becoming
more and more popular among Internet users, most of whom do not realize
the problems they cause. Fortunately, the problem of sending proprietary
file formats is not difficult to work around, and does not require you
to stop using Microsoft Word.

Alternatives to sending Word files
----------------------------------

Plain text
:   Unless your document actually *requires* special fonts or
    formatting, consider simply typing it (or copy-and-pasting it)
    directly into the e-mail you are sending. This way nobody needs to
    open up a separate program to read your document.
HTML
:   HTML is a text-based format commonly used for writing web pages and
    other electronic documents. Its ability to be edited and its status
    as an open standard make it ideal for document exchange. HTML
    documents are not intended to be displayed exactly the same way on
    every system, though, so if the physical page layout is important,
    consider sending a Postscript, PDF, or RTF file instead.
Postscript or PDF (Adobe Acrobat)
:   If you are sending a document which has extensive formatting and is
    intended to be printed out, and which you do not expect the
    recipient to have to or want to modify, consider sending a
    Postscript or PDF file. These two file formats are fully and
    publically documented, and programs to read them are widely
    available for a variety of computing platforms. Unlike with
    Microsoft Word files, Postscript and PDF files will always display
    exactly the same on the recipient's system as on yours. One
    important caveat with these file formats, though, is that they are
    "read only"; there's no easy way for the recipient to edit the
    documents himself.
Rich Text Format (RTF)
:   In cases where the document makes use of special formatting and you
    expect the recipient to edit it, you may wish to send a Rich Text
    (RTF) file instead of a Word file. RTF was developed as a standard
    data interchange format for word processors, and most popular word
    processors can read and write such files. RTF may not preserve
    physical formatting exactly, but unlike with HTML, it at least tries
    to specify physical presentation rather than leaving it entirely up
    to the recipient's application.
OpenDocument Format (ODF)
:   OpenDocument is another standard data interchange format. First
    published in 2006, it is a much newer and more modern specification
    than RTF, and as such supports a wider range of formatting styles
    and techniques. It also has the advantage of being adopted as an
    official international standard by ISO. Most modern word processors
    (with the notable exception of Microsoft Word) support the
    OpenDocument standard.

### Converting Word documents to other formats

Converting your Word documents to one of the above formats is easy. In
many cases, you can simply use the **Save As** command from the **File**
menu; somewhere in the dialog window that appears will be a drop-down
box allowing you to select the file format.

If you want to send a document as plain text, a quick alternative to
resaving it is to simply select the document text with the mouse cursor
or with **Edit**→**Select All**, copy it to the clipboard
(**Edit**→**Copy**), and then paste it into an e-mail in your mail
program (**Edit**→**Paste**).

PDF and Postscript are not typically in the list of formats Microsoft
Word can export to. However, some systems are configured to allow you to
produce PDF files through the **Print** command. To see if your system
supports this, activate the **Print** command from the **File** menu and
look through the list of available printers for one whose name indicates
it produces PDF or Acrobat files.

*You* can help put an end to Word attachments
---------------------------------------------

Besides not sending them yourself, you can spare others the grief of
dealing with proprietary document formats by encouraging people not to
send them to you. If you receive a Word attachment in your e-mail,
please send the sender a politely worded reply indicating why Word
attachments are inappropriate and requesting the document in an
alternative format. So as not to waste the sender's time, keep the
message brief, but include the address of a web page where they can
receive a fuller explanation if they wish. Feel free to cite this
document, or one of the ones I've listed below; you could even write up
and then refer to a helpful web page containing an explanation in your
own words. (Take care, however, that your write-up is suitable for a
non-technical audience.)

Related documents
-----------------

For the same or similar reasons, many other people cannot or will not
accept Word attachments. Here are links to the explanations some of them
have also posted:

-   [MS-Word is *not* a document exchange
    format](http://www.goldmark.org./netrants/no-word/attach.html) by
    [Jeff Goldberg](http://www.goldmark.org/jeff/)
-   [Don't send Microsoft Word documents to
    me](http://homepages.tesco.net/~J.deBoynePollard/FGA/dont-send-word-documents.html)
    by [Jonathan de Boyne
    Pollard](http://homepages.tesco.net/~J.deBoynePollard/)
-   [We can put an end to Word
    attachments](https://www.gnu.org/philosophy/no-word-attachments.html)
    by [Richard Stallman](http://www.stallman.org/) of the [Free
    Software Foundation](http://www.fsf.org/)
-   [Avoid e-mail attachments, especially Microsoft
    Word](http://bcn.boulder.co.us/~neal/attachments.html) by [Neal
    McBurnett](http://bcn.boulder.co.us/~neal/)
-   [Attachments in proprietary formats considered
    harmful](http://www.cse.unsw.edu.au/~chak/email.html) by [Manuel
    Chakravarty](http://www.cse.unsw.edu.au/~chak/)

## Aside: the problem with word processors in general

The purpose of this article is not to promote the use of any one word
processor over another, but rather to promote the use of standardized,
efficient formats for exchange of written information. To that end,
please consider dispensing with word processors altogether as a means of
producing written communication. An inherent problem with the word
processor paradigm is that it conflates the tasks of *composition*
(fixing one's ideas into words in a logically and semantically
structured document) and *typesetting* (determining the superficial
physical appearance of a document, via, for example, margin and font
settings). This lack of distinction is a cause or contributing factor to
many of the problems discussed in this article, along with a great
number of problems not related to the exchange of documents over the
Internet.

Fortunately, there exist a number alternative document preparation
systems which enforce a healthy separation between composition and
typesetting. Most of these systems are unencumbered by the problems of
proprietary file formats, and can produce output in a variety of
standard formats such as PDF and HTML.

For more information on the problems of the word processor and WYSIWYG
paradigms:

-   [Word processors: stupid and
    inefficient](http://www.ecn.wfu.edu/~cottrell/wp.html) by [Allin
    Cottrell](http://www.wfu.edu/~cottrell/)
-   [What has WYSIWYG done to
    us?](http://www.conradiator.com/downloads/pdf/WhatHasWYSIWYG_done2us.pdf)
    by [Conrad Taylor](http://www.conradiator.com/)

Here are links to some
[Free](https://www.gnu.org/philosophy/free-sw.html) document preparation
programs which do not use the word processing paradigm:

-   [LaTeX](http://www.latex-project.org/) is extremely popular among
    authors of technical and scientific documents, though it can be used
    for almost any form of publishing. It does not include a graphical
    interface, which you may find either liberating or daunting. There
    are commercial and non-commercial LaTeX versions available for all
    popular computing platforms, including MS-Windows, Mac OS,
    GNU/Linux, and Unix.
-   [LyX](http://www.lyx.org/) is a document processor similar to LaTeX,
    but with a user-friendly graphical WYSIWYM ("What You See Is What
    You Mean") interface. It was originally developed for Unix-like
    systems, but has been ported to MS-Windows and OS/2.
-   [TeXmacs](http://www.texmacs.org/) is a graphical scientific editor
    for Unix-like systems (including MS-Windows with the Cygwin
    environment). It integrates well with many existing toolkits for
    mathematics, statistics, and physics.
-   [DocBook](http://www.dpawson.co.uk/docbook/reference.html) provides
    a system for writing structured documents using SGML or XML. It
    enjoys considerable popularity among print book publishers, authors
    of software documentation, and writers of FAQs and other technical
    websites.
-   [ConTeXt](http://www.pragma-ade.com/) is a text-based document
    preparation system similar to LaTeX.

## Translations of this page

-   [请不要给我发送微软Word文档](http://ppip.nk.googlepages.com/no-word)
    (Chinese version by ppip)


<div class="cite">
A version of this article appears in the following publication:

<ol class='bib-list'>
<li class='bib-bibitem' id='cite-miller2006please'>
<div class='bib-cover-container'><img class='bib-cover'
src='https://files.nothingisreal.com/publications/Tristan_Miller/covers/nonj200609.png'
/></div>
<div class='bib-article'>
<p><span class='bib-author'>Tristan Miller.</span>
<span class='bib-title'><a
href='http://news.gilbert.org/Pub/NONJournal/200609'>Please don't send me
Microsoft Word documents</a>.</span>
<span class='bib-journaltitle'>Nonprofit Online News Journal</span>, pages
66&ndash;71, September 2006.
ISSN 1545-1437.</p>
</div></li>
</ol>
</div>

