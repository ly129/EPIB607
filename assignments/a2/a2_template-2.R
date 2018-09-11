## ----include = FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  echo = FALSE,          # don't show code
  warning = FALSE,       # don't show warnings
  message = FALSE,       # don't show messages (less serious warnings)
  cache = FALSE,         # set to TRUE to save results from last compilation
  fig.align = "center"   # center figures
)

# library(tidyverse)       # load libraries you always use here
# library(tidymodels)
library(knitr)           # require for purl function to create code appendix
set.seed(27)             # make random results reproducible

this_file <- "a2_template-2.Rmd"  # used to automatically generate code appendix

## ------------------------------------------------------------------------
fit <- lm(hp ~ ., mtcars)
summary(fit)

## ------------------------------------------------------------------------
kable(head(mtcars))

## ----code = readLines(purl(this_file, documentation = 1)), echo = T, eval = F----
## # this R markdown chunk generates a code appendix

