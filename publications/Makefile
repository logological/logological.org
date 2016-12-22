../content/pages/publications.html: miller.bbl publications.template.html
	sed '/<!-- BIBLIOGRAPHY -->/ r $<' $(word 2,$^) >$@

all: miller.bbl miller-polemics.bbl miller-recreational.bbl

.PRECIOUS: %.aux

%.bbl: %.aux resume/%.bib logological.bst
	bibtex $<

all.bib: miller.bib miller-polemics.bib miller-recreational.bib
	cat $+ > $@

%.aux: %.tex
	pdflatex $<

clean:
	rm -f {miller,miller-polemics,miller-recreational}.{aux,bbl,blg,log}
