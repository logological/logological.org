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

```
cat /etc/*-release
```

```
lsb_release -a
```

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

### How can I get Biblatex to print a longer dash for repeated authors?

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
