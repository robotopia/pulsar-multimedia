NFRAMES  = 100
FRAMES   = $(shell seq -w 0 $$(($(NFRAMES)-1)))
PNGS     = $(patsubst %, current_%.png, $(FRAMES))
RETPNGS  = $(patsubst %, retcurrent_%.png, $(FRAMES))

all: current.gif retcurrent.gif

current.gif: $(PNGS)
	convert -loop 0 -delay 3 current_??.png $@

current_%.png: animate.gpi 3dpulsar.gpi
	mygnuplot -o png -s 800,800 $< $(NFRAMES) $* no > $@

retcurrent.gif: $(RETPNGS)
	convert -loop 0 -delay 3 retcurrent_??.png $@

retcurrent_%.png: animate.gpi 3dpulsar.gpi
	mygnuplot -o png -s 800,800 $< $(NFRAMES) $* yes > $@


