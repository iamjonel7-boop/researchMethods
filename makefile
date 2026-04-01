all : clean ch1 ch2 ch3 ch4 pdf

ch1: org/introduction.org
	pandoc org/introduction.org -f org -t latex --bibliography=references.bib --natbib -o chapters/introduction.tex
	echo "intro"

ch2: org/review.org
	pandoc org/review.org -f org -t latex --bibliography=references.bib --natbib -o chapters/review.tex
	echo "review"

ch3: org/techbackground.org
	pandoc org/techbackground.org -f org -t latex --bibliography=references.bib --natbib -o chapters/techbackground.tex
	echo "techbackground"

ch4: org/methodology.org
	pandoc org/methodology.org -f org -t latex --bibliography=references.bib --natbib -o chapters/methodology.tex
	echo "methodology"

pdf: sp.tex
	pdflatex sp.tex
	bibtex sp
	pdflatex sp.tex
	pdflatex sp.tex

clean:
	find . -type f -name '*.aux' -delete
	rm -rf *.bbl *.blg *.idx *.lof *.log *.toc *.synctex.gz *.lot
