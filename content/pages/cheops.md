title: CHEOPS

# CHEOPS

<img src="{filename}/images/Cheops.png" style="float:right; width: 300px;" />
**CHEOPS** (CHEss OPponent
Simulator) is a fully-functional chess program capable of
human-vs-human, human-vs-computer, and computer-vs-computer play. It
uses a 64-square linear array board representation. The game tree search
is alpha–beta, and the static evaluation function considers material,
mobility, and motif features.

CHEOPS is written in ANSI C++ and as such should compile on any system
with a conforming C++ compiler. A standard `configure` script is
provided for Unix-like systems.

CHEOPS is [Free Software](http://www.gnu.org/philosophy/free-sw.html).
It can be freely used, modified, and distributed under the terms of the
[GNU General Public Licence](http://www.gnu.org/copyleft/gpl.html).

Obtaining CHEOPS
----------------

The latest version of CHEOPS is **1.2**, released on 2015-02-01. A list
of changes from previous versions can be found in the [change
log](http://files.nothingisreal.com/software/cheops/NEWS).

The source code and openSUSE RPMs can be found at
[<http://files.nothingisreal.com/software/cheops/>](http://files.nothingisreal.com/software/cheops/).
MD5/SHA1 hashes and OpenPGP signatures are available there too. For the
latter, you will need my [OpenPGP signing
key](/BF8A2EE4.txt).

For convenience,
[cheops.tar.bz2](http://files.nothingisreal.com/software/cheops/cheops.tar.bz2)
is always a link to the latest version.

### Third-party binaries

The following builds are produced and hosted by third parties. I take no
responsibility for them.

-   [Michael Yee](http://web.mit.edu/myee/www/) has produced a
    [UCI-enabled](/:w:Universal_Chess_Interface) build of
    **[CHEOPS 1.1 for Microsoft
    Windows](http://web.mit.edu/myee/www/chess/cheops-1.1uci.zip)**.
-   [Daniel José Queraltó](http://www.andscacs.com/) has produced a
    build of **[CHEOPS 1.2 for Microsoft
    Windows](http://www.andscacs.com/cheops_1.2/cheops_1.2.rar)**. (On
    some systems, you may need to also install Microsoft's [Visual C++
    runtime
    packages](http://www.microsoft.com/en-us/download/details.aspx?id=40784).)

Documentation
-------------

You can browse through the [online HTML
documentation](http://files.nothingisreal.com/software/cheops/cheops.html).
The source distribution includes the documention.

Screenshots
-----------

<table>
<tr><td><a href="/images/Cheops1.png"><img src="/images/Cheops1.png" width="250" style="margin-right: 1em;" /></a></td><td><a href="/images/Cheops2.png"><img src="/images/Cheops2.png" width="250" /></a></td></tr>
<tr><td>Configuring the computer opponent</td><td>Game in progress</td></tr>
</table>

Author
------

CHEOPS was conceived and written by [Tristan Miller](/).
