NAME= project.tex
MAKEGLOSSARIES= makeglossaries
MAKEINDEX= makeindex
BIBTEX= biber
LATEX= lualatex
CHAPTERS= appendix/appendixA.tex appendix/appendixB.tex chapter1/chapter1.tex chapter2/chapter2.tex chapter3/chapter3.tex literature/lit.bib chapter1/section1/section1.tex chapter1/section2/section2.tex
DATA= chapter1/section1/code/1.1.code.c chapter1/section1/pictures/Bild.png chapter1/section1/plots/1.1.Plot.pgf chapter1/section2/plots/1.2.Plot.pgf chapter1/section2/tables/1.2.table.csv chapter1/section2/tables/1.2.data.dat

## all       : compiles main file twice
.PHONY: all
all:
	make project

## force     : delete helper files, compiles, makes bibliography, makes index, makes glossaries, compiles twice
.PHONY: force
force:
	make realclean
	$(LATEX) $(NAME)
	$(MAKEGLOSSARIES) project
	$(MAKEINDEX) project
	$(BIBTEX) project
	$(LATEX) $(NAME)
	$(LATEX) $(NAME)

## project   : compiles main file twice
.PHONY: project
project: $(NAME) $(CHAPTERS) $(DATA)
	$(LATEX) $(NAME)
	$(LATEX) $(NAME)

## biber     : makes bibliography
.PHONY: biber
biber: literature/lit.bib
	$(BIBTEX) project

## glossary  : makes glossaries
.PHONY: glossary
glossary: glossary.tex
	$(MAKEGLOSSARIES) project

## index     : makes index
.PHONY: index
index:
	$(MAKEINDEX) project

## clean     : deletes helper files
.PHONY: clean
clean:
	rm -rf *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls *.lot *.toc *.idx *.out *.ist *.lof *.log *.lol *.ptc *.loe *.ilg *.ind *.tex.bak *.run.xml

## realclean : deletes helper file and pdf
.PHONY: realclean
realclean:
	rm -rf *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls *.lot *.toc *.idx *.out *.ist *.lof *.log *.lol *.ptc *.run.xml *.loe *.ilg *.ind *.tex.bak project.pdf


.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
