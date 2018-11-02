# First argument is the name of the talk
# other arguments are ignored
TALK=$1

#mkdir $TALK
#cd $TALK/

# Create the two header files
echo -e "\documentclass[handout]{beamer}\n\input{$TALK.Rnw}" > $TALK\_handout.Rnw

echo -e "\documentclass{beamer}\n\input{$TALK.Rnw}" > $TALK\_slides.Rnw

# Create the main file
# Note: the path corresponds to where my template is located
# cp ~/.config/texstudio/templates/user/template_beamer.tex $TALK.tex

# Create the Makefile
echo -e "FILE = $TALK"'

all: $(FILE)_handout.pdf $(FILE)_slides.pdf

.PHONY: clean
clean: 
\trm *.aux *.blg *.out *.bbl *.log

$(FILE)_handout.pdf: $(FILE)_handout.Rnw $(FILE).Rnw
\tRscript -e "knitr::knit2pdf('$(FILE)_handout.Rnw', compiler = 'xelatex')
  
$(FILE)_slides.pdf: $(FILE)_slides.tex $(FILE).tex
\tRscript -e "knitr::knit2pdf('$(FILE)_slides.Rnw', compiler = 'xelatex')' > Makefile
