Title: SemEval-2017 Shared Task: Detection and Interpretation of English Puns
template: page_nomenu
save_as: puns.html

# SemEval-2017 Shared Task:<br />Detection and Interpretation of English Puns

Word sense disambiguation (WSD), the task of identifying a word's
meaning in context, has long been recognized as an important task in
computational linguistics.  Traditional approaches to WSD rest on the
assumption that there is a single, unambiguous communicative intention
underlying each word in the document. However, there exists a class of
language constructs known as *puns*, in which lexical-semantic
ambiguity is a *deliberate* effect of the communication act.  That is,
the speaker or writer intends for a certain word or other lexical item
to be interpreted as simultaneously carrying two or more separate
meanings.  Though puns are a recurrent and expected feature in many
discourse types, they have attracted relatively little attention in
the fields of computational linguistics and natural language
processing in general, or WSD in particular.


## Background

A pun is a form of wordplay in which one signifier (*e.g.,* a word or
phrase) suggests two or more meanings by exploiting polysemy, or
phonological similarity to another signifier, for an intended humorous
or rhetorical effect.  For example, the first of the following two
punning jokes exploits contrasting meanings of the word "interest",
while the second exploits the sound similarity between the surface
form "propane" and the latent target "profane":

> I used to be a banker but I lost interest.

> When the church bought gas for their annual barbecue, proceeds went from the sacred to the propane.

Puns where the two meanings share the same pronunciation are known as
*homophonic* or *perfect*, while those relying on similar- but not
identical-sounding signs are known as *heterophonic* or *imperfect*.
Where the signs are considered as written rather than spoken
sequences, a similar distinction can be made between *homographic* and
*heterographic* puns.

Conscious or tacit linguistic knowledge – particularly of lexical
semantics and phonology – is an essential prerequisite for the
production and interpretation of puns.  This has long made them an
attractive subject of study in theoretical linguistics, and has led to
a small but growing body of research into puns in computational
linguistics.  Most computational treatments of puns to date, however,
have focused on generational algorithms or modelling their
phonological properties.


## Task summary

A shared task on the computational detection and interpretation of
English puns will occur as part of the SemEval-2017 workshop, to be
held in conjunction with a major NLP conference (TBA) in the summer of
2017.  Following is a tentative description of the subtasks.

Participants will be provided with two data sets.  The first data set
will contain several thousand short contexts (jokes, slogans,
aphorisms, *etc.*). In some of these contexts, a single word will be
used as a homographic pun; in the rest, there will be no pun.  The
second data set will be similar to the first, except that the puns
will be heterographic rather than homographic.  For one or both data
sets, participating systems will compete in any or all of four
subtasks, in three consecutive evaluation phases:

<dl>
<dt>Phase A.</dt><dd>In this phase, participants are given an entire raw data set.</dd>
<dl>
<dt>Subtask 1: Coarse-grained pun detection.</dt><dd>For each context, the system must decide whether or not it contains a pun.</dd>
<dt>Subtask 2: Fine-grained pun detection.</dt><dd>For each context, the system must decide which one word (if any) is the pun.</dd>
</dl>
<dt>Phase B.</dt><dd>In this phase, the contexts not containing puns are removed from the data set.</dd>
  <dl>
  <dt>Subtask 3: Pun location.</dt><dd>For each context, the system must identify which word is the pun.</dd>
  </dl>
<dt>Phase C.</dt><dd>In this phase, the pun word in each context is marked, and contexts where the pun's two meanings are not found in WordNet are removed from the data set.</dd>
  <dl>
  <dt>Subtask 4: Pun interpretation.</dt><dd>For each context, the system must annotate the two meanings of the given pun by reference to WordNet sense keys.</dd>
  </dl>
</dl>


## Data and resources

Our first data set, containing English homographic puns, is the one
described by Miller & Turković (2016) and Miller (2016).  It contains
punning and non-punning jokes, aphorisms, and other short texts
sourced from professional humorists and online collections, and is
licensed under the Creative Commons Attribution-Noncommercial (CC
BY-NC) licence.  The second data set of heterographic puns is
currently under construction.  Both data sets will be provided in an
XML format similar to that used in previous Senseval/SemEval WSD
tasks.

For Subtask 4, participants must apply senses from version 3.1 of
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


## Organizers

SemEval is an ongoing series of evaluations of computational semantic
analysis systems, organized under the aegis of
[SIGLEX](http://www.siglex.org/), the Special Interest Group on the
Lexicon of the [Association for Computational
Linguistics](http://www.aclweb.org/).

The organizers of the SemEval-2017 shared task on the detection and
interpretation of English puns are:

* **[Tristan Miller](https://logological.org)**, [Ubiquitous Knowledge Processing Lab](https://www.ukp.tu-darmstadt.de/), [Technische Universität Darmstadt](https://www.tu-darmstadt.de/)
* **[Christian F. Hempelmann](http://www.kikihempelmann.com/)**, [Ontological Semantic Technology Lab](http://www.tamuc.edu/ontology), [Texas A&M University-Commerce](http://www.tamuc.edu/)
* **[Iryna Gurevych](https://www.ukp.tu-darmstadt.de/people/group-heads/prof-dr-iryna-gurevych/)**, [Ubiquitous Knowledge Processing Lab](https://www.ukp.tu-darmstadt.de/), [Technische Universität Darmstadt](https://www.tu-darmstadt.de/)

To contact the organizers, please write to [Tristan Miller](mailto:miller@ukp.informatik.tu-darmstadt.de).

## References

* Hempelmann, Christian F. (2003). “Paronomasic Puns: Target Recoverability Towards Automatic Generation”. Ph.D. thesis. West Lafayette, IN: Purdue University, Aug. 2003.
* Knuth, Donald E. (1973). *The Art of Computer Programming*. Vol. 3. Addison-Wesley. ISBN: 978-0-201-03803-3.
* Kondrak, Grzegorz (2002). “Algorithms for Language Reconstruction”. Ph.D. thesis. University of Toronto.
* Kondrak, Grzegorz and Tarek Sherif (2006). “Evaluation of Several Phonetic Similarity Algorithms on the Task of Cognate Identification”. In: *Proceedings of the COLING-ACL Workshop on Linguistic Distances*. July 2006, pp. 43–50.
* Miller, Tristan (2016). “Adjusting Sense Representations for Word Sense Disambiguation and Automatic Pun Interpretation”. Dr.-Ing. thesis. Department of Computer Science, Technische Universität Darmstadt.
* Miller, Tristan and Iryna Gurevych (2015). “Automatic Disambiguation of English Puns”. In: *The 53rd Annual Meeting of the Association for Computational Linguistics and the 7th International Joint Conference on Natural Language Processing of the Asian Federation of Natural Language Processing: Proceedings of the Conference (ACL–IJCNLP)*. Vol. 1. Stroudsburg, PA: Association for Computational Linguistics, July 2015, pp. 719–729. ISBN: 978-1-941643-72-3.
* Miller, Tristan and Mladen Turković (2016). “Towards the Automatic Detection and Identification of English Puns”. In: *European Journal of Humour Research* 4.1 (Jan. 2016), pp. 59–75. ISSN: 2307-700X.
* Philips, Lawrence (1990). “Hanging on the Metaphone”. In: *Computer Language* 7.12 (Dec. 1990).
