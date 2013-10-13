miller.bbl:	miller.aux miller.bib nir.bst
	bibtex miller

#miller.bib:	academic.bib polemic.bib humour.bib
#	cat $+ > $@

miller.aux:	miller.tex
	pdflatex miller

scp:
	scp miller.bib vps:files.nothingisreal.com/publications/Tristan_Miller/miller.bib
