NFRAMES = 100
FRAMES = $(shell seq -w 0 $$(($(NFRAMES)-1)))

PNGS_3PARAMS = $(patsubst %, 3params_%.png, $(FRAMES))

3params.gif: $(PNGS_3PARAMS)
	convert -loop 0 -delay 3 3params_??.png $@

3params_%.png: 3params_anim.gpi 3params.gpi
	mygnuplot -o png -s 800,800 $< $(NFRAMES) $* > $@
