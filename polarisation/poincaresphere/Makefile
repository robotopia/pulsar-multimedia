NFRAMES = $(shell cat nframes)
GNUPLOT = gnuplot

all: rotate.gif \
	 swap.gif \
	 spheremap.png \
	 spheremap-with-stokes.png \
	 all.gif \
	 pols2stokes.png

spheremap.png: spheremap.gpi
	$(GNUPLOT) -e "arg1 = \"$@\";" $<

spheremap-with-stokes.png: spheremap-with-stokes.gpi
	$(GNUPLOT) -e "arg1 = \"$@\";" $<

pols2stokes.png: pols2stokes.gpi
	mygnuplot -o png -s 800,800 $< > $@

%.gif: %.png
	convert -loop 0 -delay 3 $(basename $<)???$(suffix $<) $@
	@$(MAKE) --no-print-directory clean-still

all.png: all.gpi nframes ellipse.gpi sphere.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = $(NFRAMES);" $< > $@

%.png: %.gpi nframes joined.gpi ellipse.gpi sphere.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = $(NFRAMES);" $< > $@

clean-still:
	$(RM) *[0-9][0-9][0-9].png
