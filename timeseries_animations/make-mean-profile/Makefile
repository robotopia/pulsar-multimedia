NFRAMES = 425
FRAMENUMS = $(shell seq -w 1 $(NFRAMES))
FRAMEFILES = $(patsubst %,profile_%.png,$(FRAMENUMS))

profile.gif: $(FRAMEFILES)
	convert -loop 0 -delay 3 profile_???$(suffix $<) $@
	@$(MAKE) --no-print-directory clean

profile_%.png: profile.gpi nbins
	mygnuplot -o png -s 1000,500 profile.gpi data/cumdata data/intdata $(NFRAMES) $* $(shell cat $(word 2,$^)) > $@

nbins: data/data.F
	psrstat -c nbin $< | cut -f2 -d'=' > $@

clean:
	$(RM) profile*.png

data/%:
	$(MAKE) -C $(@D) $(@F)
