# Plans for logological.org

Adapt https://github.com/StartBootstrap/startbootstrap-resume (fork
repo, tweak appearance, possibly with full-page image per
https://blackbat13.github.io/index-en.html).  Adapt website content
and structure to new theme.  Keep the single-page layout as an
overview page, with each section listing a selection of the most
important/recent items, plus a link to a page giving further details.
Use cards for individual entries per
https://www.christophersheaffe.com/.  Menu can be possibly News,
Publications, Software, Projects, Miscellany, CV [PDF]
[download-icon].  Need to add some sort of credits and last modified
link somewhere.

Maledicta table requires MDB for sortable table, so switch to another 
free table library such as https://datatables.net/examples/styling/bootstrap5.html or https://www.jqueryscript.net/table/Feature-Rich-Data-Table-Bootstrap.html

To do:

* Install ScrollReveal (via NPM on startbootstrap-resume)
* Change fonts
* Domesticate external resources
* Archive of news

# Souce code for logological.org

This is the source code for my personal site
[logological.org](https://logological.org/).

It's built using [Pelican](http://getpelican.com/).

## Dependencies

When cloning this repository, make sure to use the `--recursive`
option in order to initialize the submodules.

You'll need the following Python libraries to build the website:

* Pelican
* Markdown
* GitPython

There are various ways you can install these dependencies:

### Installing system-wide

You can install the dependencies system-wide using `pip`:

    sudo pip install pelican markdown gitpython

But if your OS's package manager handles Python libaries, it may be
better to use it instead.  For example, on openSUSE Tumbleweed, you
can get the latest releases of everything with `zypper`:

	sudo zypper ar --refresh --check http://download.opensuse.org/repositories/devel:/languages:/python/openSUSE_Tumbleweed/ devel:languages:python
	sudo zypper dup --from devel:languages:python
	sudo zypper in python3-pelican python3-Markdown python3-GitPython

### Installing in a virtual environment

While installing dependencies system-wide will usually get you the
latest versions, [Pelican itself may require older
versions](https://github.com/getpelican/pelican/issues/2820).  To get
around this, you can install the dependencies in a virtual
environment:

	virtualenv virtualenv
	source virtualenv/bin/activate
	python -m pip install "pelican[markdown]" gitpython

## Compiling the site

Use the Makefile:

    make html
    make serve &
    make regenerate &

The command `make serve` will start a simple server for the `output`
directory where the generated HTML files are.  Point your browser to
[http://localhost:8000](http://localhost:8000) to view the site.  Use
`Ctrl`+`C` to kill the server.

## Deploying the site

    make deploy

## The theme

The website style has been adapted from the [StartBootstrap resume
theme](https://github.com/StartBootstrap/startbootstrap-resume). Icons
are provided by [FontAwesome](http://fontawesome.io/) and
[Academicons](http://jpswalsh.github.io/academicons/).

## License

The theme and source code (but not the content!) is licensed under the
MIT License.
