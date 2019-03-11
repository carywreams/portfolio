include ../../config.mk

HTMLDEST = ../../docs/experiments/uil

# report.pdf: report.rmd
# 	$(LORX) -e "library(rmarkdown);render(\"$<\")"


%.pdf: %.rmd
	$(LORX) -e "render(\"$<\",output_format='pdf_document',output_file='_tmp.pdf',quiet=TRUE)"
	$(LOPS2PDF) _tmp.pdf $@
	$(LODEL) _tmp.pdf

%.html: %.rmd
	# $(LORX) -e "render('$(subst .html,,$@).rmd',output_format='html_document',output_file='$@',quiet=TRUE)"
	$(LORX) -e "render(\"$<\",output_format='html_document',output_file='$(HTMLDEST)/$@',quiet=TRUE)"

