Title: Task Description | SemEval-2017 Shared Task on Puns
template: page_puns
save_as: semeval2017/task.html

# Task description

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

Following is a tentative description of the subtasks.

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
