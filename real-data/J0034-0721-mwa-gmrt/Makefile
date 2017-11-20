FRAMES = $(patsubst %,frame_0%.png,$(shell seq -w 0 999))

all: $(FRAMES)

frame_%.png: frames.gpi
	gnuplot -e 'frame = "$@"' $<
