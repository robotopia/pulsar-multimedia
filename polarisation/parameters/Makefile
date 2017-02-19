NFRAMES = 100
FRAMES = $(shell seq -w 0 $$(($(NFRAMES)-1)))

PNGS_3PARAMS = $(patsubst %, 3params_%.png, $(FRAMES))
PNGS_2PARAMS = $(patsubst %, 2params_%.png, $(FRAMES))

all: 3params.gif 2params.gif 2params_still.png

3params.gif: $(PNGS_3PARAMS)
	convert -loop 0 -delay 3 3params_??.png $@

3params_%.png: anim.gpi 3params.gpi
	mygnuplot -o png -s 800,800 $^ $(NFRAMES) $* > $@

2params.gif: $(PNGS_2PARAMS)
	convert -loop 0 -delay 3 2params_??.png $@

2params_%.png: anim.gpi 2params.gpi
	mygnuplot -o png -s 800,800 $^ $(NFRAMES) $* > $@

2params_still.png: 2params_still.gpi
	mygnuplot -o png -s 1000,800 $< > $@
