singlepulse-sampled.dat: singlepulse.dat downsamp.var
	NLINES=`cat $< | wc -l`; DOWNSAMP=`cat $(word 2,$^)`; \
	awk 'BEGIN {downsamp = '$$DOWNSAMP'; n = 0; nlines = '$$NLINES'; d = nlines / downsamp} {if ((NR-d/2)/d > n) {print 360*NR/nlines, $$1; n++}}' < $< > $@
