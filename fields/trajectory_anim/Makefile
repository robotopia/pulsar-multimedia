FRAMES = $(shell seq -w 0 99)
PNGS   = $(patsubst %,frame_%.png,$(FRAMES))

ALPHA  = 30
ZETA   = 35
PERIOD = 0.5
TSTEP  = 0.00001

Lines = a$(ALPHA)_z$(ZETA)_P$(PERIOD).psr_lines.txt
Traj1 = a$(ALPHA)_z$(ZETA)_P$(PERIOD).psr_trajectory1.txt
Traj2 = a$(ALPHA)_z$(ZETA)_P$(PERIOD).psr_trajectory2.txt
Traj3 = a$(ALPHA)_z$(ZETA)_P$(PERIOD).psr_trajectory3.txt

TRAJ1_x = 1.093164862427368e+05
TRAJ1_y = 6.033786133885290e+01
TRAJ1_z = 1.737058933240757e+05

TRAJ2_x = 4.333247550213692e+03
TRAJ2_y = -1.374976558025348e+02
TRAJ2_z = 9.011329539153248e+03

TRAJ3_x = 4.328945902410655e+03
TRAJ3_y = 9.140021687649792e+01
TRAJ3_z = 9.013982104173327e+03

anim.gif: $(PNGS)
	convert -delay 3 $^ $@

frame_%.png: anim.gpi $(Lines) $(Traj1) $(Traj2) $(Traj3)
	gnuplot -e "set terminal pngcairo enhanced size 800,800 background rgb 'black'; set output '$@'; Lines = '$(word 2,$^)'; Traj1 = '$(word 3,$^)'; Traj2 = '$(word 4,$^)'; Traj3 = '$(word 5,$^)'; P = $(PERIOD); al = $(ALPHA); ze = $(ZETA); tstep = $(TSTEP); frame = '$*' + 0" $<

$(Lines):
	psr_lines -a $(ALPHA) -z $(ZETA) -P $(PERIOD) > $@

$(Traj1):
	psr_trajectory -a $(ALPHA) -z $(ZETA) -P $(PERIOD) -X $(TRAJ1_x),$(TRAJ1_y),$(TRAJ1_z) -t $(TSTEP) > $@

$(Traj2):
	psr_trajectory -a $(ALPHA) -z $(ZETA) -P $(PERIOD) -X $(TRAJ2_x),$(TRAJ2_y),$(TRAJ2_z) -t $(TSTEP) > $@

$(Traj3):
	psr_trajectory -a $(ALPHA) -z $(ZETA) -P $(PERIOD) -X $(TRAJ3_x),$(TRAJ3_y),$(TRAJ3_z) -t $(TSTEP) > $@
