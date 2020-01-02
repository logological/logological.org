default: refresh ../content/pages/maledicta.md ../content/extra/maledicta.bib

../content/pages/maledicta.md: maledicta.md Maledicta_index.html
	cat $^ > $@

refresh:
	cd maledicta_index && git pull origin master

all:	Maledicta_index.pdf Maledicta_index.html Maledicta_index_plain.tsv

../content/extra/maledicta.bib:	maledicta_index/Maledicta_index.tsv convert_index.gawk
	./convert_index.gawk --assign format=bibtex < $< > $@

Maledicta_index.html:	maledicta_index/Maledicta_index.tsv convert_index.gawk
	./convert_index.gawk --assign format=html < $< > $@

clean:
	rm -f ../content/pages/maledicta.md ../content/extra/maledicta.bib Maledicta_index.html

.PHONY:	refresh clean
