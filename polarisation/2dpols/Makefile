GNUPLOT = gnuplot

all: linx.gif liny.gif circLH.gif ell.gif 2freq.gif

%.gif: %.png
	convert -loop 0 -delay 3 $(basename $<)???$(suffix $<) $@
	@$(MAKE) --no-print-directory clean-still

linx.png: 2dpol.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = 100; arg3 = 0; arg4 = 0;" $< > $@

liny.png: 2dpol.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = 100; arg3 = 90; arg4 = 0;" $< > $@

circLH.png: 2dpol.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = 100; arg3 = 0; arg4 = 45;" $< > $@

ell.png: 2dpol.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = 100; arg3 = 30; arg4 = 30;" $< > $@

2freq.png: 2freq.gpi
	$(GNUPLOT) -e "arg1 = \"$(basename $@)\"; arg2 = 1000; arg3 = 0; arg4 = 45; arg5 = 1.05; arg6 = 50;" $< > $@

clean-still:
	$(RM) *[0-9][0-9][0-9].png
