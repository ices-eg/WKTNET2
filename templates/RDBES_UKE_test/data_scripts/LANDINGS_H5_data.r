#This code will include all the data pre-processing, filtering, etc 
library(TAF)
library(icesTAF)
library(RDBEScore)
library(data.table)

datadir <- ("boot\\data\\")
myH5RawObject <- createRDBESDataObject(input = paste0(datadir,"H5_2024_06_10_111107.zip"))
message("RDBES data loaded.")


wg = "WGNSSK"

# Dummy data for now
RDBES_data <- data.table(Area = c("27.7.d", "27.7.d", "27.7.e", "27.7.e"),
                         Species = c("COD", "HAD", "WHG", "PLE"))
                         
# Filter data for areas of interest for AWGs listed in params
RDBES_data_H5_filtered <- RDBES_data
rm(RDBES_data)
# Save filtered RDBES data
write.csv (RDBES_data_H5_filtered , "data/RDBES_data_H5_filtered.csv")
message("RDBES H5 data fetched and filtered.")
