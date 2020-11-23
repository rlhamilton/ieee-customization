# Makefile for IEEE article stylesheet
#
# System-specific defines
#
# Commands
#
XSLTPROC = xsltproc -nonet
FOP = fop
XEP = /usr/share/xep/xep
#
# DocBook stylesheets
#
DBFO = file:///usr/share/xml/docbook/stylesheet/nwalsh/current/fo/docbook.xsl

#
# You shouldn't need to change anything below this line.
#

FOPTARGET = authguide.fop.pdf
XEPTARGET = authguide.xep.pdf
xepext = --stringparam xep.extensions 1
xeplog = xep.log
foplog = fop.log
fostyle = fo.xsl
pdfdir  = pdf

help:
	@echo make guidefop -- makes authguide using FOP
	@echo make guidexep -- makes authguide using XEP
	@echo make FILENAME.fop.pdf -- makes PDF using FOP
	@echo make FILENAME.xep.pdf -- makes PDF using XEP

guidexep: $(XEPTARGET)

guidefop: $(FOPTARGET)

%.fop.fo: %.xml
	$(XSLTPROC) -o $@ $(fostyle) $<

%.fop.pdf: %.fop.fo
	@if test ! -d $(pdfdir) ; then mkdir $(pdfdir);  fi;
	$(FOP) -fo $< -pdf $(pdfdir)/$@ 2>&1 | tee $(foplog)

%.xep.fo: %.xml
	$(XSLTPROC) $(xepext) -o $@ $(fostyle) $<

%.xep.pdf: %.xep.fo
	@if test ! -d $(pdfdir) ; then mkdir $(pdfdir);  fi;
	$(XEP) -fo $< -pdf $(pdfdir)/$@ 2>&1 | tee $(xeplog)

clean:
	rm -f *.fo *~ $(xeplog) $(foplog)

clobber: clean
	rm -r $(pdfdir)
