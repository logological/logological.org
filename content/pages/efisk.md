Title: eFISK

# eFISK: Eine aufmerksamkeitsbasierte Schlüsselwort-Extraktions- und Information Retrieval-Maschine

## Einleitung

Die Suche nach Informationen in Texten ist eine Problemstellung, die
im Information-Retrieval (IR) untersucht und von einer klassischen
Aufgabenstellung dominiert wird: Ein Nutzer stellt ad-hoc eine
Suchanfrage und möchte als Antwort möglichst alle relevanten Dokumente
einer Kollektion erhalten.  Während die Präzision der bestehenden
Systeme über Jahre hinweg nicht wesentlich zu steigern war, ermöglicht
die Einbeziehung multi-modaler Interaktionen in den Suchprozess, wie
z.B. gestisches und visuelles Feedback, inzwischen eine Verbesserung
der Ergebnisse.

Ziel von eFISK war die Entwicklung eines Systems, das beim Lesen
automatisch jene Wörter und Passagen identifiziert, die für den Leser
von besonderem Interesse sind. Die extrahierten Schlüsselwörter werden
dann in einem Information-Retrieval System dazu benutzt, Dokumente zu
identifizieren, die ähnliche Schlüsselwort-Konstellationen aufweisen
und deshalb für den Leser interessant sein könnten. Im Gegensatz zu
traditionellen IR-Techniken, die Dokumente ausschließlich auf
Grundlage der verwendeten Terminologie miteinander vergleichen,
berücksichtigt eFISK zusätzlich die unterschiedlichen Gewichtungen,
die der Nutzer durch seine Aufmerksamkeitsverteilung implizit
bestimmten Wörtern und Textpassagen zuweist. Hierzu werden mithilfe
einer auf dem Schreibtisch platzierten Infrarot-Kamera die
Augenbewegungen erfasst und zeitnah unterschiedliche Parameter wie
Blickrichtung, Pupillengröße und Verweildauer ermittelt. Nachdem man
aus der psycholinguistischen Theorie weiß, dass _Fixierungen_ (Blicke,
die über einen längeren Zeitraum an einer Position verweilen) mit
erhöhter Aufmerksamkeit und Konzentration einhergehen, lassen sich
anhand dieser Daten die maßgeblichen Wörter und Übergänge
erschließen. Das Durchblättern und Überfliegen von Sequenzen ist
demgegenüber durch _Sakkaden_ (rasche Sprünge von einem Bereich zum
Nächsten) gekennzeichnet.

## Ergebnisse

Um die Leistungsfähigkeit von eFISK zu testen, haben wir das System in
unterschiedlichen Kombinationen erprobt und mit Standardverfahren
verglichen. Dabei gingen wir folgendermaßen vor: Wir lizensierten die
_German Indexing and Retrieval Test_ (GIRT) Datensammlung, welche Teil
des _Cross-Language Evaluation Forum_ (CLEF)-Corpus ist. Die
GIRT-Dokumente bestehen aus kurzen Zusammenfassungen akademischer
Artikel. Jedes Dokument wurde von Experten einer oder mehreren
Themenkategorien zugeordnet. Als Information-Retrieval-Maschine
wählten wir InQuery, eine Suchmaschine, die am _Center for Intelligent
Information Retrieval_ (CIIR) an der _University of Massachusetts_
entwickelt wurde. Als Testpersonen für das Eye Tracking-Experiment
dienten zwanzig Studierende der Universität des Saarlandes. Ihre
Aufgabe bestand darin, in der Rolle eines Forschungsassistenten sechs
Artikel zu überfliegen und deren Relevanz für ein - zuvor sorgfältig
studiertes - Referenzdokument, das das Thema vorgab, zu
beurteilen. Aus den vom Eye Tracker gelieferten Daten wurde für jedes
einzelne Wort die Fixierungszeit berechnet. Die Wörter mit ihren
Fixierungszeiten wurden anschließend dazu verwendet, eine Suchanfrage
an die Information-RetrievalMaschine zu generieren oder die auf
Grundlage des Referenzdokumentes formulierte ursprüngliche Anfrage zu
erweitern.

Als Vergleichsverfahren dienten:

**Referenzdokument als Anfrage (RefDoc):** Hierbei wird das
Referenzdokument als Grundlage für die Anfrage an das IR-System
verwendet.

**Relevance Feedback (RF):** Für das RF muss der Benutzer die
zurückgelieferten Dokumente als “relevant” bzw. “nicht relevant”
bewerten (explizites Feedback). Aus diesen Bewertungen wird zusammen
mit der auf Grundlage des Referenzdokumentes erstellten ursprünglichen
Suchanfrage eine neue verbesserte Anfrage berechnet.

**Pseudo-Relevance Feedback (PRF):** Beim PRF werden die ersten n
Dokumente der Ergebnisliste als “relevant” interpretiert und mit der
auf Grundlage des Referenzdokumentes erstellten ursprünglichen
Suchanfrage verrechnet. Bei unseren Tests hat sich _n_ = 5 als optimal
erwiesen.

Die kombinierten Eye-Tracking Verfahren waren:

**Top _n_ Keywords (Top _n_):** Bei diesem Verfahren besteht die
Suchanfrage aus den _n_ Schlüsselwörtern mit den höchsten
Gesamtfixierungszeiten. Für unsere Datensammlung hat sich _n_ = 30 als
optimal erwiesen.

**Weighted Keywords (Weighted):** Bei den _Weighted Keywords_ werden
die Schlüsselwörter entsprechend ihrer jeweiligen Fixierungszeit
gewichtet. Dabei spielen zwei Parameter eine Rolle: ein konstanter
Faktor für die Gewichtung und ein glättender Wert, mit dem Terme
gewichtet werden, für welche die Gesamtfixierungszeit 0 ist. Dieses
Glätten ist im Englischen als “Smoothing” bekannt.

**Top _n_ Keywords + Referenzdokument (Top _n_ + RefDoc):** Hier setzt
sich die Anfrage aus den n Schlüsselwörtern mit den höchsten
Gesamtfixierungszeiten und dem Referenzdokument zusammen. Bei unseren
Experimenten hat sich _n_ = 60 als optimal erwiesen.

<!-- Abbildung 2 zeigt die Average Precision at seen Relevant
Documents der verglichenen Verfahren unter Berücksichtigung der ersten
50 zurückgelieferten Dokumente.  --> Von den Eye Tracking-basierten
Verfahren ist “Top 60 + RefDoc” mit großem Abstand das beste. Es
übertrifft bei den ersten 30 Dokumenten die Ergebnisse des Relevance
Feedback und des Pseudo Relevance Feedback Verfahrens deutlich.

Die Berücksichtigung weiterer Eye Tracker-Informationen wie z.B der
Pupillengröße und Sakkaden verbessert die Ergebnisse zusätzlich,
ebenso der Einsatz von Self Organizing Maps.

## Diskussion, Ausblick, Anwendungsperspektive

Während Standardsuchverfahren zur Identifizierung weiterführender
Informationsquellen den kompletten Dokumentinhalt als Basis
heranziehen und damit notgedrungen eine Vielzahl irrelevanter Daten
mit berücksichtigen, stützt sich eFISK auf jene Abschnitte eines
Dokumentes, denen seitens des Nutzers die größte Aufmerksamkeit zuteil
wurde. Ohne Mehraufwand und die Formulierung komplexer Suchanfragen
ermöglicht dies eine wesentlich effizientere und zielgenauere
Suche. Die Technologie von eFISK wird im Nachfolgeprojekt „MyMory“
weiterentwickelt.
