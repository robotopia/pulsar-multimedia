NFRAMES = 425
FRAMENUMS = $(shell seq -w 1 $(NFRAMES))
FRAMEFILES = $(patsubst %,profile_%.png,$(FRAMENUMS))

.SECONDARY: profile_001.png profile_$(NFRAMES).png

stokes.png: stokes.gpi data/cumdata_1797.txt nbins
	mygnuplot -o png -s 800,600 $(wordlist 1,2,$^) $(shell cat $(word 3,$^)) > $@

profile.gif: $(FRAMEFILES)
	convert -loop 0 -delay 3 profile_???$(suffix $<) $@

profile_%.png: profile.gpi nbins
	mygnuplot -o png -s 1000,500 profile.gpi data/cumdata data/intdata $(NFRAMES) $* $(shell cat $(word 2,$^)) > $@

nbins: data/data.F
	psrstat -c nbin $< | cut -f2 -d'=' > $@

clean:
	$(RM) profile*.png

data/%:
	$(MAKE) -C $(@D) $(@F)
