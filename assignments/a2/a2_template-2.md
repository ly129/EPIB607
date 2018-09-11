---
title: "STAT XXX HW 1"
author: "Your Name Here"
date: "2018-09-11"
output:
  html_document:
    toc: true
    toc_float: false
    number_sections: true
    toc_depth: 4
    keep_md: true
editor_options: 
  chunk_output_type: console
---



## Notes on the YAML header

- Be sure to change the title and author fields
- The date is automatically set to the current day when knitting
- The `header-includes` portion loads a personal sheet of LaTeX macros. I recommend making one of these as well as it can greatly speed up the time to input math. See my personal macro file `hayesmacros.sty` as a starting point. If you aren't going to load a \LaTeX macro file, remove those lines.
    - `hayesmacros.sty` needs to be in the same folder as this file

# Problem 1

Your homework goes here

Briefly, some of the custom latex macros: $y = \b x + \e$. Also, some code:


```
## 
## Call:
## lm(formula = hp ~ ., data = mtcars)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -38.681 -15.558   0.799  18.106  34.718 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)   
## (Intercept)  79.0484   184.5041   0.428  0.67270   
## mpg          -2.0631     2.0906  -0.987  0.33496   
## cyl           8.2037    10.0861   0.813  0.42513   
## disp          0.4390     0.1492   2.942  0.00778 **
## drat         -4.6185    16.0829  -0.287  0.77680   
## wt          -27.6600    19.2704  -1.435  0.16591   
## qsec         -1.7844     7.3639  -0.242  0.81089   
## vs           25.8129    19.8512   1.300  0.20758   
## am            9.4863    20.7599   0.457  0.65240   
## gear          7.2164    14.6160   0.494  0.62662   
## carb         18.7487     7.0288   2.667  0.01441 * 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 25.97 on 21 degrees of freedom
## Multiple R-squared:  0.9028,	Adjusted R-squared:  0.8565 
## F-statistic:  19.5 on 10 and 21 DF,  p-value: 1.898e-08
```

Yet more text, and another code section:


                      mpg   cyl   disp    hp   drat      wt    qsec   vs   am   gear   carb
------------------  -----  ----  -----  ----  -----  ------  ------  ---  ---  -----  -----
Mazda RX4            21.0     6    160   110   3.90   2.620   16.46    0    1      4      4
Mazda RX4 Wag        21.0     6    160   110   3.90   2.875   17.02    0    1      4      4
Datsun 710           22.8     4    108    93   3.85   2.320   18.61    1    1      4      1
Hornet 4 Drive       21.4     6    258   110   3.08   3.215   19.44    1    0      3      1
Hornet Sportabout    18.7     8    360   175   3.15   3.440   17.02    0    0      3      2
Valiant              18.1     6    225   105   2.76   3.460   20.22    1    0      3      1

# Code


```r
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
```
