default: refresh ../content/pages/maledicta.html ../content/extra/maledicta.bib

../content/pages/maledicta.html: Maledicta_index.html maledicta.html
	sed '/<!-- BIBLIOGRAPHY -->/ r $<' $(word 2,$^) >$@

refresh:
	cd maledicta_index && git pull origin master

../content/extra/maledicta.bib:	maledicta_index/Maledicta_index.tsv convert_index.gawk
	./convert_index.gawk --assign format=bibtex < $< > $@

Maledicta_index.html:	maledicta_index/Maledicta_index.tsv convert_index.gawk
	./convert_index.gawk --assign format=html < $< > $@

clean:
	rm -f ../content/pages/maledicta.html ../content/extra/maledicta.bib Maledicta_index.html

.PHONY:	refresh clean
