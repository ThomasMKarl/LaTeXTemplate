MAIN= project.tex
MAKEGLOSSARIES= makeglossaries
MAKEINDEX= makeindex
BIBTEX= biber
LATEX= lualatex
CHAPTERS= appendix/appendixA.tex appendix/appendixB.tex chapter1/chapter1.tex chapter2/chapter2.tex chapter3/chapter3.tex literature/lit.bib chapter1/section1/section1.tex chapter1/section2/section2.tex
DATA= chapter1/section1/code/1.1.code.c chapter1/section1/pictures/1.1.Bild.png chapter1/section1/plots/1.1.Plot.pgf chapter1/section2/plots/1.2.Plot.pgf chapter1/section2/tables/1.2.table.csv chapter1/section2/tables/1.2.data.dat

all:
	make project

force:
	make realclean
	$(LATEX) $(NAME)
	$(MAKEGLOSSARIES) project
	$(BIBTEX) project
	$(LATEX) $(NAME)
	$(LATEX) $(NAME)

project: $(NAME) $(CHAPTERS) $(DATA)
	$(LATEX) $(NAME)
	$(LATEX) $(NAME)

project.bbl:$(FORCEBIBER)
bib:
	$(LATEX) $(NAME)
	make project.bbl FORCEBIBTEX=forcebiber
	$(LATEX) $(NAME)
	$(LATEX) $(NAME)
forcebiber: lit.bib
	$(BIBTEX) $(MAKEGLOSSARIES) project

project.gls:$(FORCEGLOSSARY)
glossary:
	$(LATEX) $(NAME)
	make project.gls FORCEGLOSSARY=forceglossary
	$(LATEX) $(NAME)
	$(LATEX) $(NAME)
forceglossary: glossary.tex
	$(MAKEGLOSSARIES) project

clean:
	rm -rf *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls *.lot *.toc *.idx *.out *.ist *.lof *.log *.lol *.ptc *.run.xml

realclean:
	rm -rf *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls *.lot *.toc *.idx *.out *.ist *.lof *.log *.lol *.ptc *.run.xml project.pdf