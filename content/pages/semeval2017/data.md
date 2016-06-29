Title: Data and Resources | SemEval-2017 Shared Task on Puns
template: page_puns
save_as: semeval2017/data.html

# Data and resources

Our first data set, containing English homographic puns, is the one
described by Miller & Turković (2016) and Miller (2016).  It contains
punning and non-punning jokes, aphorisms, and other short texts
sourced from professional humorists and online collections, and is
licensed under the Creative Commons Attribution-Noncommercial (CC
BY-NC) licence.  The second data set of heterographic puns is
currently under construction.  Both data sets will be provided in an
XML format similar to that used in previous Senseval/SemEval WSD
tasks.

For Subtask 3, participants must apply senses from version 3.1 of
[WordNet](https://wordnet.princeton.edu/), an electronic semantic
network.  However, they are not limited to the use of WordNet for this
subtask, nor for any other subtasks.  For all subtasks involving the
second data set, participants may wish to make additional use of
lexical-semantic resources that include pronunciation information,
such as [Wiktionary](https://www.wiktionary.org/) or the [CMU
Pronouncing Dictionary](http://www.speech.cs.cmu.edu/cgi-bin/cmudict).
This is because heterographic puns present an additional challenge to
the interpretation process; in these puns the target (second meaning)
has a different spelling and, usually, a different yet
similar-sounding pronunciation.

Computational recovery of the target lexeme must be achieved not only
via computational lexical semantics but through the application of
some computational model of sound similarity.  Implementations of
general-purpose sound similarity models such as Soundex (Knuth,
1973:391–392) and Metaphone (Philips, 1990) are already widely
available. Participants may alternatively wish to avail themselves of
more sophisticated models developed for use with computational
detection of cognates, surveys of which can be found in Kondrak (2002)
and Kondrak & Sherif (2006), or with puns (Hempelmann, 2003).
Machine-readable data for implementing Hempelmann's pun-based model of
sound similarity will be made freely available to participants.

## Download

* Trial data will be available for download soon.  Test data will not
  be released until the evaluation begins.
