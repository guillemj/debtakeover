#
# debtakeover Makefile
#
# Copyright © 2009 Guillem Jover <guillem@debian.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#

NAME := debtakeover
VERSION := $(shell sed -n -e 's/^VERSION=//p' $(NAME))

TAR_NAME := $(NAME)-$(VERSION)
TAR_FILE := $(TAR_NAME).tar.gz

DIST_FILES := \
	debtakeover \
	debtakeover.1 \
	debtakeover.ebuild \
	debtakeover.spec \
	NEWS \
	README \
	TODO \
	ChangeLog

all:

.PHONY: ChangeLog
ChangeLog:
	git log --stat -C >$@

.PHONY: dist
dist: ChangeLog
	mkdir $(TAR_NAME)
	cp -a $(DIST_FILES) $(TAR_NAME)
	tar czf $(TAR_FILE) --exclude=.gitignore $(TAR_NAME)
	rm -rf $(TAR_NAME)
	gpg -a -b $(TAR_FILE)

