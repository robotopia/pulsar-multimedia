PERIOD = 0.44
ALPHA  = 80.5
ZETA_DECIMALS  = $(shell seq -w 0 99)
ZETAS  = $(patsubst %,80.%,$(ZETA_DECIMALS))
#ZETAS = $(shell seq -w 30 80)
WIDTH = 60

PNGS   = $(patsubst %,a$(ALPHA)_z%_P$(PERIOD).png,$(ZETAS))

.SECONDARY:

a$(ALPHA).gif: $(PNGS)
	convert -delay 20 $^ $@

#a$(ALPHA)_z%_P$(PERIOD).png: heights.gpi a$(ALPHA)_z%_P$(PERIOD).psr_polangle.txt a$(ALPHA)_z%_P$(PERIOD)_i.psr_polangle.txt heights.gpi a$(ALPHA)_z%_P$(PERIOD)_w$(WIDTH).psr_fitwidth.txt
#	gnuplot -e "set terminal pngcairo enhanced font ',20' size 1000,800; set output '$@'; zeta = '$*'; alpha = '$(ALPHA)'; period = '$(PERIOD)'; Width = '$(WIDTH)'" $<

a$(ALPHA)_z%_P$(PERIOD).png: heights.gpi a$(ALPHA)_z%_P$(PERIOD).psr_polangle.txt a$(ALPHA)_z%_P$(PERIOD)_i.psr_polangle.txt heights.gpi
	gnuplot -e "set terminal pngcairo enhanced font ',20' size 1000,800; set output '$@'; zeta = '$*'; alpha = '$(ALPHA)'; period = '$(PERIOD)'" $<

a$(ALPHA)_z%_P$(PERIOD).psr_polangle.txt:
	psr_polangle -a $(ALPHA) -z $* -P $(PERIOD) > $@

a$(ALPHA)_z%_P$(PERIOD)_i.psr_polangle.txt:
	psr_polangle -a $(ALPHA) -z $* -P $(PERIOD) -i > $@

a$(ALPHA)_z%_P$(PERIOD)_w$(WIDTH).psr_fitwidth.txt:
	psr_fitwidth -a $(ALPHA) -z $* -P $(PERIOD) -w $(WIDTH) > $@

