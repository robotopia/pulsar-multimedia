NFRAMES = $(shell cat nframes)
GNUPLOT = gnuplot

all: rotate.gif swap.gif spheremap.png

spheremap.png: spheremap.gpi
	$(GNUPLOT) -e "arg1 = \"$@\";" $<

%.gif: %.png
	convert -loop 0 -delay 3 $(basename $<)???$(suffix $<) $@
	@$(MAKE) --no-print-directory clean-still

%.png: %.gpi nframes joined.gpi ellipse.gpi sphere.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = $(NFRAMES);" $< > $@

clean-still:
	$(RM) *[0-9][0-9][0-9].png
