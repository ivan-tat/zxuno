# sdcc.inc.mk - script to download and build SDCC.
#
# This file is a part of main Makefile.
#
# SPDX-FileType: SOURCE
# SPDX-FileCopyrightText: 2021, 2022 Ivan Tatarinov
# SPDX-License-Identifier: GPL-3.0-or-later

sdcc_prefix = $(SDCCHOME)

$(DOWNLOADS)/sdcc:
	mkdir -p $@

.PHONY: $(foreach t,build install uninstall clean distclean,$(t)-sdcc)

ifeq ($(_DoBuild),1)

ifeq ($(USE_SDCC_VERSION),4.1.0)
 SDCC_ARCHIVE		= sdcc-src-4.1.0.tar.bz2
 SDCC_ARCHIVE_URL	= https://sourceforge.net/projects/sdcc/files/sdcc/4.1.0/$(SDCC_ARCHIVE)/download
 SDCC_ARCHIVE_SHA256	= 81edf776d5a2dc61a4b5c3408929db7b25874d69c46e4a71b116be1322fd533f
 SDCC_ARCHIVE_TYPE	= .tar.bz2
 SDCC_ARCHIVE_SUBDIR	= sdcc
else ifeq ($(USE_SDCC_VERSION),4.2.0)
 SDCC_ARCHIVE		= sdcc-src-4.2.0.tar.bz2
 SDCC_ARCHIVE_URL	= https://sourceforge.net/projects/sdcc/files/sdcc/4.2.0/$(SDCC_ARCHIVE)/download
 SDCC_ARCHIVE_SHA256	= b49bae1d23bcd6057a82c4ffe5613f9cd0cbcfd1e940e9d84c4bfe9df0a8c053
 SDCC_ARCHIVE_TYPE	= .tar.bz2
 SDCC_ARCHIVE_SUBDIR	= sdcc-4.2.0
else
 $(error Unknown SDCC version: "$(USE_SDCC_VERSION)")
endif

$(DOWNLOADS)/sdcc/$(SDCC_ARCHIVE): | $(DOWNLOADS)/sdcc
	wget -c $(SDCC_ARCHIVE_URL) -O $@

sdcc/.extracted: $(DOWNLOADS)/sdcc/$(SDCC_ARCHIVE)
	$(RM) -r $(@D)
	extract.sh $<\
	 --sha256 $(SDCC_ARCHIVE_SHA256)\
	 --type $(SDCC_ARCHIVE_TYPE)\
	 --subdir $(SDCC_ARCHIVE_SUBDIR)\
	 --output $(@D)
	touch $@

build-sdcc: | sdcc/.extracted sdcc.mk
	$(MAKE) -w -C sdcc -f ../sdcc.mk

install-sdcc: | sdcc/.extracted sdcc.mk
	$(MAKE) -w -C sdcc -f ../sdcc.mk prefix=$(sdcc_prefix) install

 ifeq ($(_DoClean),1)

uninstall-sdcc: | sdcc/.extracted sdcc.mk
	$(MAKE) -w -C sdcc -f ../sdcc.mk prefix=$(sdcc_prefix) uninstall

clean-sdcc: | sdcc/.extracted sdcc.mk
	$(MAKE) -w -C sdcc -f ../sdcc.mk clean

distclean-sdcc:
	$(RM) -r $(DOWNLOADS)/sdcc sdcc

 else	#  !_DoClean

uninstall-sdcc\
clean-sdcc\
distclean-sdcc:;

 endif	#  !_DoClean

endif	# _DoBuild

ifeq ($(_UsePrecompiledOnWindows),1)

