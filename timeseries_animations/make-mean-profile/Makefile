TIMESERIES = $(shell findrepo "PKS.*J0630")/timeseries/dataset.dat
ARCHIVE    = $(shell findrepo "PKS.*J0630")/archive/J0630-2834_1.ar
NBINSFILE  = $(shell findrepo "PKS.*J0630")/archive/nbins
NBINS      = $(shell cat $(NBINSFILE))

profile.png: profile.gpi $(TIMESERIES) nbins
	gnuplot -e "arg1 = \"$(word 2,$^)\"; arg2 = \"$(basename $@)\"; arg3 = 425; arg4 = 25; arg5 = $(NBINS);" $< > $@

data_mean_%.txt: data.txt
	pdv -tFCT $< | tail -n +2 > $@

data.txt: $(TIMESERIES)
	sed "0~1024G;" < $< > $@

nbins: $(NBINSFILE)
	cp $< $@

clean:
	$(RM) profile*.png
