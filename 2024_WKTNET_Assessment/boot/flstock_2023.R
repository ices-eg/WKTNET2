library(icesTAF)
library(dplyr)

flstocks <- test_service("flstocks")

# filter to find the one we want
stk_artifact_2023 <- getFLStock(83)

stk2023 <- stk_artifact_2023$content

saveRDS(stk2023, "stock_2023.rds")
