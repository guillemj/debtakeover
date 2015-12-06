#
# debtakeover Makefile
#
# Copyright © 2009 Guillem Jover <guillem@debian.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
