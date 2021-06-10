from __future__ import unicode_literals
import subprocess
import datetime

AUTHOR = u'Tristan Miller'
SITETITLE = u"Tristan Miller"
SITENAME = u"Tristan Miller"
#SITEKEYWORDS = ', '.join([
#    'natural language processing', 'nlp', 'computational linguistics', 'logology', 'free software', 'humour'
#    ])
SITEURL = ''

REPOURL = 'https://github.com/logological/logological.org'
DESCRIPTION = ""
BANNER = ""
BUILD_TIME = datetime.date.today().strftime(format='%Y-%m-%d')

# Language and time
DEFAULT_DATE = 'fs'
DEFAULT_LANG = u'en-ca'
TIMEZONE = u'Europe/Vienna'
DEFAULT_DATE_FORMAT = '%Y-%m-%d'

# This goes at the footer of the site
FOOTER_LEFT = "" # Superseded; see base.html
FOOTER_RIGHT = """
<a href="/credits.html">Credits</a> &bullet;
<a title="{repo_name} on GitHub" href="{repo}">Source</a>
""".format(repo=REPOURL, repo_name=REPOURL[19:])

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
    'extra/.htaccess',
    'extra/81A27838.txt',
    'extra/android-chrome-192x192.png',
    'extra/android-chrome-512x512.png',
    'extra/apple-touch-icon.png',
    'extra/BF8A2EE4.txt',
    'extra/browserconfig.xml',
    'extra/EFBF4915.txt',
    'extra/favicon-16x16.png',
    'extra/favicon-32x32.png',
    'extra/favicon.ico',
    'extra/google0aaa94dac5255b24.html',
    'extra/keybase.txt',
    'extra/maledicta.bib',
    'extra/mstile-150x150.png',
    'extra/party_keyring.gpg',
    'extra/robots.txt',
    'extra/safari-pinned-tab.svg',
    'extra/site.webmanifest',
]
EXTRA_PATH_METADATA = {
    'extra/.htaccess': {'path': '.htaccess'},
    'extra/81A27838.txt': {'path': '81A27838.txt'},
    'extra/android-chrome-192x192.png': {'path': 'android-chrome-192x192.png'},
    'extra/android-chrome-512x512.png': {'path': 'android-chrome-512x512.png'},
    'extra/apple-touch-icon.png': {'path': 'apple-touch-icon.png'},
    'extra/BF8A2EE4.txt': {'path': 'BF8A2EE4.txt'},
    'extra/browserconfig.xml': {'path': 'browserconfig.xml'},
    'extra/EFBF4915.txt': {'path': 'EFBF4915.txt'},
    'extra/favicon-16x16.png': {'path': 'favicon-16x16.png'},
    'extra/favicon-32x32.png': {'path': 'favicon-32x32.png'},
    'extra/favicon.ico': {'path': 'favicon.ico'},
    'extra/google0aaa94dac5255b24.html': {'path': 'google0aaa94dac5255b24.html'},
    'extra/keybase.txt': {'path': 'keybase.txt'},
    'extra/maledicta.bib': {'path': 'maledicta.bib'},
    'extra/mstile-150x150.png': {'path': 'mstile-150x150.png'},
    'extra/party_keyring.gpg': {'path': 'party_keyring.gpg'},
    'extra/robots.txt': {'path': 'robots.txt'},
    'extra/safari-pinned-tab.svg': {'path': 'safari-pinned-tab.svg'},
    'extra/site.webmanifest': {'path': 'site.webmanifest'},
}
ARTICLE_EXCLUDES = [
    'extra',
    ]
PAGE_EXCLUDES = [
    'extra',
    ]

#READERS = {"html": None}

