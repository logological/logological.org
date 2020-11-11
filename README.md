# Souce code for logological.org

This is the source code for my personal site
[logological.org](https://logological.org/).

It's built using [Pelican](http://getpelican.com/) and based on the
website of
[Leonardo Uieda](https://github.com/leouieda/website-pelican).

## Dependencies

When cloning this repository, make sure to use the `--recursive`
option in order to initialize the submodules.

You'll need the following Python libraries to build the website:

* Pelican
* Markdown
* GitPython

There are various ways you can install these dependencies:

### Installing system-wide

You can install the dependencies system-wide using `pip3`:

    sudo pip3 install pelican markdown gitpython

But if your OS's package manager handles Python libaries, it may be
better to use it instead.  For example, on openSUSE Tumbleweed, you
can get the latest releases of everything with `zypper`:

	sudo zypper ar --refresh --check http://download.opensuse.org/repositories/devel:/languages:/python/openSUSE_Tumbleweed/ devel:languages:python
	sudo zypper dup --from devel:languages:python
	sudo zypper in python3-pelican python3-Markdown python3-GitPython

### Installing in a virtual environment

While installing dependencies system-wide will usually get you the latest versions, [Pelican itself may require older versions](https://github.com/getpelican/pelican/issues/2820).  To get around this, you can install the dependencies in a virtual environment:

    virtualenv virtualenv
	source virtualenv/bin/activate
	python -m pip install "pelican[markdown]" gitpython

## Compiling the site

Use the Makefile:

    make html
    make serve

The command `make serve` will start a simple server for the `output`
directory where the generated HTML files are.  Point your browser to
[http://localhost:8000](http://localhost:8000) to view the site.  Use
`Ctrl+C` to kill the server.

## Deploying the site

    make deploy

## The theme

The website theme is made using [bootstrap](http://getbootstrap.com/)
and tweaked from the [Bootswatch](http://bootswatch.com/) themes.
Icons are provided by [FontAwesome](http://fontawesome.io/) and
[Academicons](http://jpswalsh.github.io/academicons/).

<!--
## Adding an article/talk/course/software

The papers, talks, courses and software entries are basically blog
posts, each in a different category.  Categories are defined as
folders in `content`.  Each entry gets it's own `.md` file.  The site
theme takes a lot of extra metadata in the post to make the "Info"
section of each entry.

To add a new entry, create the `.md` file in the corresponding category.

## Metadata for entries

### Papers

Required:

    title: Geophysical tutorial: Euler deconvolution of potential-field data
    date: 01-04-2014
    slug: paper-tle-euler-tutorial-2014
    author: Uieda, L., V. C. Oliveira Jr, and V. C. F. Barbosa
    journal: The Leading Edge
    citation: Uieda, L., V. C. Oliveira Jr, and V. C. F. Barbosa (2014), Geophysical tutorial: Euler deconvolution of potential-field data, The Leading Edge, 33(4), 448-450, doi:10.1190/tle33040448.1

Note that `citation` has to be in a single line.

Optional:

    repository: pinga-lab/paper-tle-euler-tutorial
    doi: 10.1190/tle33040448.1
    supplement: 10.6084/m9.figshare.923450
    thumbnail: images/thumb/paper-tle-euler-tutorial-2014.png
    pdf: paper-tle.pdf
    tags: OA, review

The `tags` metadata has special entries: `OA` and `review`.  An entry
with the `OA` tag will be marked as open-acess.  Setting the `review`
tag will mark the entry as under peer-review (unpublished).

The PDF file should be provided in the `content/pdf` folder.

### Talks

Required:

    title: Use of the "shape-of-anomaly" data misfit in 3D inversion by planting anomalous densities
    author: Uieda, L., and V. C. F. Barbosa
    slug: seg2012
    date: 01-11-2012
    type: oral
    event: SEG Annual Meeting

`type` can be either `oral` or `poster`.

Optional:

    tags: expanded
    pdf: seg-2012.pdf
    repository: leouieda/seg2012
    slides: 10.6084/m9.figshare.156864
    poster: 10.6084/m9.figshare.1089987
    doi: 10.1190/segam2012-0383.1
    thumbnail: images/thumb/seg2012.png
    citation: Uieda, L., and V. C. F. Barbosa (2012), Use of the "shape-of-anomaly" data misfit in 3D inversion by planting anomalous densities, SEG Technical Program Expanded Abstracts, pp. 1-6, doi:10.1190/segam2012-0383.1

If `tags` has the word `expanded`, will place an info alert saying
that there is an expanded abstract or short paper available with this
entry.

-->

## License

[![Creative Commons License](https://i.creativecommons.org/l/by/4.0/88x31.png)](http://creativecommons.org/licenses/by/4.0/)
The theme and source code (but not the content!) is licensed under a
[Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).
