ALPHAS = $(shell seq -w 0 10 90)

ALPHA_TARGETS = $(patsubst %,trace_alpha_%.png,$(ALPHAS))

TARGETS = s_depend.png \
		  trace.png \
		  dph.png \
		  dph_diagram.png \
		  field_line_diagram.png \
		  ret_diagram.png \
		  $(ALPHA_TARGETS)

all: $(TARGETS)

ret_diagram.png: ret_diagram.gpi
	gnuplot -e "set terminal pngcairo size 800,800; set output '$@'" $<

field_line_diagram.png: field_line_diagram.gpi
	gnuplot -e "set terminal pngcairo size 800,800; set output '$@'" $<

dph_diagram.png: dph_diagram.gpi
	gnuplot -e "set terminal pngcairo size 800,800; set output '$@'" $<

dph.png: dph.gpi  dph.dat
	gnuplot -e "set terminal pngcairo size 800,600; set output '$@'; dat = '$(word 2,$^)'" $<

trace_alpha_%.png: trace_alpha.gpi
	gnuplot -e "set terminal pngcairo size 600,800; set output '$@'; alpha = '$*' + 0" $<

%.png: %.gpi  %.dat
	gnuplot -e "set terminal pngcairo size 600,800; set output '$@'; dat = '$(word 2,$^)'" $<

s_depend.dat:
	psr_beam -d -a 0 -g 400 -P 0.5 -s 0.45:0.55 -z 10 -n 500 -f 302:352 -O -N 7 > $@

trace.dat:
	psr_beam -d -a 0 -g 400 -P 0.5 -s 0.48:0.52 -z 10 -n 50 -f 0:10000 -O -N 1 > $@

dph.dat:
	psr_beam -d -a 0 -g 400 -P 0.5 -s 0.499:0.501 -z 10 -n 1 -f 0:10000 -O -N 1 > $@

clean:
	$(RM) sparks.dat $(PNGS) anim.gif
