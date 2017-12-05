FRAMES = $(patsubst %,frame_0%.png,$(shell seq -w 0 239))

lofl.gif: $(FRAMES)
	convert -delay 3 -loop 0 -alpha set -dispose 2 $^ $@

frame_%.png: frames.gpi
	gnuplot -e 'frame = "$@"' $<
