
# load packages
library(haven)  # for read_dta()
library(dplyr)  # for data management
library(readr)  # for write_csv()

# load data
winters <- read_dta("data/raw/winters.dta")

# quick look
glimpse(winters)

# pull out relevant variables
winters_new <- select(winters, fy, zip, state, govsales, govinctax, govcorpinc,
											govcigtob, govalkie, govothers, govfees, govtotals)

# rename variables
winters_new <- rename(winters_new, year = fy, 
											state_abbr = zip,
											proposed_sales_tax_change = govsales,
											proposed_income_tax_change = govinctax,
											proposed_business_tax_change = govcorpinc,
											proposed_cigarette_tax_change = govcigtob,
											proposed_motor_fuel_tax_change = govalkie,
											proposed_other_tax_change = govothers,
											proposed_fee_change = govfees,
											total_proposed_change = govtotals)

# another quick look
glimpse(winters_new)

# write new data
write_csv(winters_new, "data/budget-proposal.csv")