# modified from  
# https://raw.githubusercontent.com/moderndive/moderndive_book/master/purl.R

if(!dir.exists("docs/scripts")){
  dir.create("docs")
  dir.create("docs/scripts")
}

# Note order matters here:
chapter_titles <- c("intro",
                    "probability",
                    "discrete",
                    "continuous",
                    "Rtutorial")
chapter_numbers <- stringr::str_pad(
  string = 1:(length(chapter_titles) ),
  width = 2,
  side = "left",
  pad = "0"
)
for(i in seq_len(length(chapter_numbers))){
  Rmd_file <- stringr::str_c(chapter_numbers[i], "-",
                             chapter_titles[i], ".Rmd")
  R_file <- stringr::str_c("docs/scripts/", chapter_numbers[i],
                           "-", chapter_titles[i], ".R")
  knitr::purl(Rmd_file, R_file)
}