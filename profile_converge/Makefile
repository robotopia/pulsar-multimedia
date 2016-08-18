profile_converge.ogv: images/.touch.profile
	ffmpeg -r 24 -i images/frame_%04d.png -r 24 -q 10 $@

pulses.dat: data.txt
	grep -v "^#" $< | head -2048000 | cut -d' ' -f1,3,4 | grep "^[0-9]* [4-6][0-9][0-9]" | grep -v "^[0-9]* 4[0-7]" | grep -v "^[0-9]* 6[89]" > $@

images/.touch.profile: profile_converge.gpi pulses.dat
	gnuplot $<
	touch $@
