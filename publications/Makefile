all: miller.bbl miller-polemics.bbl miller-recreational.bbl

.PRECIOUS: %.aux

%.bbl: %.aux ../%.bib logological.bst
	bibtex $<

all.bib: miller.bib miller-polemics.bib miller-recreational.bib
	cat $+ > $@

%.aux: %.tex
	pdflatex $<

deploy:
	scp miller.bib miller-polemics.bib miller-recreational.bib onza:www/files.nothingisreal.com/publications/Tristan_Miller/
