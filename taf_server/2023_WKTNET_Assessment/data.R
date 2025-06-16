# Prepare data, write CSV data tables

# Before:
# After:

library(TAF)
library(FLCore)

mkdir("data")

# read in 2022 stockassessment
stk2022 <- readRDS("boot/data/cod.27.7a.rds")
# equivalent to:
# stk2022 <- readRDS(taf.data.path("cod.27.7a.rds"))

# add in 2022 data for the 2023 assessment
stk2023 <- window(stk2022, end = 2022)
desc(stk2023) <- "ICES,SS3,2023"

catch.n(stk2023)[, "2022"] <- catch.n(stk2023)[, "2021"]
catch.n(stk2023)

# fill out more fully later

# save to data directory
saveRDS(stk2023, "data/2023_cod.27.7a.rds")
