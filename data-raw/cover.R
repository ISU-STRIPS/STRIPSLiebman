library(dplyr)

source("read_dir.R")

cover = read_dir(path = "cover",
             pattern = "*.csv",
             into = c("dir","year","watershed","area","extension")) %>%
  mutate(proportion = percent/100) %>%
  dplyr::select(species, year, watershed, area, proportion)

devtools::use_data(cover, overwrite = TRUE)
