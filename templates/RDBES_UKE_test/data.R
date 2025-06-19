## Preprocess data, write TAF data tables

## Before:
## After:

library(TAF)
library(icesTAF)

mkdir("data")

source ("data_scripts/DISCARD_H1_data.r")
message("H1 RDBES data preprocessed and saved.")

source ("data_scripts/LANDINGS_H5_data.r")
message("H5 RDBES data preprocessed and saved.")

