title: Frequently Asked Questions
save_as: faq.html

# Frequently Asked Questions

This page compiles questions on technical issues that I am (or was)
frequently asking myself, along with the answers.

[TOC]

## Git

### How do I convert an SVN repository to Git when the SVN directory was renamed at some point in the history?

If you don't know the old directory name, do a `svn checkout` of the
new directory first and examine the log with `svn log -v`.  Next clone
the old and new directories using `git svn clone` or `svn2git`, and
add the old repository as a remote of the new repository.  Then do a
`git log` and note the oldest commit of the `master` branch, and do a
`git log old` and note the newest commit of the `old` branch.  Then
join the two branches and clean up the repository.  All together:

```bash
mkdir old-dir new-dir
cd old-dir
svn2git --notrunk --notags --nobranches --verbose old-svn-dir
cd ../new-dir
svn2git --notruck --notags --nobranches --verbose new-svn-dir
git remote add old ../old-dir
git fetch old
OLDEST_COMMIT_OF_MASTER=$(git log --format=format:%H | tail -1)
NEWEST_COMMIT_OF_OLD=$(git log --format=format:%H old/master | head -1)
git replace "$OLDEST_COMMIT_OF_MASTER" "$NEWEST_COMMIT_OF_OLD"
git filter-branch
git remote rm old
rm -rf .git/refs/replace
```

