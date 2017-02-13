NFRAMES  = 100
FRAMES   = $(shell seq -w 0 $$(($(NFRAMES)-1)))
PNGS     = $(patsubst %, aberration_%.png, $(FRAMES))

aberration.gif: $(PNGS)
	convert -loop 0 -delay 3 aberration_??.png $@

aberration_%.png: animate.gpi 3dpulsar.gpi
	mygnuplot -o png -s 1000,500 $< $(NFRAMES) $* > $@
