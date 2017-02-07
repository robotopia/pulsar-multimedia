NBINS      = $(shell cat nbins)
NFRAMES    = 100
FRAMES     = $(shell seq -w 0 $$(($(NFRAMES)-1)))
ANIM1FILES = $(patsubst %,follow_%.png,$(FRAMES))
ANIM2FILES = $(patsubst %,follow-with-ellipse_%.png,$(FRAMES))

all: follow.gif follow-with-ellipse.gif pacurve.png

pacurve.png: pacurve.gpi data/cumdata_1797.txt nbins
	mygnuplot -o png -s 800,600 $(wordlist 1,2,$^) $(NBINS) > $@

follow-with-ellipse.gif: $(ANIM2FILES)
	convert -loop 0 -delay 3 follow-with-ellipse_??$(suffix $<) $@

follow-with-ellipse_%.png: follow-with-ellipse.gpi data/cumdata_1797.txt nbins
	mygnuplot -o png -s 800,600 $(wordlist 1,2,$^) $(NFRAMES) $* $(NBINS) > $@

follow.gif: $(ANIM1FILES)
	convert -loop 0 -delay 3 follow_??$(suffix $<) $@

follow_%.png: follow.gpi data/cumdata_1797.txt nbins
	mygnuplot -o png -s 800,600 $(wordlist 1,2,$^) $(NFRAMES) $* $(NBINS) > $@

data/%:
	$(MAKE) -C $(@D) $(@F)
