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

SSH_HOST=pi
SSH_USER=gemini
SSH_GEMINI_TARGET_DIR=gemini

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
	@echo '   make gmi                            (re)generate the Gemini site       '
	@echo '   make clean                          remove the generated files         '
	@echo '   make regenerate                     regenerate files upon modification '
	@echo '   make publish                        generate using production settings '
	@echo '   make deploy                         alias for make rsync_upload        '
	@echo '   make ssh_upload                     upload the Gemini site via SSH     '
	@echo '   make rsync_upload                   upload the Gemini site via rsync   '
	@echo '                                                                          '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 gemini '
	@echo 'Set the RELATIVE variable to 1 to enable relative urls                    '
	@echo '                                                                          '

deploy:
	make publish
	make rsync_upload

gemini: publications
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)/*
	make -C publications clean

regenerate:
	$(PELICAN) -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)


publish: publications
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)

publications:
	make -C publications

ssh_upload:
	$(SCP) -P $(SSH_PORT) -r $(OUTPUTDIR)/* $(SSH_USER)@$(SSH_HOST):$(SSH_GEMINI_TARGET_DIR)

rsync_upload:
	$(RSYNC) -e "ssh" -P -rvzc --delete $(OUTPUTDIR)/ $(SSH_USER)@$(SSH_HOST):$(SSH_GEMINI_TARGET_DIR) --cvs-exclude --exclude-from=rsync_exclude.txt

.PHONY: gemini help clean regenerate publish ssh_upload rsync_upload deploy publications
