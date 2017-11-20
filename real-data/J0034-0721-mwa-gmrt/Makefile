FRAMES = $(patsubst %,frame_0%.png,$(shell seq -w 0 999))

realdata.avi: $(FRAMES)
	ffmpeg -f image2 -i frame_%04d.png -vcodec libx264 -b 800k $@

frame_%.png: frames.gpi
	gnuplot -e 'frame = "$@"' $<
