#!/bin/sh

file="math697.Rmd"

if [ -f $file ] ; then
    rm $file
fi

Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"

