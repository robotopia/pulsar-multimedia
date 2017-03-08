NFRAMES = 960
FRAMES = $(shell seq -w 0 $$(($(NFRAMES)-1)))
FRAMEFILES = $(patsubst %,frames/frame_%.png,$(FRAMES))

all: pulsar_carousel_reverse.gif pulsar_carousel_accel.gif

%_palette.png: %.mpg
	ffmpeg -y -i $< -vf fps=24,scale=320:-1:flags=lanczos,palettegen $@

%.gif: %.mpg %_palette.png
	ffmpeg -y -i $< -i $(word 2,$^) -filter_complex "fps=24,scale=240:-1:flags=lanczos[x];[x][1:v]paletteuse" $@

pulsestack.dat:
	carousim timeseries -a 4.5 -z 9.3 -c 3.0 -n 9 -N 0.01 -p 150 -w 0.15 -C -70 > $@

pulsestack.bin: pulsestack.dat
	cat $< | tr '\n' ' ' | splat binarize - > $@

frames/anim.mpg: $(FRAMEFILES)
	$(MAKE) -C $(@D) $(@F)

frames/frame_%.png: anim.gpi frames.gpi
	mygnuplot -o png -s 1000,600 $< $(NFRAMES) $* > $@
	sleep 0.5

