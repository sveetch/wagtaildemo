.PHONY: help install clean delpyc

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo
	@echo "  install              -- to proceed to a new install of this project. Will require 'git' client. Use clean command before if you want to reset a current install"

	@echo "  clean                -- to clean your local repository from all stuff created by buildout and instance usage"
	@echo "  delpyc               -- to remove all *.pyc files, this is recursive from the current directory"
	@echo

delpyc:
	find . -name "*\.pyc"|xargs rm -f

clean: delpyc
	rm -Rf bin pip-selfcheck.json include eggs lib parts local

install:
	virtualenv .
	bin/pip install -r requirements.txt
	bin/python manage.py migrate
# 	bin/python manage.py load_initial_data
	bin/python manage.py createsuperuser