ARTICLES_FRONT_PAGE = 5
SUMMARY_MAX_LENGTH = 25
DEFAULT_PAGINATION = 10
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
    ('Research News', '/#news'),
    ('Publications', '/#publications'),
    ('Software', '/#software'),
    ('Projects', '/#projects'),
    ('Miscellany', '/#miscellany'),
    ('CV <i class="fas fa-download"></i>', '/miller_cv.pdf'),
]
SOCIALITEMS = [
    ('ACM Digital Library', 'https://dl.acm.org/profile/99659541876', 'ai ai-acmdl'),
    ('Academia.edu', 'https://ofai.academia.edu/TristanMiller', 'ai ai-academia'),
    ('DBLP', 'https://dblp.uni-trier.de/pers/hd/m/Miller:Tristan', 'ai ai-dblp'),
    ('Diaspora', 'https://diasp.eu/people/0f0c56f61e74a82e', 'fab fa-diaspora'),
    ('GitHub', 'https://github.com/logological', 'fab fa-github'),
    ('Google Scholar', 'https://scholar.google.co.uk/citations?user=XAfWDQUAAAAJ', 'ai ai-google-scholar'),
    ('Impactstory', 'https://impactstory.org/u/0000-0002-0749-1100', 'ai ai-impactstory'),
    ('LinkedIn', 'https://www.linkedin.com/in/tristan-miller-032b327', 'fab fa-linkedin-in'),
    ('Mastodon', 'https://mastodon.social/@Logological', 'fab fa-mastodon'),
    ('ORCID', 'https://orcid.org/0000-0002-0749-1100', 'ai ai-orcid'),
    ('Publons', 'https://publons.com/researcher/4277733/tristan-miller/', 'ai ai-publons'),
    ('Scopus', 'https://www.scopus.com/authid/detail.uri?authorId=8725776300', 'ai ai-scopus'),
    ('Semantic Scholar', 'https://www.semanticscholar.org/author/Tristan-Miller/1818919', 'ai ai-semantic-scholar'),
    ('Twitter', 'https://twitter.com/Logological', 'fab fa-twitter'),
]
PROJECTS = (
    {
        'title': 'Computational Pun-derstanding',
        'subtitle': 'OFAI, 2019–',
        'description': 'An FWF-funded research project on the computer-assisted translation of wordplay',
        'url': 'https://punderstanding.ofai.at/',
        'image': 'Computational_Pun-derstanding_logo.svg',
        'roles': ['Project lead'],
        'category': 'research',
    },
    {
        'title': 'Babel: The Language Magazine',
        'subtitle': 'University of Huddersfield, 2012–',
        'description': 'A quarterly pop-science magazine that delivers cutting-edge linguistic research in an accessible and colourful format',
        'url': 'https://babelzine.co.uk/',
        'image': 'babel.jpg',
        'roles': ['Advisory panel', 'Columnist'],
        'category': 'publishing',
     },
    {
        'title': 'eFISK',
        'subtitle': 'DFKI, 2004–2005',
        'description': 'A study on attention-based information retrieval using eye tracking, funded by the Rhineland-Palatinate Foundation for Innovation',
        'url': 'efisk',
        'image': 'efisk.png',
        'roles': ['Co-PI'],
        'category': 'research',
        'no_text_transform': True,
     },
    {
        'title': 'DKPro WSD',
        'subtitle': 'TU Darmstadt, 2012–',
        'description': 'A modular, extensible Java framework for word sense disambiguation based on Apache UIMA',
        'url': 'https://dkpro.github.io/dkpro-wsd/',
        'image': 'dkpro_wsd.png',
        'roles': ['Lead developer'],
        'category': 'software',
        'no_text_transform': True,
     },
)
# To add: @VISOR, HUMOR, SemEval-2021, SemEval-2017, GermEval-2015

PLUGIN_PATHS = ['pelican-plugins']
PLUGINS = ['render_math',
           'sitemap',
           'filetime_from_git',
]
SITEMAP = {
    'format': 'xml',
    'priorities': {
        'articles': 0.5,
        'indexes': 0.5,
        'pages': 0.5},
    'changefreqs': {
        'articles': 'weekly',
        'indexes': 'weekly',
        'pages': 'weekly'}
}

#RESPONSIVE_IMAGES = False
#FIGURE_NUMBERS = True
#PAGINATED_TEMPLATES = ['home']
DIRECT_TEMPLATES = ['index']

MARKDOWN = {
    'extension_configs': {
        'markdown.extensions.codehilite': {'css_class': 'highlight'},
        'markdown.extensions.extra': {},
        'markdown.extensions.meta': {},
        'markdown.extensions.toc': {},
    },
    'output_format': 'html5',
}

NEWS_ICONS = {
    'talk': 'mdi:presentation',
    'invited-talk': 'mdi:presentation',
    'keynote': 'mdi:presentation',
    'radio': 'mdi:radio-tower',
    'publication': 'mdi:file-document-outline',
    'shared-task': 'mdi:human-greeting-proximity',
}
