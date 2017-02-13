NFRAMES  = 100
FRAMES   = $(shell seq -w 0 $$(($(NFRAMES)-1)))
PNGS     = $(patsubst %, current_%.png, $(FRAMES))

current.gif: $(PNGS)
	convert -loop 0 -delay 3 current_??.png $@

current_%.png: animate.gpi 3dpulsar.gpi
	mygnuplot -o png -s 800,800 $< $(NFRAMES) $* > $@
