FRAMES = $(shell seq -w 0 49)
PNGS   = $(patsubst %,frame_%.png,$(FRAMES))

landau-level.gif: $(PNGS)
	convert -loop 0 -delay 3 $^ $@

frame_%.png: landau-level.gpi
	gnuplot -e "set terminal pngcairo enhanced size 400,300; frame = '$*' + 0; set output '$@'" $<
