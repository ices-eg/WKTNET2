######################################################################
#### Estimate length distributions for landings - Market sampling####

dir_path <- file.path("model", awg)
if (!dir.exists(dir_path)) {
  dir.create(dir_path, recursive = TRUE)
}

## just for testigng use one species
interested.spp <- "COD"

# Data import and loading [Inputs]######
RDBES_data <- read.csv ("data/RDBES_data_H5_filtered.csv")
message("RDBES H5 data loaded.")


my_function <- function(data) {
  
  species1 <- unique(data$Species)
  
  data <- data |> dplyr::filter(Species == interested.spp)
  
  print(paste0("land dist for ", interested.spp))
  
  return(data)
}

len.dist <- my_function(RDBES_data)

write.csv(len.dist , file = file.path(dir_path, "land.len.dist.csv"), row.names = FALSE)
message("landings length distributions and saved in model folder")
