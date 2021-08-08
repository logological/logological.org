# Souce code for logological.org

This is the source code for my personal site
[gemini.logological.org](gemini://gemini.logological.org/).

It's built using [Pelican](http://getpelican.com/).

## Dependencies

When cloning this repository, make sure to use the `--recursive`
option in order to initialize the submodules.

You'll need the following Python libraries to build the website:

* Pelican
* GitPython
* pelican-gemini

There are various ways you can install these dependencies:

### Installing system-wide

You can install the dependencies system-wide using `pip`:

    sudo pip install pelican gitpython pelican-gemini

But if your OS's package manager handles Python libaries, it may be
better to use it instead.  For example, on openSUSE Tumbleweed, you
can get the latest releases of everything with `zypper`:

	sudo zypper ar --refresh --check http://download.opensuse.org/repositories/devel:/languages:/python/openSUSE_Tumbleweed/ devel:languages:python
	sudo zypper dup --from devel:languages:python
	sudo zypper in python3-pelican python3-GitPython python3-pelican-gemini

### Installing in a virtual environment

While installing dependencies system-wide will usually get you the
latest versions, [Pelican itself may require older
versions](https://github.com/getpelican/pelican/issues/2820).  To get
around this, you can install the dependencies in a virtual
environment:

	virtualenv virtualenv
	source virtualenv/bin/activate
	python -m pip install pelican gitpython pelican-gemini

## Compiling the site

Use the Makefile:

    make gemini
    make regenerate &

## Deploying the site

    make deploy
