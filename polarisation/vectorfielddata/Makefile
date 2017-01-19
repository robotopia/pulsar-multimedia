OCTAVE = octave
GNUPLOT = gnuplot
FFMPEG  = ffmpeg

NFRAMES = $(shell cat nframes)

# Random vector field
vf.gif: vf.png
	convert -loop 0 -delay 5 $(basename $<)???$(suffix $<) $@

vf.png: vectorfield.gpi  vf.dat  nframes
	$(GNUPLOT) -e "arg1 = $(NFRAMES); arg2 = \"$(basename $@)\";" $<
	touch $@

vf.dat: vectorfield.m  nframes  writevf.m
	$(OCTAVE) $< $(NFRAMES) $(basename $@)
	touch $@

