# Extract results of interest, write CSV output tables

# Before:
# After:

library(TAF)
library(icesTAF)


flstock <-
  artifact(
    "data/2023_cod.27.7a.rds",
    type = "FLStock",
    Year = 2023,
    ICES_StockCode = "cod.27.7a",
    check = FALSE
  )
flstock

# check hash codes for duplicates
write.artifacts(flstock, append = FALSE, check = FALSE)
