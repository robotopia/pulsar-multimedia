.SECONDARY:

HEIGHTS = heights_000.png \
          heights_001.png \
          heights_002.png \
          heights_003.png \
          heights_004.png \
          heights_005.png

SAMPLEDPULSE = sampledpulse_000.png \
               sampledpulse_001.png \
               sampledpulse_002.png \
               sampledpulse_003.png \
               sampledpulse_004.png \
               sampledpulse_005.png \
               sampledpulse_006.png \
               sampledpulse_007.png \
               sampledpulse_008.png \
               sampledpulse_009.png \
               sampledpulse_010.png \
               sampledpulse_011.png \
               sampledpulse_012.png \
               sampledpulse_013.png \
               sampledpulse_014.png \
               sampledpulse_015.png \
               sampledpulse_016.png \
               sampledpulse_017.png \
               sampledpulse_018.png \
               sampledpulse_019.png \
               sampledpulse_020.png \
               sampledpulse_021.png \
               sampledpulse_022.png \
               sampledpulse_023.png

all: heights.gif sampledpulse.gif binned_timeseries.png spectrum.png

heights.gif: $(HEIGHTS)
	convert -delay 100 $^ $@

sampledpulse.gif: $(SAMPLEDPULSE)
	convert -delay 50 $^ $@

sampledpulse_%.png: 3D-sampledpulse_%.png 2D-sampledpulse_%.png .still-images
	convert $(word 1,$^) $(word 2,$^) -append $@

heights_%.png: 3D-heights_%.png 2D-heights_%.png .still-images
	convert $(word 1,$^) $(word 2,$^) -append $@

.still-images: time-samples.gpi singlepulse.dat singlepulse-sampled.dat geometry.gpi
	gnuplot $<
	touch $@

singlepulse-sampled.dat: singlepulse.dat downsamp.var
	NLINES=`cat $< | wc -l`; DOWNSAMP=`cat $(word 2,$^)`; \
	awk 'BEGIN {downsamp = '$$DOWNSAMP'; n = 0; nlines = '$$NLINES'; d = nlines / downsamp} {if ((NR-d/2)/d > n) {print 360*NR/nlines, $$1; n++}}' < $< > $@

binned_timeseries.png: binned_timeseries.gpi
	gnuplot $< > $@

spectrum.png: spectrum.gpi
	gnuplot $< > $@
