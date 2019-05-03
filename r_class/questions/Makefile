include ../../config.mk

# PANDOC Options for complete Syllabus
# SYLOPT = --toc --toc-depth=2 --number-sections 
SYLOPT = -V margin-left=2.5cm -V margin-right=2.5cm \
	-V margin-top=2cm -V margin-bottom=1.25in


chapter%.html : chapter%.rmd
	$(LORX) -e "render('$(subst .html,,$@).rmd',output_format='html_document',output_file='$@',quiet=FALSE)"

clean:
	$(LODEL) $(ALLDEST)


