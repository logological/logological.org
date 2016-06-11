Title: GPP

# GPP

GPP is a general-purpose preprocessor with customizable syntax, suitable
for a wide range of preprocessing tasks. Its independence from any one
programming language makes it much more versatile than the C
preprocessor (cpp), while its syntax is lighter and more flexible than
that of [GNU m4](http://www.gnu.org/software/m4/). There are built-in
macros for use with C/C++, LaTeX, HTML, XHTML, and Prolog files.

GPP is [Free Software](http://www.gnu.org/philosophy/free-sw.html). It
is distributed under the terms of the [GNU General Public
Licence](http://www.gnu.org/copyleft/gpl.html).

Downloading
-----------

The latest version of GPP is **2.24**, released on 2004-09-19. A list of
changes from previous versions can be found in the [change
log](http://files.nothingisreal.com/software/gpp/NEWS).

**NOTE:** GPP 2.1a is an incompletely documented and dead branch of the
GPP development tree. Most of the differences from the previous version,
2.1, are internal changes to speed up performance when processing
particularly complicated macros. These changes will probably eventually
be merged with the main development tree (version 2.12 and beyond).

Unless you are using very tricky macros and are particularly concerned
about execution speed, you would probably be better off with one of the
stable, current releases.

### Source code

The source code can be found at
[<http://files.nothingisreal.com/software/gpp/>](http://files.nothingisreal.com/software/gpp/).
MD5/SHA1 hashes and PGP signatures are available there too. For the
latter, you will need my [OpenPGP signing
key](/:Media:EFBF4915.txt).

For convenience,
[gpp.tar.bz2](http://files.nothingisreal.com/software/gpp/gpp.tar.bz2)
is always a link to the latest version.

### Ports and binary packages

#### RPMs

#### Debian GNU/Linux

A [GPP package for Debian GNU/Linux](http://packages.debian.org/gpp) has
been created by [Lucas Wall](http://www.kadath.com.ar/). Debian users
can obtain and install this package the same way they do for any other
Debian package.

#### FreeBSD

A [FreeBSD port of GPP](http://www.freshports.org/textproc/gpp/) is
available from [FreshPorts](http://www.freshports.org).

#### Darwin, Mac OS X

A [GPP portfile for Darwin/Mac OS
X](http://darwinports.opendarwin.org/darwinports/dports/lang/gpp/Portfile)
is available at the [DarwinPorts](http://darwinports.opendarwin.org/)
website. See also [How To Install GPP on Mac OS
X](http://gpp.darwinports.com/) for an installation guide.

Documentation
-------------

You can browse through the [online HTML
documentation](http://files.nothingisreal.com/software/gpp/gpp.html).
The source distribution includes the documention as an HTML file, man
page, and LaTeX document.

Authors
-------

GPP was originally written by [Denis
Auroux](http://www-math.mit.edu/~auroux/). Since version 2.12 it has
been maintained by [Tristan Miller](/)
\<<psychonaut@nothingisreal.com>\>.