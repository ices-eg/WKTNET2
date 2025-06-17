
MasterTable <- tibble(
  stocks = c("sol.27.7fg", "sol.27.7d", "ple.27.7fg", "ple.27.7d", "mon.27.78abd"),
  year = rep(2024, 5),
  YearQuarter = rep("Year", 5),
  metier = rep("TBB_DEF_70-99_0_0", 5),
  Age_Length = c("ALL", "ALL", "ALL", "ALL", "LENGTH"),
  weightparam = rep("calc", 5),
  misrep = c(1.15241, 1.00000, 1.00000, 1.00000, 1.00000),
  WG = c("WGCSE", "WGNSSK", "WGCSE", "WGNSSK", "WGCSE")
)
MasterTable

write.taf(MasterTable)
