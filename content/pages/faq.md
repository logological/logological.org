title: Frequently Asked Questions

# Frequently Asked Questions

This page compiles questions on technical issues that I am frequently
asking myself, along with the answers.

## LaTeX

### How can I set the font to Times?

Once upon a time, this was done by including the package `times`,
though this failed to set Times as the math font.  Later it was
recommended to use `mathptmx`, which set Times for both the text body
and math.  But both packages are now obsolete.  The following packages
should be used instead:

```
\usepackage{newtxtext} % Use Times for main text
\usepackage{newtxmath} % Use Times for math
```

## KDE

### How can I get applications to display dates in ISO 8601 (YYYY-MM-DD) format?

As of Plasma 5, it is no longer possible to fine-tune the system
locale settings.  For example, you cannot have KDE format currencies
according to one locale, times and dates according to another locale,
etc.  Instead you can specify only a single, global locale.

For times and dates, you can override the global locale on a
per-application basis by manually setting `LC_TIME` before launching
the application.  Unfortunately, you cannot specify a date/time format
of your own choosing, but must select from among the locales installed
on your system.  Even more unfortunately, there is no easy way of
knowing which of the locales (if any) format the date and time the way
you want.  Finding the right locale may be a matter of trial and
error.

For ISO 8601–style dates, it seems the `en_DK` locale works.  So for
example, to have Thunderbird display dates in YYYY-MM-DD format,
you can put the following script somewhere in your execution path:

```
#!/bin/bash
LC_TIME=en_DK exec /usr/bin/thunderbird "$@" >&/dev/null &
```

Unfortunately, the locale setting does not persist across sessions
saved and restored by `ksmserver`.

For further discussion, see
[KDE Bug 340982](https://bugs.kde.org/show_bug.cgi?id=340982).
