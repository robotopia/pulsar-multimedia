NBINS      = $(shell cat nbins)
NFRAMES    = 100
FRAMES     = $(shell seq -w 0 $$(($(NFRAMES)-1)))
FRAMEFILES = $(patsubst %,follow_%.png,$(FRAMES))

follow.gif: $(FRAMEFILES)
	convert -loop 0 -delay 3 follow_??$(suffix $<) $@

follow_%.png: follow.gpi data/cumdata_1797.txt nbins
	mygnuplot -o png -s 800,600 $(wordlist 1,2,$^) $(NFRAMES) $* $(NBINS) > $@

data/%:
	$(MAKE) -C $(@D) $(@F)
