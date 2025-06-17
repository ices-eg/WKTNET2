
library(TAF)
library(icesVocab)
library(icesSD)
library(dplyr)

stock_info <- getSD(year = 2025)

stock_info <-
  stock_info |>
  select(StockKeyLabel, SpeciesScientificName, ExpertGroup)

write.taf(stock_info, quote = TRUE)

stock_area <- getCodeTypeRelation("ICES_StockCode", "ICES_Area")
#stock_fao <- getCodeTypeRelation("ICES_StockCode", "SpecASFIS")

# to get to FAO code need to go hrough worms species code

write.taf(stock_area)
#write.taf(stock_fao)
