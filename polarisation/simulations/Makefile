.SECONDARY:

all: J0034.png B0809.png

%.png: polstack.gpi %.dat
	mygnuplot -o png -s 1000,1000 $^ > $@

%.dat: %.m
	octave $< > $@

