## Run repo ###################

library (icesTAF)
library (TAF)
setwd("UKE_Eng_test")



#taf.boot()
source("boot/params.r")


source.all()

source.taf("data.r")
source.taf("model.r")
source.taf("output.r")


dir.tree()
