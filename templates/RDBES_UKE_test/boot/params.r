
df<- read.csv (taf.data.path("master.table.example.csv"))


head(df)

wg <- c("WGNSSK")


parameters <- list(
     stock_keys = unique(df[df$ExpertGroup %in% wg,]$StockKeyLabel),
     species = unique(df[df$ExpertGroup %in% wg,]$SpeciesScientificName),
     expert_groups = unique(df[df$ExpertGroup %in% wg,]$ExpertGroup),
     ices_areas = unique(df[df$ExpertGroup %in% wg,]$ICES_Area),
     fao_codes = unique(df[df$ExpertGroup %in% wg,]$fao_code),
     seasons = unique(df[df$ExpertGroup %in% wg,]$`Season (`),
     catch_components = unique(df[df$ExpertGroup %in% wg,]$Catch_comp),
     biology = unique(df[df$ExpertGroup %in% wg,]$Biol),
     fleet_levels = unique(df[df$ExpertGroup %in% wg,]$IC_fleet),
     est_areas = unique(df[df$ExpertGroup %in% wg,]$Est_area),
     est_aux = unique(df[df$ExpertGroup %in% wg,]$Est_aux)
   )

saveRDS(parameters , file = paste0("params_", wg, ".rds"))
message("Parameters created.")


