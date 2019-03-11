
LOCAT=/bin/cat
LODEL=/bin/rm -f
LORX=/usr/bin/R --silent 
LOPANDOC=/usr/bin/pandoc
LOPS2PDF=/usr/bin/ps2pdf
TMPPDF=./stdout.pdf

# PANDOC Options for complete Syllabus
# SYLOPT = --toc --toc-depth=2 --number-sections 
SYLOPT = -V margin-left=2.5cm -V margin-right=2.5cm \
	-V margin-top=2cm -V margin-bottom=1.25in

# Ordered List of README files making up complete Syllabus
SYLSRC = README.md _pb.md syllabus.md

# Create the complete Syllabus from the README docs
syllabus.pdf: $(SYLSRC)
	$(LOCAT) $(SYLSRC) | $(LOPANDOC) $(SYLOPT) -o $(TMPPDF) | $(LOPS2PDF) - $@

include config.essentials.mk

# convert to pdf
# compress pdf with ps2pdf
ex%.pdf: ex%.rmd
	$(LORX) -e "render('$(subst .pdf,,$@).rmd',output_file='_tmp.pdf',quiet=TRUE)"
	$(LOPS2PDF) _tmp.pdf $@
	$(LODEL) _tmp.pdf

ex%.html : ex%.rmd
	$(LORX) -e "render('$(subst .html,,$@).rmd',output_file='$@',quiet=TRUE)"

essentials.html: $(ESSENTIALS_HTML)
	mv $(ESSENTIALS_HTML) ../docs/meetups/r/essentials/	

essentials.pdf: $(ESSENTIALS_SRC)
	$(LOCAT) $(ESSENTIALS_SRC) > _tmp_essentials.rmd
	$(LORX) -e "render('_tmp_essentials.rmd',output_file='_tmp_essentials.pdf',quiet=TRUE)"
	$(LOPS2PDF) _tmp_essentials.pdf $@
	$(LODEL) _tmp_essentials.rmd _tmp_essentials.pdf

ALLDEST = syllabus.pdf ex*ch*.pdf

all: $(ALLDEST)

clean:
	$(LODEL) $(ALLDEST)


