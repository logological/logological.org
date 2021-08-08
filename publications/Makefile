default: refresh ../content/pages/publications.gmi ../content/pages/publications-recreational.gmi ../theme/templates/publications_populated.gmi

../theme/templates/publications_populated.gmi: miller-featured.bbl ../theme/templates/publications.gmi
	sed '/<!-- BIBLIOGRAPHY -->/ r $<' $(word 2,$^) | fgrep -v '<!-- BIBLIOGRAPHY -->' >$@

../content/pages/publications.gmi: miller.bbl publications.gmi
	sed '/<!-- BIBLIOGRAPHY -->/ r $<' $(word 2,$^) | fgrep -v '<!-- BIBLIOGRAPHY -->' >$@

../content/pages/publications-recreational.gmi: miller-recreational.bbl publications-recreational.gmi
	sed '/<!-- BIBLIOGRAPHY -->/ r $<' $(word 2,$^) | fgrep -v '<!-- BIBLIOGRAPHY -->' >$@

refresh:
	cd resume && git pull origin master
	cd covers && git pull origin master

all: miller.bbl miller-recreational.bbl miller-featured.bbl

%.bbl: %.aux %.bib logological.bst
	bibtex $<
	sed 's/^ *//;' $@ | fmt -w 2048 | sed 's/=>/\n=>/g;/^[^=]/s/[\t ]\+/ /g' > $@.fmt && mv $@.fmt $@

all.bib: miller.bib miller-recreational.bib
	cat $+ > $@

%.aux: %.tex
	pdflatex $<

clean:
	rm -f {miller,miller-featured,miller-recreational}.{aux,bbl,blg,log} ../content/pages/publications{,-recreational}.gmi ../theme/templates/publications_populated.gmi

.PRECIOUS: %.aux

.PHONY: refresh clean
