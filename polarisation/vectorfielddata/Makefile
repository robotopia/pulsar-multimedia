OCTAVE = octave
GNUPLOT = gnuplot
FFMPEG  = ffmpeg

NFRAMES = $(shell cat nframes)

default: pwy.gif

all: vf.gif  pwx.gif  pwy.gif pwc.gif

# RANDOM VECTOR FIELD

vf.gif: vf.png
	convert -loop 0 -delay 5 $(basename $<)???$(suffix $<) $@

vf.png: randomfield.gpi  vf.dat  nframes
	$(GNUPLOT) -e "arg1 = $(NFRAMES); arg2 = \"$(basename $@)\";" $<
	touch $@

vf.dat: randomfield.m  nframes  writevf.m
	$(OCTAVE) $< $(NFRAMES) $(basename $@)
	touch $@

# PLANE WAVES

# LINEAR X
pwx.gif: pwx.png
	convert -loop 0 -delay 5 $(basename $<)???$(suffix $<) $@

pwx.png: planewave.gpi  pwx.dat  nframes
	$(GNUPLOT) -e "arg1 = $(NFRAMES); arg2 = \"$(basename $@)\";" $<
	touch $@

pwx.dat: planewavex.m  nframes  writevf.m
	$(OCTAVE) $< $(NFRAMES) $(basename $@)
	touch $@

# LINEAR Y
pwy.gif: pwy.png
	convert -loop 0 -delay 5 $(basename $<)???$(suffix $<) $@

pwy.png: planewave.gpi  pwy.dat  nframes
	$(GNUPLOT) -e "arg1 = $(NFRAMES); arg2 = \"$(basename $@)\";" $<
	touch $@

pwy.dat: planewavey.m  nframes  writevf.m
	$(OCTAVE) $< $(NFRAMES) $(basename $@)
	touch $@

# CIRCULAR
pwc.gif: pwc.png
	convert -loop 0 -delay 5 $(basename $<)???$(suffix $<) $@

pwc.png: planewave.gpi  pwc.dat  nframes
	$(GNUPLOT) -e "arg1 = $(NFRAMES); arg2 = \"$(basename $@)\";" $<
	touch $@

pwc.dat: planewavec.m  nframes  writevf.m
	$(OCTAVE) $< $(NFRAMES) $(basename $@)
	touch $@

# CLEAN DIRECTORY

clean:
	$(RM) *.gif *.png *.dat

clean-stills:
	$(RM) *[0-9][0-9][0-9].png *[0-9][0-9][0-9].dat
