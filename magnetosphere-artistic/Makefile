all: dipole-radiation-3stages.gif dipole-radiation-carousel.gif dipole_radiation.gif dipole-radiation-temperature.gif

%_palette.png: %.mpg
	ffmpeg -y -i $< -vf fps=24,scale=320:-1:flags=lanczos,palettegen $@

%.gif: %.mpg %_palette.png
	ffmpeg -y -i $< -i $(word 2,$^) -filter_complex "fps=24,scale=960:-1:flags=lanczos[x];[x][1:v]paletteuse" $@
