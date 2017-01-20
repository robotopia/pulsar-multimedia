NFRAMES = $(shell cat nframes)
GNUPLOT = gnuplot

all: rotate.gif

%.gif: %.png
	convert -loop 0 -delay 3 $(basename $<)???$(suffix $<) $@
	@$(MAKE) --no-print-directory clean-still

rotate.png: rotate.gpi nframes
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = $(NFRAMES);" $< > $@

clean-still:
	$(RM) *[0-9][0-9][0-9].png
