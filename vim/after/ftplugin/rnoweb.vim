let &l:makeprg = "Rscript -e 'library(knitr); knit(\"%\"); purl(\"%\")' && latexmk -pdf"
