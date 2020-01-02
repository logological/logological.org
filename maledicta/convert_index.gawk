#!/usr/bin/gawk -f

# This script takes a tab-separated value (TSV) file of the Maledicta
# article index and converts it to various other formats.
#
# Copyright 2019 Tristan Miller <tristan@logological.org>
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

BEGIN {
    if (format != "html" && format != "bibtex" && format != "plaintsv" ) {
	print "Usage: convert_index.gawk --assign format={ plaintsv | html | bibtex }"
	exit 1
    }
    
    FS = "\t"
    OFS = ","
    ORS = "\r\n"
}

# Print the header
NR==1 {
    switch (format) {
	case "plaintsv":
	    print to_plaintsv()
	    break
	case "html":
	    print "  <table id='maledictaIndex' class='table table-striped table-bordered table-sm'>"
	    print "    <thead>"
	    print "      <tr>"
	    print "        <th class='th-sm'>Title</th>"
	    print "        <th class='th-sm'>Author</th>"
	    print "        <th class='th-sm'>Vol.</th>"
	    print "        <th class='th-sm'>No.</th>"
	    print "        <th class='th-sm'>Year</th>"
	    print "        <th class='th-sm'>Pages</th>"
	    print "        <th class='th-sm'>Export</th>"
	    print "      </tr>"
	    print "    </thead>"
	    print "    <tbody>"
	    break
	case "bibtex":
	    break
    }
}

END {
    switch (format) {
	case "plaintsv":
	    break
	case "html":
	    print "    </tbody>"
	    print "  </table>"
	    break
	case "bibtex":
	    break
    }
}

NR>1 {
    title = $1
    author = $2
    startpage = $3
    pages = $4
    volume = $5
    number = $6
    year = $7
    month = $8
    isbn = $9
    issn = $10
    journal = $11

    switch (format) {
	case "plaintsv":
	    print to_plaintsv()
	    break
	case "html":
	    print to_html()
	    break
	case "bibtex":
	    print to_bibtex() "\n"
	    break
    }
}

# Strip the TeX markup from the record and return it as a string
function to_plaintsv() {
    return strip_markup($0)
}

# Convert the current record to a BibTeX record and return it as a string
function to_bibtex(     firstyear, firstauthor, key) {
    # Generate a unique cite key
    firstyear = gensub(/-.*/, "", "g", year)
    if (author) {
	firstauthor = gensub(/[,;].*/, "", "g", author)
	firstauthor = gensub(/[][{}]/, "", "g", firstauthor)
	firstauthor = gensub(/ /, "", "g", firstauthor)
    } else {
	firstauthor = "maledicta"
    }
    firsttitle = strip_markup(title)
    firsttitle = gensub(/^[^A-Za-z0-9]*/, "", "g", firsttitle)
    firsttitle = gensub(/^([A-Za-z0-9]+).*/, "\\1", "g", firsttitle)
    key = tolower(firstauthor firstyear firsttitle ":" startpage )

    # Construct BibTeX record
    bibtex = "@article{" key "," "\n" \
    "  title = {" title "}," "\n"
    if (author) bibtex = bibtex "  author = {" author "}," "\n"
    bibtex = bibtex "  journal = {" journal "}," "\n" \
    "  volume = " volume "," "\n"
    if ($6) bibtex = bibtex "  number = {" number "}," "\n"
    bibtex = bibtex "  year = {" year "}," "\n" \
    "  pages = {" pages "}," "\n" \
    "  issn = {" issn "}," "\n"
    if ($9) bibtex = bibtex "  isbn = {" isbn "}," "\n"
    bibtex = bibtex "}"

    return bibtex
}

function to_html(    bibtex, htmltitle, htmlauthor) {
    bibtex = gensub(/\\&/, "\\&amp;", "g", to_bibtex())

    htmltitle = gensub(/([^h]){([^}]+)}/, "\\1\\2", "g", title)
    htmltitle = gensub(/\\emph{([^}]+)}/, "<em>\\1</em>", "g", htmltitle)
    htmltitle = gensub(/[{}]/, "", "g", htmltitle)
    htmltitle = gensub(/\\&/, "\\&amp;", "g", htmltitle)
    htmlauthor = gensub(/[{}]/, "", "g", author)
    htmlauthor = gensub(/;/, "; ", "g", htmlauthor)
    return "      <tr>\n" \
	"        <td>" htmltitle "</td>\n" \
	"        <td>" htmlauthor "</td>\n" \
	"        <td>" volume "</td>\n" \
	"        <td>" strip_markup(number) "</td>\n" \
	"        <td>" strip_markup(year) "</td>\n" \
	"        <td>" strip_markup(pages) "</td>\n" \
	"        <td><button type='button' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#bibtex' data-bibtex=\"" bibtex "\">B<span style='font-variant:small-caps;'>ib</span><span class='tex'>T<sub>e</sub>X</span></button></td>\n" \
	"      </tr>"
}

# Strip the TeX markup from the string
function strip_markup(s) {
    s = gensub(/--/, "–", "g", s)
    s = gensub(/\\emph/, "", "g", s)
    s = gensub(/[{}\\]/, "", "g", s)
    return s;
}

# Convert the given string to base64
function base64(s,     cmd) {
    cmd = "echo \"" s "\" | base64 --wrap=0"
    cmd | getline s
    close(cmd);
    return s
}

# Convert the given string to a data: URI
function data_uri(s) {
    return "data:text/plain;charset=UTF-8;base64," base64(s)
}