ifeq ($(USE_SDCC_VERSION),4.1.0)
 SDCC_ARCHIVE		= sdcc-4.1.0-setup.exe
 SDCC_ARCHIVE_URL	= https://sourceforge.net/projects/sdcc/files/sdcc-win32/4.1.0/$(SDCC_ARCHIVE)/download
 SDCC_ARCHIVE_SHA256	= cbf064c9f1a3f9a73db6d2c8ba3a43563fa3a2d2966f52cf5a571a3064222ed8
 SDCC_ARCHIVE_TYPE	= .7z
 SDCC_ARCHIVE_SUBDIR	= .
else ifeq ($(USE_SDCC_VERSION),4.2.0)
 SDCC_ARCHIVE		= sdcc-4.2.0-setup.exe
 SDCC_ARCHIVE_URL	= https://sourceforge.net/projects/sdcc/files/sdcc-win32/4.2.0/$(SDCC_ARCHIVE)/download
 SDCC_ARCHIVE_SHA256	= 14a7b65d03197c0cd9d1c2895b7949c672c4b350bb129d79514b3908f0177443
 SDCC_ARCHIVE_TYPE	= .7z
 SDCC_ARCHIVE_SUBDIR	= .
else
 $(error Unknown SDCC version: "$(USE_SDCC_VERSION)")
endif

SDCC_SUBDIRS=\
 bin\
 doc\
 include\
 lib\
 non-free

$(DOWNLOADS)/sdcc/$(SDCC_ARCHIVE): | $(DOWNLOADS)/sdcc
	wget -c $(SDCC_ARCHIVE_URL) -O $@

sdcc/.extracted: $(DOWNLOADS)/sdcc/$(SDCC_ARCHIVE)
	$(RM) -r $(@D)
	extract.sh $<\
	 --sha256 $(SDCC_ARCHIVE_SHA256)\
	 --type $(SDCC_ARCHIVE_TYPE)\
	 --subdir $(SDCC_ARCHIVE_SUBDIR)\
	 --output $(@D)
	touch $@

build-sdcc: sdcc/.extracted

install-sdcc: | sdcc/.extracted
	cd sdcc;\
	{ echo '# This file was automatically generated by Make.';\
	echo '.PHONY: install';\
	echo 'install:\';\
	find $(SDCC_SUBDIRS) -type f\
	 | sed -Ee 's,(.+), $$(DESTDIR)$$(prefix)/\1\\,';\
	echo '';\
	find $(SDCC_SUBDIRS) -type d\
	 | sed -Ee 's,(.+),$$(DESTDIR)$$(prefix)/\1\\,';\
	printf ':\n\tmkdir -p $$@\n';\
	for d in $(SDCC_SUBDIRS); do\
		if [ $$d = bin ]; then\
			find $$d -type f\
			 | sed -Ee 's,^(.+)/([^/]+),$$(DESTDIR)$$(prefix)/\1/\2: \1/\2 | $$(DESTDIR)$$(prefix)/\1\n\t$$(INSTALL_PROGRAM) $$< $$@,';\
		else\
			find $$d -type f\
			 | sed -Ee 's,^(.+)/([^/]+),$$(DESTDIR)$$(prefix)/\1/\2: \1/\2 | $$(DESTDIR)$$(prefix)/\1\n\t$$(INSTALL_DATA) $$< $$@,';\
		fi;\
	done; } >install.mk;\
	$(MAKE) -w -f install.mk DESTDIR= prefix=$(shell realpath -m --relative-to=sdcc $(sdcc_prefix)) INSTALL_PROGRAM='$(INSTALL) -m 755' INSTALL_DATA='$(INSTALL) -m 644' install

 ifeq ($(_DoClean),1)

uninstall-sdcc:
	test '$(sdcc_prefix)' = . || $(RM) -r $(sdcc_prefix)

clean-sdcc:
	$(RM) -r sdcc

distclean-sdcc: clean-sdcc
	$(RM) -r $(DOWNLOADS)/sdcc

 else	#  !_DoClean

uninstall-sdcc\
clean-sdcc\
distclean-sdcc:;

 endif	#  !_DoClean

endif	# _UsePrecompiledOnWindows
