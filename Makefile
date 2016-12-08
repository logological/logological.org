all: miller.bbl polemics.bbl logology.bbl

.PRECIOUS: %.aux

%.bbl: %.aux ../%.bib nir.bst
	bibtex $<

#all.bib:	miller.bib polemics.bib logology.bib
#	cat $+ > $@

%.aux: %.tex
	pdflatex $<

scp:
	scp miller.bib onza:www/files.nothingisreal.com/publications/Tristan_Miller/miller.bib
