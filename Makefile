# recursive make: runs make in all the immediate subdirs
# Time-stamp: <2015-08-25 14:12 christophe@pallier.org>
 
SHELL=/bin/bash

SUBDIRS := $(wildcard */.)


all: README.html
	@for a in $(SUBDIRS); do \
		if [ -f $$a/Makefile ]; then \
			echo "processing folder $$a"; \
			$(MAKE) -C $$a; \
		fi; \
	done;


README.html: README.md
	pandoc $< -o $@
