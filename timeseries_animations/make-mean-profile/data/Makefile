# Input files and parameters
ARCHIVE = $(shell findrepo "PKS.*J0630")/archive/J0630-2834.F
NSUBINT = $(shell psrstat -c nsubint $(ARCHIVE) | cut -f2 -d'=')
SUBINTS = $(shell seq -w 0 $$(($(NSUBINT)-1)))

# Output files:
CUMFILES = $(patsubst %,cumdata_%.txt,$(SUBINTS))
INTFILES = $(patsubst %,intdata_%.txt,$(SUBINTS))

all: cumdata intdata

cumdata: $(CUMFILES)

intdata: $(INTFILES)

data.F: $(ARCHIVE)
	ln -s $< $@

cumdata_%.F: data.F
	pam --settsub $$((10#$*+1)) -e F$* $<
	mv data.F$* $@

cumdata_%.txt: cumdata_%.F
	pdv -tZ -i 0 $< | tail -n+2 | addpdvheader -Z > $@

intdata_%.txt: data.F
	pdv -tZ -i $* $< | tail -n+2 | addpdvheader -Z > $@
