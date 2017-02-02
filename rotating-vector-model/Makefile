NFRAMES = 72
ALPHA   = 45
ZETA    = 50

FRAMES = $(shell seq -w $(NFRAMES))
PNGFILES = $(patsubst %,$(BASENAME)_%.png,$(FRAMES))

rvm.gif: $(PNGFILES)
	convert -loop 0 -delay 3 rvm_???.png $@

rvm_%.png: animate.gpi all.gpi positionangle.gpi obsview.gpi sideview.gpi 3dpulsar.gpi
	mygnuplot -o png -s 800,600 $< rvm $(NFRAMES) $* $(ALPHA) $(ZETA)
