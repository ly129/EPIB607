# Set a default seed for reproducibility
set.seed(1337)

# Truncate output to four digits
options(digits = 4)

# Setup knitr options
knitr::opts_chunk$set(
  cache = TRUE,         
  comment = "##",
  collapse = FALSE,      
  fig.show = "hold",    
  fig.align = "center", 
  fig.width = 6,        
  fig.asp = 0.618       
)

library(magrittr)
## knitr options from: https://yihui.name/knitr/options/
## Can't display inline because of knitr giving: %InLiNe_IdEnTiFiEr%
# cache: Store all executed code and results to speed up build time
# comment: Change how the output result is shown to users
# collapse: Make the output result appear inline
# fig.show: Plots appear at _end_ of code chunks
# fig.align: Centerify the graphics (for now)
# fig.width: Set default figure width to 6 inches from 7
# fig.asp: Constant aspect ratio