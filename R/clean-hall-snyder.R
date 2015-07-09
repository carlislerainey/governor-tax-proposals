
# load packages
library(haven)  # for read_dta()
library(dplyr)  # for data management
library(readr)  # for write_csv()

# load data
hs <- read_dta("data/raw/hall-snyder.dta")

# quick look
glimpse(hs)

# pull out the gubernatorial elections
hs_new <- filter(hs, office == "G")

# pull out relevant variables
hs_new <- select(hs_new, state, year, pct_D, pct_R, pct_I, win_D, win_R, win_I)

# another quick look
glimpse(hs_new)

# write new data
write_csv(hs_new, "data/election-results.csv")