#BODY = $1
OUTPUT = $2

all: handout slides

.PHONY: html pdf clean

clean: 
	rm *.aux *.blg *.out *.bbl *.log

# Create the two header files

handout: 
	echo "\documentclass[handout]{beamer}" > $(OUTPUT)\_handout.Rnw
	#cat $(BODY).Rnw >> $(OUTPUT)\_handout.Rnw
	awk 'NR>1' $(OUTPUT).Rnw >> $(OUTPUT)\_handout.Rnw 	
	Rscript -e "knitr::knit2pdf('$(OUTPUT)_handout.Rnw', compiler = 'xelatex')"
	pdfunite $(OUTPUT)_handout.pdf PoissonAndExtraPoissonVariation_handout.pdf $(OUTPUT)_handout_JH.pdf
  
slides:
	echo "\documentclass{beamer}" > $(OUTPUT)\_slides.Rnw
	#cat $(BODY).Rnw >> $(OUTPUT)\_slides.Rnw
	awk 'NR>1' $(OUTPUT).Rnw >> $(OUTPUT)\_slides.Rnw 	
	Rscript -e "knitr::knit2pdf('$(OUTPUT)_slides.Rnw', compiler = 'xelatex')"
	pdfunite $(OUTPUT)_slides.pdf PoissonAndExtraPoissonVariation.pdf $(OUTPUT)_slides_JH.pdf
