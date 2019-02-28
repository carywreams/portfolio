
LOCAT=/bin/cat
LODEL=/bin/rm -f
LORX=/usr/bin/R
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

# convert to pdf
# compress pdf with ps2pdf
ex%.pdf:
	$(LORX) -e "render('$(subst .pdf,,$@).rmd',output_file='_tmp.pdf')"
	$(LOPS2PDF) _tmp.pdf $@
	$(LODEL) _tmp.pdf

ALLDEST = syllabus.pdf ex*ch*.pdf

all: $(ALLDEST)

clean:
	$(LODEL) $(ALLDEST)


