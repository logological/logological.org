from __future__ import unicode_literals
import subprocess
import datetime

AUTHOR = u'Tristan Miller'
SITETITLE = u"<b>Tristan Miller</b>"
SITENAME = u"Tristan Miller"
SITEKEYWORDS = ', '.join([
    'natural language processing', 'nlp', 'computational linguistics', 'logology', 'free software', 'humour'
    ])
SITEURL = ''
#SITEURL = 'http://www.nothingisreal.com'
REPOURL = 'https://github.com/logological/nothingisreal'
DESCRIPTION = ""
BANNER = ""
BUILD_TIME = datetime.date.today().strftime(format='%Y-%m-%d')

# Get the current git commit hash
COMMIT = ''
process = subprocess.Popen('git rev-parse HEAD'.split(), cwd='.',
                           stdout=subprocess.PIPE)
git_hash = process.communicate()[0].strip().decode('utf-8')
if git_hash:
    COMMIT = ' (<a href="{url}/commit/{commit}">{commit_link}</a>)'.format(
            url=REPOURL, commit=git_hash, commit_link=git_hash[:7])

# Language and time
DEFAULT_LANG = u'en'
TIMEZONE = u'Europe/Berlin'

# This goes at the footer of the site
FOOTER_LEFT = ""
FOOTER_RIGHT = """
Last modified: {date}<!--{commit}--><br />
<a href="/credits.html">Credits</a> &bullet;
<a href="{repo}">Source</a>
""".format(date=BUILD_TIME, commit=COMMIT, repo=REPOURL, repo_name=REPOURL[8:])

# Where to put generated files
ARTICLE_URL = '{category}/{slug}.html'
ARTICLE_SAVE_AS = ARTICLE_URL
PAGE_URL = '{slug}.html'
PAGE_SAVE_AS = PAGE_URL
USE_FOLDER_AS_CATEGORY = True
CATEGORY_URL = '{slug}/'
CATEGORY_SAVE_AS = '{slug}/index.html'

STATIC_PATHS = [
    'images',
    'notebooks',
    'pdf',
    'misc',
    'extra/CNAME',
    'extra/favicon.ico',
    'extra/favicon.png',
]
EXTRA_PATH_METADATA = {
    'extra/CNAME': {'path': 'CNAME'},
    'extra/favicon.ico': {'path': 'favicon.ico'},
    'extra/favicon.png': {'path': 'favicon.png'},
}

#READERS = {"html": None}

ARTICLES_FRONT_PAGE = 2
SUMMARY_MAX_LENGTH = 25
DEFAULT_PAGINATION = False
DISPLAY_CATEGORIES_ON_MENU = False

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

THEME = 'theme'

# Top menu
DISPLAY_PAGES_ON_MENU = False
MENUITEMS = [
    ('Research', '/research.html'),
    ('Papers', '/papers.html'),
    ('Software', '/software.html'),
    ('Fun', '/fun.html'),
    ('<i class="fa fa-github fa-lg" title="Github"></i>',
     'https://github.com/logological'),
    ('<i class="fa fa-twitter fa-lg" title="Twitter"></i>',
     'https://twitter.com/Logological'),
]

PLUGIN_PATHS = ['pelican-plugins']
PLUGINS = ['summary',
           'render_math',
           'sitemap']
SITEMAP = {
    'format': 'xml',
    'priorities': {
        'articles': 0.5,
        'indexes': 0.5,
        'pages': 0.5},
    'changefreqs': {
        'articles': 'monthly',
        'indexes': 'daily',
        'pages': 'monthly'}
}

RESPONSIVE_IMAGES = False
FIGURE_NUMBERS = True
