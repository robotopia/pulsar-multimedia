NBINS      = $(shell cat nbins)
NFRAMES    = 100
FRAMES     = $(shell seq -w 0 $$(($(NFRAMES)-1)))
ANIM1FILES = $(patsubst %,follow_%.png,$(FRAMES))
ANIM2FILES = $(patsubst %,follow-with-ellipse_%.png,$(FRAMES))
ANIM3FILES = $(patsubst %,pacurve_%.png,$(FRAMES))

all: follow.gif follow-with-ellipse.gif pacurve.gif pacurve-fit.png

pacurve-fit.png: pacurve-fit.gpi data/cumdata_3628.txt nbins
	    mygnuplot -o png -s 800,600 $(wordlist 1,2,$^) $(NBINS) > $@

pacurve.gif: $(ANIM3FILES)
	convert -loop 0 -delay 3 pacurve_??$(suffix $<) $@

pacurve_%.png: pacurve.gpi data/cumdata_3628.txt nbins
	mygnuplot -o png -s 800,600 $(wordlist 1,2,$^) $(NFRAMES) $* $(NBINS) > $@

follow-with-ellipse.gif: $(ANIM2FILES)
	convert -loop 0 -delay 3 follow-with-ellipse_??$(suffix $<) $@

follow-with-ellipse_%.png: follow-with-ellipse.gpi data/cumdata_3628.txt nbins
	mygnuplot -o png -s 800,600 $(wordlist 1,2,$^) $(NFRAMES) $* $(NBINS) > $@

follow.gif: $(ANIM1FILES)
	convert -loop 0 -delay 3 follow_??$(suffix $<) $@

follow_%.png: follow.gpi data/cumdata_3628.txt nbins
	mygnuplot -o png -s 800,600 $(wordlist 1,2,$^) $(NFRAMES) $* $(NBINS) > $@

data/%:
	$(MAKE) -C $(@D) $(@F)
