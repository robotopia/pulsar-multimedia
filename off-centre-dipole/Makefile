NFRAMES  = 50
FRAMES   = $(shell seq -w 0 $$(($(NFRAMES)-1)))
PNGS     = $(patsubst %, offset_%.png, $(FRAMES))

offset.gif: $(PNGS)
	convert -loop 0 -delay 3 offset_??.png $@

offset_%.png: animate.gpi 3dpulsar.gpi
	mygnuplot -o png -s 800,800 $< offset $(NFRAMES) $*
