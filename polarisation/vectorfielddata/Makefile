OCTAVE = octave
GNUPLOT = gnuplot
FFMPEG  = ffmpeg

NFRAMES = $(shell cat nframes)

all: vf.gif \
	 pwx.gif \
	 pwy.gif \
	 pwc.gif

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

pw%.gif: pw%.png
	convert -loop 0 -delay 5 $(basename $<)???$(suffix $<) $@

pwx.png: joined.gpi  planewave.gpi  pwx.dat  nframes  ../2dpols/2dpol.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = $(NFRAMES); arg3 = 90; arg4 =  0;" $<
	touch $@

pwy.png: joined.gpi  planewave.gpi  pwy.dat  nframes  ../2dpols/2dpol.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = $(NFRAMES); arg3 =  0; arg4 =  0;" $<
	touch $@

pwc.png: joined.gpi  planewave.gpi  pwc.dat  nframes  ../2dpols/2dpol.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = $(NFRAMES); arg3 =  0; arg4 = 45;" $<
	touch $@

pw%.dat: planewave%.m  nframes  writevf.m
	$(OCTAVE) $< $(NFRAMES) $(basename $@)
	touch $@

# CLEAN DIRECTORY

clean:
	$(RM) *.png *.dat

clean-stills:
	$(RM) *[0-9][0-9][0-9].png *.dat
