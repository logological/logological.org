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
PROJECTS = [
    {
        'title': 'Computational Pun-derstanding',
        'subtitle': 'OFAI, 2019–',
        'description': 'An FWF-funded research project on the computer-assisted translation of wordplay',
        'url': 'https://punderstanding.ofai.at/',
        'image': 'Computational_Pun-derstanding_logo.svg',
        'roles': ['Principal investigator'],
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
        'description': 'A state-funded study on attention-based information retrieval using eye tracking',
        'url': 'efisk',
        'image': 'efisk.png',
        'roles': ['Principal investigator'],
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
    {
        'title': 'GPP',
        'subtitle': 'DFKI, 2004–',
        'description': 'A general-purpose preprocessor with customizable syntax',
        'url': '/gpp',
        'image': 'gpp-image.svg',
        'roles': ['Lead maintainer'],
        'category': 'software',
     },
    {
        'title': 'WEBWEAVR-III',
        'subtitle': 'University of Regina, 1998–1999',
        'description': 'A Bayesian network research toolkit',
        'url': 'http://www.cis.uoguelph.ca/~yxiang/ww3/',
        'image': 'webweavr-iii.gif',
        'roles': ['Contributor'],
        'category': 'software',
     },
    {
        'title': 'DKPro Core',
        'subtitle': 'TU Darmstadt, 2011–',
        'description': 'A collection of UIMA software components for natural language processing',
        'url': 'https://dkpro.github.io/dkpro-core',
        'image': 'dkpro_core.png',
        'roles': ['Contributor'],
        'category': 'software',
        'no_text_transform': True,
     },
    {
        'title': 'UBY',
        'subtitle': 'TU Darmstadt, 2015–',
        'description': 'A large-scale unified lexical-semantic resource for natural language processing based on LMF',
        'url': 'https://dkpro.github.io/dkpro-uby',
        'image': 'uby.svg',
        'roles': ['Contributor'],
        'category': 'software',
     },
    {
        'title': 'TWSI Sense Substituter',
        'subtitle': 'TU Darmstadt, 2012–',
        'description': 'A tool that produces lexical substitutions in context for over 1000 frequent nouns in English',
        'url': 'https://www.inf.uni-hamburg.de/en/inst/ab/lt/resources/software/twsi-substituter.html',
        'image': 'twsi.png',
        'roles': ['Contributor'],
        'category': 'software',
     },
    {
        'title': 'eoconv',
        'subtitle': 'DFKI, 2004–',
        'description': 'Convert text files to and from various Esperanto text encodings',
        'url': 'eoconv',
        'image': 'eoconv.svg',
        'roles': ['Lead developer'],
        'category': 'software',
     },
    {
        'title': 'DELORES',
        'subtitle': 'Griffith University, 1999–2003',
        'description': 'A forward-chaining reasoning engine for defeasible logic',
        'url': 'delores',
        'image': 'delores.svg',
        'roles': ['Lead developer'],
        'category': 'software',
     },
    {
        'title': 'Biblet',
        'subtitle': 'DFKI, 2005–',
        'description': 'A set of BibTeX bibliography styles (bst) which generate XHTML',
        'url': 'biblet',
        'image': 'biblet.png',
        'roles': ['Lead developer'],
        'category': 'software',
     },
    {
        'title': 'CHEOPS',
        'subtitle': 'University of Regina, 1998–',
        'description': 'A fully-functional chess engine capable of human-vs-human, human-vs-computer, and computer-vs-computer play',
        'url': 'cheops',
        'image': 'Cheops.png',
        'roles': ['Lead developer'],
        'category': 'software',
     },
    {
        'title': 'openSUSE',
        'subtitle': 'The openSUSE Project, 2005–',
        'description': 'A complete, multi-purpose GNU/Linux distribution',
        'url': 'https://www.opensuse.org/',
        'image': 'opensuse.svg',
        'roles': ['Packager', 'QA'],
        'category': 'software',
        'no_text_transform': True,
     },
    {
        'title': 'SeaMonkey',
        'subtitle': 'Mozilla, 2001–',
        'description': 'An integrated web browser, composer, mail/news client, and IRC client (formerly the Mozilla Application Suite)',
        'url': 'https://www.seamonkey-project.org/',
        'image': 'seamonkey.svg',
        'roles': ['Packager', 'QA'],
        'category': 'software',
     },
    {
        'title': 'dlg2html',
        'subtitle': 'DFKI, 2004–',
        'description': 'Convert DLG Pro message bases to HTML for archiving on the Web',
        'url': 'dlg2html',
        'image': 'dlg2html.png',
        'roles': ['Lead developer'],
        'category': 'software',
     },
    {
        'title': 'HUMOR',
        'subtitle': 'De Gruyter, 2020–',
        'description': 'International Journal of Humor Research',
        'url': 'https://www.degruyter.com/journal/key/HUMR/html',
        'image': 'humor.jpg',
        'roles': ['Consulting editor'],
        'category': 'publishing',
     },
    {
        'title': 'GermEval 2015: LexSub',
        'subtitle': 'GSCL, 2015',
        'description': 'Workshop for German-language lexical substitution',
        'url': 'https://www.nothingisreal.com/germeval2015/',
        'image': '2015_GermEval_LexSub_cover.jpg',
        'roles': ['Co-chair'],
        'category': 'event',
        'no_text_transform': True,
     },
    {
        'title': 'The PracTeX Journal',
        'subtitle': 'TeX Users Group, 2004–2006',
        'description': 'A journal on the practical use of TeX and friends',
        'url': 'https://tug.org/pracjourn/',
        'image': 'practex.png',
        'roles': ['Editorial board'],
        'category': 'publishing',
        'no_text_transform': True,
     },
    {
        'title': 'Humor &amp; AI',
        'subtitle': 'ISHS, 2022',
        'description': 'Panel at the 2022 International Society for Humor Studies Conference',
        'url': 'https://eventi.unibo.it/ishs-2022',
        'image': 'ishs2020.png',
        'roles': ['Co-convenor'],
        'category': 'event',
     },
    {
        'title': 'Humor &amp; AI',
        'subtitle': 'ISHS, 2019',
        'description': 'Panel at the 2019 International Society for Humor Studies Conference',
        'url': 'http://www.tamuc.edu/academics/colleges/humanitiesSocialSciencesArts/departments/literatureLanguages/newsandevents/2019-ISHS-Conference/HumorAI.aspx',
        'image': 'ishs2019.png',
        'roles': ['Co-convenor'],
        'category': 'event',
     },
    {
        'title': 'Humor &amp; AI',
        'subtitle': 'ISHS, 2018',
        'description': 'Panel at the 2018 International Society for Humor Studies Conference',
        'url': 'https://www.folklore.ee/rl/fo/konve/ishs2018/',
        'image': 'ishs2018.png',
        'roles': ['Co-convenor'],
        'category': 'event',
     },
    {
        'title': '@VISOR',
        'subtitle': 'DFKI, 2004–2005',
        'description': 'A holistic context- and content-sensitive approach to information navigation',
        'url': 'https://www.dfki.de/web/forschung/projekte-publikationen/projekte-uebersicht/projekt/visor/',
        'image': 'atvisor.png',
        'roles': ['Named investigator'],
        'category': 'research',
     },
    {
        'title': 'SemEval-2017 Task 7',
        'subtitle': 'ACL, 2017',
        'description': 'Shared task on the computational detection and interpretation of puns',
        'url': 'https://alt.qcri.org/semeval2017/task7/',
        'image': 'semeval2017.png',
        'roles': ['Co-chair'],
        'category': 'event',
     },
    {
        'title': 'SemEval-2021 Task 12',
        'subtitle': 'ACL, 2021',
        'description': 'Shared task on learning from disagreements',
        'url': 'https://sites.google.com/view/semeval2021-task12/home',
        'image': 'semeval2021.png',
        'roles': ['Co-chair'],
        'category': 'event',
     },
    {
        'title': '<em>Maledicta</em> article index',
        'subtitle': 'OFAI, 2020',
        'description': 'Title and author index for <em>Maledicta: The International Journal of Verbal Aggression</em>',
        'url': 'maledicta',
        'image': 'maledicta.svg',
        'roles': ['Editor'],
        'category': 'publishing',
     },
]

PROJECT_CATEGORIES = [ ('research', 'Funded research projects'),
                       ('event', 'Scholarly events'),
                       ('software', 'Software'),
                       ('publishing', 'Publishing &amp; documentation'),
                      ]

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
