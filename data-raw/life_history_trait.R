library(dplyr)

files = list.files(path = "cover",
                   pattern = "*.csv",
                   full.names = TRUE)

ds = list()
for (i in seq_along(files)) {
  ds[[i]] = readr::read_csv(files[i], na="")
  names(ds[[i]]) = tolower(names(ds[[i]]))

  ds[[i]] = ds[[i]] %>%
    rename(species = plant_species) %>%
    dplyr::select(species, life_history_trait)
}

life_history_trait = unique(bind_rows(ds)) %>%
  arrange(species) %>%
  na.omit

# any duplicates
stopifnot(!anyDuplicated(life_history_trait$species))

devtools::use_data(life_history_trait, overwrite = TRUE)
