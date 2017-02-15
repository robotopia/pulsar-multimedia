NFRAMES = 200
FRAMES = $(shell seq -w 0 $$(($(NFRAMES)-1)))
S1PNGS = $(patsubst %,s1_%.png,$(FRAMES))
S3PNGS = $(patsubst %,s3_%.png,$(FRAMES))
S4PNGS = $(patsubst %,s4_%.png,$(FRAMES))

all: s1.gif s2.gif s3.gif s4.gif

s0.gif: s0.png
	convert $< $@

s1.gif: $(S1PNGS)
	convert -loop 0 -delay 3 s1_???.png $@

s2.gif: s2.png
	convert $< $@

s3.gif: $(S3PNGS)
	convert -loop 0 -delay 3 s3_???.png $@

s4.gif: $(S4PNGS)
	convert -loop 0 -delay 3 s4_???.png $@

s0.png: animate.gpi pulsetrain.dat all_select.gpi clue1.gpi clue2.gpi clue3.gpi clue4.gpi common.gpi rands.txt
	mygnuplot -o png -s 1200,900 $< $(NFRAMES) 0  0 $(word 2,$^) > $@

s1_%.png: animate.gpi pulsetrain.dat all_select.gpi clue1.gpi clue2.gpi clue3.gpi clue4.gpi common.gpi rands.txt
	mygnuplot -o png -s 1200,900 $< $(NFRAMES) $* 1 $(word 2,$^) > $@

s2.png: animate.gpi pulsetrain.dat all_select.gpi clue1.gpi clue2.gpi clue3.gpi clue4.gpi common.gpi rands.txt
	mygnuplot -o png -s 1200,900 $< $(NFRAMES) 0  2 $(word 2,$^) > $@

s3_%.png: animate.gpi pulsetrain.dat all_select.gpi clue1.gpi clue2.gpi clue3.gpi clue4.gpi common.gpi rands.txt
	mygnuplot -o png -s 1200,900 $< $(NFRAMES) $* 3 $(word 2,$^) > $@

s4_%.png: animate.gpi pulsetrain.dat all_select.gpi clue1.gpi clue2.gpi clue3.gpi clue4.gpi common.gpi rands.txt
	mygnuplot -o png -s 1200,900 $< $(NFRAMES) $* 4 $(word 2,$^) > $@

pulsetrain.dat: pulsetrain.gpi
	mygnuplot $< > $@

clean:
	$(RM) *.png
