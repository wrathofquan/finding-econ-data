library(rvest)
library(dplyr)
ufo <- read_html("https://en.wikipedia.org/wiki/UFO_sightings_in_the_United_States")

ufo_date <- html_nodes(ufo,'td:nth-child(1)') %>% html_text() %>% 
ufo_city <- html_nodes(ufo,'td:nth-child(2)') %>% html_text() 
ufo_state <- html_nodes(ufo,'td:nth-child(3)') %>% html_text()
ufo_name <- html_nodes(ufo,'td:nth-child(4)') %>% html_text()
ufo_desc <- html_nodes(ufo,'td:nth-child(5)') %>% html_text()

ufo_df <- bind_cols(ufo_date,ufo_city)


ufo_df<-data.frame(date = ufo_date, name = ufo_name, location = ufo_state)

head(ufo_df, n =5)