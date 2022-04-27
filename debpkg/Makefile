.PHONY: all congig

SHELL := /bin/bash
VIEWERS=okular, atril, evince, xreader, zathura
DEFAULT_VIEWER=atril
DEPENDS=bash, curl, egrep, sed, wget


all: config build

config: maintainer version viewers default_viewer depends	

maintainer: DEBIAN/control
	@read -p "Please, eneter maintainer name: " maintainer_name; \
	read -p "Please, eneter maintainer email: " maintainer_email; \
	sed -i "s/\%MAINTAINER\%/$$maintainer_name $$maintainer_email/g" ./DEBIAN/control

version: DEBIAN/control
	@sed -i "s/\%VERSION\%/`date`/g" ./DEBIAN/control

viewers: DEBIAN/control
	@sed -i "s/\%VIEWERS\%/$(VIEWERS)/g" ./DEBIAN/control

default_viewer: DEBIAN/control
	@sed -i "s/\%DEFAULT_VIEWER\%/$(DEFAULT_VIEWER)/g" ./DEBIAN/control

depends: DEBIAN/control
	@sed -i "s/\%DEPENDS\%/$(DEPENDS)/g" ./DEBIAN/control


