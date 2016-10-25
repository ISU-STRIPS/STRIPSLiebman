library(dplyr)
library(tidyr)

files = list.files(path = "cover_orig",
                   pattern = "*.csv",
                   full.names = TRUE)

my_write_csv = function(d) {
  year = as.character(unique(d$year))
  watershed = unique(d$watershed)
  area = unique(d$area)

  # Create directories if needed
  d1 = paste0("cover")
  d2 = paste0(d1,"/",year)
  d3 = paste0(d2,"/",watershed)

  if (!dir.exists(d1)) dir.create(d1)
  if (!dir.exists(d2)) dir.create(d2)
  if (!dir.exists(d3)) dir.create(d3)

  readr::write_csv(d %>% dplyr::select(species, percent),
                   path = paste0(d3,"/",area,".csv"))

  return(data.frame(a=1)) # to avoid Error in do()
}

for (i in seq_along(files)) {
  readr::read_csv(files[i]) %>%
    dplyr::select(-Life_History_Trait) %>%
    gather(temp, percent, -Plant_Species) %>%
    separate(col = temp, into = c("watershed","area")) %>%
    mutate(year = as.numeric(substr(gsub("[^\\d]",
                                         "",
                                         files[i],
                                         perl=TRUE),2,5)),
           area = tolower(area),
           percent = ifelse(percent==0, NA, percent)) %>%
    rename(species = Plant_Species) %>%
    na.omit %>%
    group_by(year,watershed,area) %>%
    do(my_write_csv(.))
}
