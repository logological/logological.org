default: refresh ../content/pages/publications.html ../content/pages/publications-recreational.html

../content/pages/publications.html: miller.bbl publications.html
	sed '/<!-- BIBLIOGRAPHY -->/ r $<' $(word 2,$^) >$@

../content/pages/publications-recreational.html: miller-recreational.bbl publications-recreational.html
	sed '/<!-- BIBLIOGRAPHY -->/ r $<' $(word 2,$^) >$@

refresh:
	cd resume && git pull origin master
	cd covers && git pull origin master

all: miller.bbl miller-polemics.bbl miller-recreational.bbl

%.bbl: %.aux resume/%.bib logological.bst
	bibtex $<

all.bib: miller.bib miller-polemics.bib miller-recreational.bib
	cat $+ > $@

%.aux: %.tex
	pdflatex $<

clean:
	rm -f {miller,miller-polemics,miller-recreational}.{aux,bbl,blg,log}

.PRECIOUS: %.aux

.PHONY: refresh clean
