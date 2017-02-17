J0034.png: polstack.gpi J0034.dat
	mygnuplot -o png -s 1000,1000 $^ > $@

J0034.dat: J0034.m
	octave $< > $@

