# Don't worry if the system files do not exist
.PHONY: html pdf

all: build pdf purl git clean


html:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook", clean = TRUE)'
#	cp -fvr css/style.css _book/
	# cp -fvr images _book/
#	cp -fvr _main.utf8.md _book/main.md

# Create the gitbook and then launch it inside of a browser
build:
	make html
	Rscript -e 'browseURL("_book/index.html")'

#html:
#	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
#	Rscript -e "browseURL('_book/index.html')"

# Create a pdf and then open it with the system pdf handler
pdf:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book")'
	Rscript -e "browseURL('_book/epib607.pdf')"

purl:
	if [ ! -d "docs/scripts" ]; then  mkdir docs/scripts; fi
	R CMD BATCH /home/sahir/git_repositories/epib607/purl.R
	rm purl.Rout

# Clean up on isle 7
clean:
	Rscript -e "bookdown::clean_book(TRUE)"
	rm -rfv _bookdown_files *.log .Rproj.user/ *.utf8.md

git:
	git checkout master
	git add -fA
	git commit --allow-empty -m "$(foo)"
	git push -f -q origin master

