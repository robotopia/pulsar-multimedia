NFRAMES = 300
FRAMES  = $(shell seq -w 0 $$(($(NFRAMES)-1)))
PNGFILES = $(patsubst %,synchvscurv_%.png,$(FRAMES))

all: $(PNGFILES)

synchvscurv_%.png: animate.gpi synchrotron.gpi curvature.gpi
	mygnuplot -o png -s 1200,600 $< $(NFRAMES) $* > $@

clean:
	$(RM) *.png
