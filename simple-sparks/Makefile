FRAMES = $(shell seq -w 0 24)
PNGS   = $(patsubst %,frame_%.png,$(FRAMES))

anim.gif: $(PNGS)
	convert -delay 3 -loop 0 $^ $@

frame_%.png: anim.gpi
	gnuplot -e "set terminal pngcairo enhanced size 100,100; fgc = 'black'; bgc = 'white'; frame = '$*' + 0; set output '$@'" $<
