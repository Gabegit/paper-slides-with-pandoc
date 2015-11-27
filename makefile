
# define a template
latex_template=template/mytemplate.tex
css=pandoc.css
docsty=template/word-styles-reference-01.docx

# Build a number of formats into the `out/` directory. These will get published via Github pages.

# create a outdir directory
outdir=out

$(outdir): 
	mkdir -p $(outdir)

# define files
SRC = $(wildcard *.md)
SRC_FILES := $(filter-out readme.md, $(SRC)) # exclude readme.md


PDFS=$(SRC:.md=.pdf)
DOCXS=$(SRC:.md=.docx)
HTMLS=$(SRC:.md=.html)

# commands
pdf: clean $(outdir) $(PDFS)
doc: $(DOCXS)
html: $(HTMLS)

all: clean $(outdir) $(PDFS) doc html

# rules
%.pdf: %.md
	pandoc --toc -N --filter /usr/local/bin/pandoc-citeproc --table-of-contents --toc-depth 2 --template=$(latex_template) --latex-engine=xelatex  -f markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash $< -o $(outdir)/$(addsuffix -art.pdf,$(basename $@))

%.docx: %.md
	pandoc  -N --reference-docx=$(docsty) --filter pandoc-citeproc  --highlight-style=haddock -f markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash-implicit_figures $< -o $(outdir)/$@

%.html: %.md
	pandoc --filter /usr/local/bin/pandoc-citeproc  --css=$(css) --mathjax  --highlight-style=haddock --smart --standalone  --table-of-contents --toc-depth 3 -f markdown -t html $< -o $(outdir)/$@
	cp $(css) $(outdir)



read: $(PDFS)
	open $< &

clean:
	rm -rf $(outdir)/*.pdf $(outdir)/*.html $(outdir)/*.docx

distclean:
	rm -rf *~
