## code for length age conversion #####
#### STILL UNDER DEVELOPMENT!!!! 
####STARTED WRITING THE CODE, BUT STILL NEEDS TO BE FINISHED!!!
dir_path <- file.path("model", awg)
if (!dir.exists(dir_path)) {
  dir.create(dir_path, recursive = TRUE)
}

interested.spp <- "COD"

#write.csv (LD_disc, "Estimation\\method\\n.at.len.disc.csv")
LD_disc <- read.csv(file = file.path(dir_path, "disc.len.dist.csv"))

## get the alk's## Maybe gos to params... At the moment leave it here
load("boot\\data\\WGNSSK_ALK_lan.Rdata")
load("boot\\data\\WGNSSK_ALK_dis.rdata")

my_function <- function(data) {
  
  species1 <- unique(data$Species)
  
  data <- data |> dplyr::filter(Species == interested.spp)
  
  print(paste0("disc age dist for ", interested.spp))
  
  return(data)
}

age.dist <- my_function(LD_disc)

write.csv(age.dist, file = file.path(dir_path, "age.dist.csv"), row.names = FALSE)
message("discards age distributions saved in model folder")





