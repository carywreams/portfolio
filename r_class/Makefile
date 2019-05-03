include ../config.mk

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
	$(LORX) -e "render('$(subst .pdf,,$@).rmd',output_format='pdf_document',output_file='_tmp.pdf',quiet=TRUE)"
	$(LOPS2PDF) _tmp.pdf $@
	$(LODEL) _tmp.pdf

chapter%.html : answers/chapter%.rmd
	$(LORX) -e "render('answers/$(subst .html,,$@).rmd',output_format='html_document',output_file='$@',quiet=FALSE)"

class%.pdf: class%.rmd
	$(LORX) -e "render('$(subst .pdf,,$@).rmd',output_format='pdf_document',output_file='_tmp.pdf',quiet=TRUE)"
	$(LOPS2PDF) _tmp.pdf $@
	$(LODEL) _tmp.pdf

ALLDEST = syllabus.pdf ex*ch*.pdf

all: $(ALLDEST)

clean:
	$(LODEL) $(ALLDEST)


