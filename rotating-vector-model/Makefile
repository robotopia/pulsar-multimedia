NFRAMES = 96
ALPHA   = 45
ZETA    = 50

FRAMES = $(shell seq $(NFRAMES))
PNGFILES = $(patsubst %,rvm_%.png,$(FRAMES))
TITLEPNGS = $(patsubst %,title_%.png,$(FRAMES))

equation.png: equation.gpi eqpositionangle.gpi obsview.gpi sideview.gpi 3dpulsar.gpi
	#mygnuplot -o png -s 800,600 -e "alpha = $(ALPHA)*pi/180; zeta = $(ZETA)*pi/180; clock = 0.5;" $< > $@

rvm.gif: $(PNGFILES)
	convert -loop 0 -delay 3 rvm_??.png $@

rvm_%.png: animate.gpi all.gpi positionangle.gpi obsview.gpi sideview.gpi 3dpulsar.gpi
	gnuplot -e "set terminal pngcairo size 800,600; basename = 'rvm_'; nframes = $(NFRAMES); frame = $*; alpha = $(ALPHA)*pi/180; zeta = $(ZETA)*pi/180;" $< > $@

title.gif: $(TITLEPNGS)
	convert -loop 0 -delay 3 title_??.png $@

title_%.png: title_animate.gpi title_all.gpi 3dpulsar.gpi
	#mygnuplot -o png -s 1200,900 $< title_ $(NFRAMES) $* $(ALPHA) $(ZETA) > $@
