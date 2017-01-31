GNUPLOT = gnuplot

all: ell.gif 2freq.gif 2freqlin.gif

%.gif: %.png
	convert -loop 0 -delay 3 $(basename $<)???$(suffix $<) $@
	@$(MAKE) --no-print-directory clean-still

# For linx.png, liny.png, and circLH.png, see ../vectorfielddata/Makefile.
ell.png: ell.gpi 2dpol.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = 120; arg3 = 30; arg4 = 30;" $< > $@

2freq.png: 2freq.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = 1000; arg3 = 0; arg4 = 45; arg5 = 1.05; arg6 = 50;" $< > $@

2freqlin.png: 2freqlin.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = 1000; arg3 = 0; arg4 = 45; arg5 = 1.05; arg6 = 50;" $< > $@

clean-still:
	$(RM) *[0-9][0-9][0-9].png
