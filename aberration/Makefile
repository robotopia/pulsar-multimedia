NFRAMES  = 100
FRAMES   = $(shell seq -w 0 $$(($(NFRAMES)-1)))
ABPNGS   = $(patsubst %, aberration_%.png, $(FRAMES))
ROTPNGS  = $(patsubst %, rotvsinert_%.png, $(FRAMES))

all: aberration.gif rotvsinert.gif

aberration.gif: $(ABPNGS)
	convert -loop 0 -delay 3 aberration_??.png $@

aberration_%.png: animate.gpi 3dpulsar.gpi
	mygnuplot -o png -s 1000,500 $< $(NFRAMES) $* > $@

rotvsinert.gif: $(ROTPNGS)
	convert -loop 0 -delay 3 rotvsinert_??.png $@

rotvsinert_%.png: rotvsinert.gpi rotframe.gpi inertframe.gpi
	mygnuplot -o png -s 1000,500 $< $(NFRAMES) $* > $@

clean:
	$(RM) $(ROTPNGS)
