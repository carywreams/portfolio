ESSENTIALS_SRC = essentials.rmd \
ex_ch02.rmd \
ex_ch03.rmd \
ex_ch04.rmd \
ex_ch05.rmd \
ex_ch06.rmd \
ex_ch07.rmd \
ex_ch08.rmd \
ex_ch09.rmd 

ESSENTIALS_HTML = ex_ch02.html \
ex_ch03.html \
ex_ch04.html \
ex_ch05.html \
ex_ch06.html \
ex_ch07.html \
ex_ch08.html \
ex_ch09.html

essentials.html: $(ESSENTIALS_HTML)
	mv $(ESSENTIALS_HTML) ../docs/meetups/r/essentials/	

essentials.pdf: $(ESSENTIALS_SRC)
	$(LOCAT) $(ESSENTIALS_SRC) > _tmp_essentials.rmd
	$(LORX) -e "render('_tmp_essentials.rmd',output_format='pdf_document',output_file='_tmp_essentials.pdf',quiet=TRUE)"
	$(LOPS2PDF) _tmp_essentials.pdf $@
	$(LODEL) _tmp_essentials.rmd _tmp_essentials.pdf

