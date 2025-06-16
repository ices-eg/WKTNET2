library(TAF)

taf.skeleton("2024_WKTNET_Assessment")
taf.skeleton("2023_WKTNET_Assessment")

setwd("2023_WKTNET_Assessment")

# copy 2022 stock into assessment repo
cp(
  "d:/TAF_server/Artifacts/FLstocks/cod.27.7a.rds",
  "boot/initial/data"
)

# write DATA.bib
draft.data(
  originator = "ICES, WGCSE",
  title = "Cod (Gadus morhua) in Division 7.a (Irish Sea)",
  year = 2022,
  period = "1968-2021",
  file = TRUE,
  append = FALSE
)

taf.boot()

setwd("..")


#endregion
test <- getFLStock(83)

setwd("2024_WKTNET_Assessment")

TAF::draft.data(
  originator = "ICES, WGCSE",
  title = "Cod (Gadus morhua) in Division 7.a (Irish Sea)",
  year = 2023,
  period = "1968-2022",
  file = TRUE,
  append = FALSE
)
