# Cover 

This README describes how to create the `cover` data set. 

## To long didn't read

Run `run_all.R` (which also recreates all other data sets) or 

1. Replace files in cover_orig/
1. Run extract_cover.R
1. Run cover.R

## Details

cover_orig/ contains the original data files that were received

the `extract_cover.R` script extracts data from cover_orig/ files and rewrites
them into cover/ in the file structure that seems more reasonable (to me)

cover/ contains the data in a succinct format

cover.R creates the cover data set from the files in cover/
