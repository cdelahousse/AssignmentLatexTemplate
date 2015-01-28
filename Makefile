######################################################################
# LatexTemplate Makefile
######################################################################

MAIN_FILE   = assignment

STYLES_DIR  = styles

STYLES      = Assignment \
              NewCommands \
              HeaderStuff \
              QuestionAnswer

MAIN_TEX    = ${MAIN_FILE}.tex

PARTS_TEX   = ${addsuffix .tex,${PARTS}}

STYLES_STY  = ${addprefix ${STYLES_DIR}/,${addsuffix .sty,${STYLES}}}

PDF         = ${MAIN_FILE}.pdf

TEX         = pdflatex

TEXOPTS     = -halt-on-error

.PHONY: open clean

# if your open program isn't listed, OR (||) it to the end
open: ${PDF}
	open $< || xdg-open $<

${PDF}: ${MAIN_TEX} ${PARTS_TEX} ${FIGURES}  ${STYLES_STY}

# should probably use a tool like rubber, but this works
%.pdf: %.tex
	${TEX} ${TEXOPTS} $(basename $<)

# add stuff to delete here
clean:
	rm -f *.log *.aux *.dvi *.blg *.bbl ${PDF}