Source:
[How do I keep SVN history in Git when trunk has moved?](https://stackoverflow.com/a/24296764/906070)

### How do I delete all untracked and ignored files?

```bash
git clean -x -d --dry-run # Check the output
git clean -x -d --force
```

## Shell scripting

### How do I make sure that only one instance of a program is running?

Use a lock file:

```bash
/usr/bin/flock -n /path/to/lockfile -c /path/to/program
```

(Omit the `-n` if you want to wait rather than fail if the lock cannot
be acquired.)

### How can I sort the output of `du -h` by size?

```bash
du -h | sort -h
```

### How do I grep for non-ASCII characters?

```bash
grep --color='auto' -P -n "[\x80-\xFF]"
```

### How do I find out what GNU/Linux distribution I am using?

Try one of the following:

```bash
cat /etc/*-release
```

```bash
lsb_release -a
```

## Networking

### How can I tunnel my web browsing through an SSH connection?

First, make an SSH connection as follows:

```bash
ssh -D SOME_PORT SOME_HOST
```

Then configure your browser to use 127.0.0.1:SOME_PORT as a SOCKS v5 proxy.

### How can I launch a VPN connection on a remote host without losing my SSH connection?

Say you are connected to a remote host via SSH, and want to launch a
VPN connection on that host where the connection replaces the default
gateway.  Normally this will cause the SSH connection to hang.  To
avoid this, first add a routing rule such that connections to the SSH
client always use the original gateway:

```bash
sudo route add -host ${SSH_CLIENT%% *} gw $(/sbin/ip route | awk '/default/ { print $3 }')
```

Source: [Prevent SSH connection lost after logging into VPN on server machine](https://serverfault.com/a/649855/379227)

## Emacs

### How can I make AUCTeX ignore "mismatched" `\index` parentheses?

```elisp
(eval-after-load "latex"
  '(add-to-list 'LaTeX-verbatim-macros-with-braces "index"))
```

### How do I suppress line wrapping when formatting BibTeX entries?

```elisp
(add-hook 'bibtex-mode-hook
             (lambda () (setq fill-column 999999)))
```

### How can I teach AUCTeX about new styles and classes?

If your document uses a custom LaTeX style or class, AUCTeX won't
apply the correct style hooks.  You need to create a custom Elisp
style file specifying these hooks.  You can try having AUCTeX
automatically generate such a style file by running `M-x
TeX-auto-generate`.  You'll first be prompted for the path to the
LaTeX style or class file, and then to the AUCTeX style directory
(normally `$HOME/.emacs.d/auctex/style`) for output.  The generated
style file will have the same basename as the input file, but with a
`.el` suffix.  Open it and edit it as necessary.

## System administration

### How do I find which RPM provides a given file?

```bash
rpm -qf /path/to/file
```

### How can I install the build dependencies of a package with Zypper?

```bash
zypper si -d packagename
```

### How can I keep track of programs I install to `/usr/local`?

Certain discourteous programs do not provide an `uninstall` target in
their Makefiles.  A solution is to install these programs to a
dedicated prefix, and then use
[GNU Stow](https://www.gnu.org/software/stow/) to add symlinks to the
system directories:

```bash
./configure --prefix=/usr/local/stow/PROGRAM_NAME --libdir=/usr/local/stow/PROGRAM_NAME/lib64
make
sudo make install
cd /usr/local/stow
sudo stow PROGRAM_NAME
```

## KDE

### How can I log out of KDE remotely (or from the command line)?

```bash
qdbus org.kde.ksmserver /KSMServer logout 0 0 0
```

### How can I get applications to display dates in ISO 8601 (YYYY-MM-DD) format?

As of Plasma 5, it is no longer possible to fine-tune the system
locale settings.  For example, you cannot have KDE format currencies
according to one locale, times and dates according to another locale,
etc.  Instead you can specify only a single, global locale.

For times and dates, you can override the global locale on a
per-application basis by manually setting `LC_TIME` before launching
the application.  Unfortunately, you cannot specify a date/time format
of your own choosing, but must select from among the locales installed
on your system.  Even more unfortunately, there is no easy way of
knowing which of the locales (if any) format the date and time the way
you want.  Finding the right locale may be a matter of trial and
error.

For ISO 8601–style dates, it seems the `en_DK` locale works.  So for
example, to have Thunderbird display dates in YYYY-MM-DD format,
you can put the following script somewhere in your execution path:

```bash
#!/bin/bash
LC_TIME=en_DK exec /usr/bin/thunderbird "$@" >&/dev/null &
```

Unfortunately, the locale setting does not persist across sessions
saved and restored by `ksmserver`.

For further discussion, see
[KDE Bug 340982](https://bugs.kde.org/show_bug.cgi?id=340982).

### How can I change the height of the Application Launcher (Kickoff)?

In Plasma 5, popups such as the Application Launcher can be resized by
holding down the Alt key and dragging with the right mouse button.
Unfortunately, the new size is not persistent across logins.  (See
[KDE Bug 332512](https://bugs.kde.org/show_bug.cgi?id=332512).)

Persistently changing the size of the Application Launcher requires
changing the values of `Layout.minimumWidth` and/or
`Layout.minimumHeight` in its `FullRepresentation.qml` file, which by
default lives in
`/usr/share/plasma/plasmoids/org.kde.plasma.kickoff/contents/ui`.
Changing this file will change the Application Launcher size for all
users (which may or may not be what you want).  However, the changes
may get overwritten whenever Plasma is upgraded.

To change the size of the Application Launcher for a single user, copy
`/usr/share/plasma/plasmoids/org.kde.plasma.kickoff/` to
`$HOME/.local/share/plasma/plasmoids/org.kde.plasma.mykickoff/` and
edit the `contents/ui/FullRepresentation.qml` file in the latter
directory.

Source:
[Menu size. Resize or going to be Resizable?](https://forum.kde.org/viewtopic.php?f=289&t=128771)

## LaTeX

### How can I set the font to Times?

Once upon a time, this was done by including the package `times`,
though this failed to set Times as the math font.  Later it was
recommended to use `mathptmx`, which set Times for both the text body
and math.  But both packages are now obsolete.  The following packages
should be used instead:

```latex
\usepackage{newtxtext} % Use Times for main text
\usepackage{newtxmath} % Use Times for math
```

### How can I allow Biblatex to perform arbitrary word breaks in DOIs?

```latex
\setcounter{biburlnumpenalty}{100} % Allow breaking at numbers (for DOIs)
```

### How can I make Biblatex print a longer dash for repeated authors?

```latex
\usepackage[dashed=true]{biblatex}
\renewcommand{\bibnamedash}{\rule[3pt]{3em}{0.7pt} } % long dash for repeated authors
```

### How can I make Biblatex print a comma between the author and year in citations?

```latex
\renewcommand*{\nameyeardelim}{\addcomma\space} % comma between author and year in citations
```

### How can I make Biblatex print a thin space between author initials?

```latex
\renewrobustcmd*{\bibinitdelim}{\,} % thin space between author initials
```

### How can I make Biblatex print the ISSN for books?

```latex
\makeatletter
\@for\next:=collection,inbook,incollection,proceedings,book,inproceedings,thesis\do{%
  \xpatchbibdriver{\next}
    {{\printfield{isbn}}}
    {{\printfield{issn}\newunit\newblock\printfield{isbn}}}
    {}{}%
}
\makeatother
```

### How can I make Biblatex print volume numbers for book series?

Instead of using the `volume` field, put the volume number in the
`number` field.  Then use the following:

```latex
% Formatting of numbered series
\DeclareFieldFormat[book,inbook,collection,incollection,proceedings,inproceedings]{number}{\bibstring{volume}~#1 \bibstring{ofseries}}
\renewbibmacro*{series+number}{%
  \printfield{number}%
  \setunit*{\addspace}%
  \printfield{series}%
  \newunit%
}
```

### How can I make Biblatex print the volume and number as "volume(number)"?

```latex
% For periodicals and articles, set volume and number as "volume(number)"
\xpatchbibmacro{volume+number+eid}{%
  \setunit*{\adddot}%
}{%
}{}{}
\xpatchbibmacro{title+issuetitle}{%
  \setunit*{\adddot}%
}{%
}{}{}
\DeclareFieldFormat[article,periodical]{number}{\mkbibparens{#1}}
```

### How can I make Biblatex suppress quotation marks around article and thesis titles?

```latex
% Suppress quotation marks around article and thesis titles
\DeclareFieldFormat
  [article,inbook,incollection,inproceedings,patent,unpublished]
  {title}{#1\isdot}
\DeclareFieldFormat
  [thesis]
  {title}{\emph{#1\isdot}}
```

### How can I make Biblatex print a full long citation (including all authors)?

```latex
% Full long citations (including all authors)
\makeatletter
\newcommand{\tempmaxup}[1]{\def\blx@maxcitenames{\blx@maxbibnames}#1}
\makeatother
\DeclareCiteCommand{\longfullcite}[\tempmaxup]
  {\usebibmacro{prenote}}
  {\usedriver
     {\DeclareNameAlias{sortname}{default}}
     {\thefield{entrytype}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}
```

### How can I mark a Biber record as "data-only" so that it can be used as a source of crossref data, but not included in the bibliography?

```bibtex
options = {dataonly=true},
```

### How can I export graphics from PowerPoint or LibreOffice for use with LaTeX?

PowerPoint 2010 has the ability to export to PDF, but this works only
for entire slides.  To export a single selection, use the following
procedure:

1. Right-click on the graphic.  Select *Size and position…* →
   *Size*. Note the height and width. Press Close.
2. Copy the graphic (<kbd>Ctrl</kbd>+<kbd>C</kbd>).
3. Create a new presentation (<kbd>Ctrl</kbd>+<kbd>N</kbd>).
4. *Design* → *Page Setup*. Change the height and width to the values
   you noted previously. (You may need to add a few millimetres to
   each dimension.) Press OK.
5. Right-click on the slide and select *Paste Options: Picture*.
6. *File* → *Save & Send* → *Create PDF/XPS Document* → *Create
   PDF/XPS*.
7. Set "Save as type" to "PDF (*.pdf)". Enter a filename and press the
   "Publish" button.

The various LibreOffice programs (Draw, Impress, etc.) claim to be
able to export a selection to PDF, but
[a longstanding bug](https://bugs.documentfoundation.org/show_bug.cgi?id=40163)
prevents this from working.  Instead, they export the entire page,
much like PowerPoint 2010.  There are a number of possible
workarounds:

* Adjust the size of the page to the size of the selection, using a
  procedure similar to that for PowerPoint 2010 above.  Then export
  the page to PDF.
* Export instead to EPS.  (Recent versions of Tex Live's `pdflatex`
  automatically convert EPS to PDF.  Alternatively, the graphic can be
  manually converted with the `epstopdf` script included with TeX
  Live.)
* Export the page to PDF, then crop the PDF using a tool such as
  [BRISS](http://briss.sourceforge.net/) or
  [PDFCrop](http://pdfcrop.sourceforge.net/).

## PDFs

### How can I set the logical numbering and numbering style in a PDF?

Open the PDF file with a text editor and search for the `/Catalog`
entry.  Then append a `/Pagelabels` entry as follows:

```postscript
/PageLabels << /Nums [
0 << /P (cover) >> % labels 1st page with the string "cover"
1 << /S /r >> % numbers pages 2-6 in small roman numerals
6 << /S /D >> % numbers pages 7-x in decimal arabic numerals
]
>>
```

Note that physical pages are numbered starting from 0.

Source: [Renumber pages of a PDF](https://askubuntu.com/a/347338/374117)
