FRAMES = $(patsubst %,frame_0%.png,$(shell seq -w 0 239))

lofl.gif: $(FRAMES)
	convert -delay 3 -loop 0 $^ $@

lofl.avi: $(FRAMES)
	ffmpeg -f image2 -i frame_%04d.png -vcodec libx264 -b 800k $@

frame_%.png: frames.gpi
	gnuplot -e 'frame = "$@"' $<
