title: DELORES

# DELORES

**DELORES** (DEfeasible LOgic REasoning System) is a
forward-chaining reasoning engine for defeasible logic, a less
expressive but more efficient nonmonotonic logic. In contrast with most
other nonmonotonic logics, defeasible logic has linear complexity,
allowing DELORES to execute large theories very quickly. DELORES's
algorithm extends to general defeasible theories through the use of a
preprocessing transformation which eliminates all uses of defeaters and
superiority relations. The transformation was designed to provide
incremental transformation of defeasible theories, and systematically
uses new atoms and new defeasible rules to simulate the eliminated
features.

DELORES is [Free Software](http://www.gnu.org/philosophy/free-sw.html).
It is distributed under the terms of the [GNU General Public
Licence](http://www.gnu.org/copyleft/gpl.html).

Obtaining DELORES
-----------------

The latest version of DELORES is **0.91**, released on 2003-12-18. A
list of changes from previous versions can be found in the [change
log](http://files.nothingisreal.com/software/delores/NEWS).

DELORES is distributed as C source code only, and is available at
[<http://files.nothingisreal.com/software/delores/>](http://files.nothingisreal.com/software/delores/).
MD5/SHA1 hashes and PGP signatures are available there too. For the
latter, you will need my [OpenPGP signing
key](/:Media:EFBF4915.txt).

For convenience,
[delores.tar.bz2](http://files.nothingisreal.com/software/delores/delores.tar.bz2)
is always a link to the latest version.

Documentation
-------------

The distribution includes a Unix man page plus a Programmer's Guide (in
LaTeX, DVI, and PDF formats). You can also read the [online HTML
documentation](http://files.nothingisreal.com/software/delores/delores.html).

For more information on DELORES and defeasible logic, please visit
[Michael Maher's publications
page](https://www.unsw.adfa.edu.au/australian-centre-for-cyber-security/associate-professor-michael-maher).

Authors
-------

DELORES was originally conceived by [Michael
Maher](https://www.unsw.adfa.edu.au/australian-centre-for-cyber-security/associate-professor-michael-maher) and implemented by [Tristan
Miller](/). Development of DELORES was
supported by the Australian Research Council under grant A49803544.

Please report bugs to [Tristan
Miller](mailto:psychonaut@nothingisreal.com).
