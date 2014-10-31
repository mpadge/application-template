LL=latex
PDF=dvipdfm
SRCDIR=src/
LFLAGS=-interaction=nonstopmode -shell-escape
FILE = application


all: latex latex dvi
#all: latex latex bib pdf

latex: 
	$(LL) $(SRCDIR)$(FILE).tex $(LFLAGS) 

bib:
	bibtex $(SRCDIR)$(FILE).aux

pdf:
	$(PDF) $(SRCDIR)$(FILE).dvi

dvi:
	dvips -P pdf -q $(FILE).dvi
	ps2pdf $(FILE).ps

clean:
	rm -f *.aux *.dvi *.log *.out *.ps
