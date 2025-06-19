## Extract results of interest, write TAF output tables

## Before:
## After:

#create a path for each working group
dir_path <- file.path("output", awg)
if (!dir.exists(dir_path)) {
  dir.create(dir_path, recursive = TRUE)
}

library(TAF)

mkdir("output")

interested.spp <- "COD"

###bring all the model outputs
# only getting one just for testing
age.dis  <- read.csv ("model/age.dist.csv")
# bring landings
#bring the effort
#bring the disc estimates
##make the RCEF format

generateRCEF <- function(data){
  message(paste0(interested.spp," RCEF created"))
}

RCEF <- generateRCEF(age.dis)
write.csv(RCEF , file = file.path(dir_path, "RCEF_output.csv"), row.names = FALSE)
message("RCEF outputs saved in output")
## this will have multiple table outputs
