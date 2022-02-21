PY?=python3
PELICAN?=pelican
PELICANOPTS=
PORT?=8000

RSYNC?=rsync
SCP?=scp

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py

SSH_HOST=onza
SSH_PORT=22
SSH_USER=psy
SSH_WEBSITE_TARGET_DIR=www/logological.org
SSH_PUBLICATIONS_TARGET_DIR=www/files.nothingisreal.com/publications/Tristan_Miller/

DEBUG ?= 0
ifeq ($(DEBUG), 1)
	PELICANOPTS += -D
endif

RELATIVE ?= 0
ifeq ($(RELATIVE), 1)
	PELICANOPTS += --relative-urls
endif

help:
	@echo 'Makefile logological.org                                                  '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make html                           (re)generate the web site          '
	@echo '   make clean                          remove the generated files         '
	@echo '   make regenerate                     regenerate files upon modification '
	@echo '   make publish                        generate using production settings '
	@echo '   make deploy                         alias for make rsync_upload        '
	@echo '   make serve [PORT=8000]              serve site at http://localhost:8000'
	@echo '   make serve-global [SERVER=0.0.0.0]  serve (as root) to $(SERVER):80    '
	@echo '   make devserver [PORT=8000]          start/restart develop_server.sh    '
	@echo '   make stopserver                     stop local server                  '
	@echo '   make ssh_upload                     upload the web site via SSH        '
	@echo '   make rsync_upload                   upload the web site via rsync+ssh  '
	@echo '                                                                          '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html   '
	@echo 'Set the RELATIVE variable to 1 to enable relative urls                    '
	@echo '                                                                          '

deploy:
	make publish
	make rsync_upload

html: publications maledicta
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)/*
	make -C publications clean
	make -C maledicta clean

regenerate:
	$(PELICAN) -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

serve:
ifdef PORT
	$(PELICAN) -l $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) -p $(PORT)
else
	$(PELICAN) -l $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)
endif

serve-global:
ifdef SERVER
	$(PELICAN) -l $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) -p $(PORT) -b $(SERVER)
else
	$(PELICAN) -l $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) -p $(PORT) -b 0.0.0.0
endif


devserver:
ifdef PORT
	$(PELICAN) -lr $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) -p $(PORT) --ignore-cache
else
	$(PELICAN) -lr $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) --ignore-cache
endif

devserver-global:
ifdef PORT
	$(PELICAN) -lr $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) -p $(PORT) --ignore-cache -b 0.0.0.0
else
	$(PELICAN) -lr $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) --ignore-cache -b 0.0.0.0
endif


publish: publications maledicta
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)

publications:
	make -C publications

maledicta:
	make -C maledicta

ssh_upload:
	$(SCP) -P $(SSH_PORT) -r $(OUTPUTDIR)/* $(SSH_USER)@$(SSH_HOST):$(SSH_WEBSITE_TARGET_DIR)
	$(SCP) -P $(SSH_PORT) publications/resume/{miller-abstracts,miller-polemics,miller-recreational}.bib $(SSH_USER)@$(SSH_HOST):$(SSH_PUBLICATIONS_TARGET_DIR)
	$(SCP) -P $(SSH_PORT) publications/resume/miller-featured.bib $(SSH_USER)@$(SSH_HOST):$(SSH_PUBLICATIONS_TARGET_DIR)/miller.bib

rsync_upload:
	$(RSYNC) -e "ssh -p $(SSH_PORT)" -P -rvzc --delete $(OUTPUTDIR)/ $(SSH_USER)@$(SSH_HOST):$(SSH_WEBSITE_TARGET_DIR) --cvs-exclude --exclude-from=rsync_exclude.txt
	$(RSYNC) -e "ssh -p $(SSH_PORT)" -P -rvzc publications/resume/{miller-abstracts,miller-polemics,miller-recreational}.bib $(SSH_USER)@$(SSH_HOST):$(SSH_PUBLICATIONS_TARGET_DIR) --cvs-exclude --exclude-from=rsync_exclude.txt
	$(RSYNC) -e "ssh -p $(SSH_PORT)" -P -rvzc publications/resume/miller-featured.bib $(SSH_USER)@$(SSH_HOST):$(SSH_PUBLICATIONS_TARGET_DIR)/miller.bib --cvs-exclude --exclude-from=rsync_exclude.txt

.PHONY: html help clean regenerate serve serve-global devserver publish ssh_upload rsync_upload deploy publications maledicta
