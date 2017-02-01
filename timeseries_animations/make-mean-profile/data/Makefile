# Input files and parameters
ARCHIVE = $(shell findrepo "PKS.*J0630")/archive/J0630-2834_1.ar
NSUBINT = $(shell psrstat -c nsubint $(ARCHIVE) | cut -f2 -d'=')
SUBINTS = $(shell seq -w 0 $$(($(NSUBINT)-1)))

# Output files:
CUMFILES = $(patsubst %,cumdata_%.txt,$(SUBINTS))
INTFILES = $(patsubst %,intdata_%.txt,$(SUBINTS))

all: cumdata intdata

cumdata: $(CUMFILES)

intdata: $(INTFILES)

data.F: $(ARCHIVE)
	pam -u ./ -e F -F $<
	mv $(basename $(notdir $<)).F $@

cumdata_%.F: data.F
	pam --settsub $$(($*+1)) -e F$* $<
	mv data.F$* $@

cumdata_%.txt: cumdata_%.F
	pdv -t -i 0 $< | tail -n+2 | addpdvheader > $@

intdata_%.txt: data.F
	pdv -t -i $* $< | tail -n+2 | addpdvheader > $@
