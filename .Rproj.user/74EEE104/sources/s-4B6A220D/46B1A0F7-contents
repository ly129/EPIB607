# see https://github.com/jennybc/send-email-with-r
# I set up a project for FALL 2018 called EPIB607

pacman::p_load(gmailr)

# did this once only
# gmailr::use_secret_file("~/git_repositories/epib607/EPIB607.json")
pacman::p_load(dplyr)
# pacman::p_load(purrr)

# stored on local laptop only for security reasons
emails <- read.csv("~/Documents/EPIB607.csv",
                   stringsAsFactors = FALSE)

# add column of indices used to sample from the "population" file
# for each student
emails <- emails %>% 
  mutate(I_5_start = 1L,
         I_5_end = 1L,
         I_20_start = 1L,
         I_20_end = 1L)

N.r <- nrow(emails)

OffsetAll    = 0; # sequential, from very top (optional)
OffsetDepths = 0;
OffsetLand   = 0;  

# add start and stop indices for each student
for (i in 1:N.r) {
  
  for (n in c(5,20) ) {
    I <- OffsetAll + 1:n
    OffsetAll <- OffsetAll + n
    
    if (n == 5) {
      emails[i, "I_5_start"] <- min(I)
      emails[i, "I_5_end"] <- max(I)
    } else {
      emails[i, "I_20_start"] <- min(I)
      emails[i, "I_20_end"] <- max(I)
    }
  } 
} 



renderMyDocument <- function(email, id, name, ind5, ind20) {
  rmarkdown::render(input = "exercises/water/water_exercise_epib607.Rmd",
                    output_file = sprintf("%s_water_exercise_epib607.pdf", id),
                    output_dir = "exercises/water/students/",
                    params = list(
                      email = email,
                      name = name,
                      ind5 = ind5,
                      ind20 = ind20
                      ))
}


names(emails)
BODY <- paste("See attached pdf for your randomly sampled latitudes and longitudes for the in-class
              exercise we will do on sampling distributions for means and proportions, Monday September 17.
              Note that these latitudes and longitudes are have been randomly sampled for each student in the class.")


for (i in 1:N.r) {
  renderMyDocument(email = emails[i, "Email"],
                   id = emails[i,"ID"],
                   name = emails[i, "Student.Name"],
                   ind5 = emails[i, "I_5_start"]:emails[i, "I_5_end"],
                   ind20 = emails[i, "I_20_start"]:emails[i, "I_20_end"])
  
  # msg <- 
  #   mime() %>%
  #   to(emails[i, "Email"]) %>%
  #   subject("[Fall 2018 - EPIB-607-001 - Inferential Statistics]: In-class exercise on sampling distributions") %>% 
  #   from("sahir.bhatnagar@gmail.com") %>% 
  #   html_body(BODY) %>%
  #   attach_part(BODY) %>%
  #   attach_file(sprintf("exercises/water/%s_water_exercise_epib607.pdf", emails[i,"ID"]))
  # 
  # send_message(msg)
  system(sprintf("rm exercises/water/students/%s_water_exercise_epib607.tex", emails[i,"ID"]))
  
}

emails[86,]
allLocations[2126:2130,]

recipient = c("sahir.bhatnagar@mcgill.ca")
id = "260194225"
BODY <- paste("See attached pdf for your randomly sampled latitudes and longitudes")
N.r <- length(recipient)
renderMyDocument(email = "sahir.bhatnagar@mcgill.ca",
                 id = "260194225",
                 ind = 11:20)

i = 1
MIME = gmailr::mime(from="sahir.bhatnagar@gmail.com",       
                    to=recipient[i],
                    subject="[Fall 2018 - EPIB-607-001 - Inferential Statistics]: In-class exercise on sampling distributions", 
                    body=BODY)

att <- attach_file(mime = MIME, filename = sprintf("exercises/water/%s_water_exercise_epib607.pdf", id))
MIME$body
send_message(att)

msg_body <- print(xtable(mtcars), type="html")

msg <- 
  mime() %>%
  to(recipient[i]) %>%
  from("sahir.bhatnagar@gmail.com") %>% 
  html_body(BODY) %>%
  attach_part(BODY) %>%
  attach_file(sprintf("exercises/water/%s_water_exercise_epib607.pdf", id))

send_message(msg)
