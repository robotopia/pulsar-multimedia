FRAMES = $(shell seq -w 0 24)
PNGS   = $(patsubst %,frame_%.png,$(FRAMES))

warped.gif: $(PNGS)
	convert -delay 3 -loop 0 $^ $@

frame_%.png: warped.gpi
	gnuplot -e "set terminal pngcairo enhanced size 160,100; fgc = 'black'; bgc = 'white'; frame = '$*' + 0; set output '$@'" $<
