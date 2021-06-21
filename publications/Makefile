default: refresh ../content/pages/publications.html ../content/pages/publications-recreational.html ../theme/templates/publications_populated.html

../theme/templates/publications_populated.html: miller-featured.bbl ../theme/templates/publications.html
	sed '/<!-- BIBLIOGRAPHY -->/ r $<' $(word 2,$^) >$@

../content/pages/publications.html: miller.bbl publications.html
	sed '/<!-- BIBLIOGRAPHY -->/ r $<' $(word 2,$^) >$@

../content/pages/publications-recreational.html: miller-recreational.bbl publications-recreational.html
	sed '/<!-- BIBLIOGRAPHY -->/ r $<' $(word 2,$^) >$@

refresh:
	cd resume && git pull origin master
	cd covers && git pull origin master

all: miller.bbl miller-recreational.bbl miller-featured.bbl

%.bbl: %.aux %.bib logological.bst
	bibtex $<

all.bib: miller.bib miller-recreational.bib
	cat $+ > $@

%.aux: %.tex
	pdflatex $<

clean:
	rm -f {miller,miller-featured,miller-recreational}.{aux,bbl,blg,log} ../theme/templates/publications_populated.html

.PRECIOUS: %.aux

.PHONY: refresh clean
