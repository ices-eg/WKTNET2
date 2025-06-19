## Run analysis, write model results

## Before:
## After:
library(TAF)
library(icesTAF)

mkdir("model")

params <- readRDS(file = "boot/data/params/params_WGNSSK.rds")

for(awg in params$expert_groups){
  message(paste0("============",awg,"============"))
  if(awg == "WGNSSK"){
    lapply(list.files(path = "model_scripts/WGNSSK", full.names = T),source) # make sure the files are numbered to run in right order
  }
  else if(awg == "HAWG"){
    lapply(list.files(path = "model_scripts/HAWG", full.names = T),source)
  }
  else{
    stop("AWG not recognized")
  }
}
