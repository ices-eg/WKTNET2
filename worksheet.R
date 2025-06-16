
library(TAF)

setwd("2023_WKTNET_Assessment")


# server steps:
# 1. clone repository
# 2. sets WD to the repository
# 3 removes all non-TAF files and cleans folders
# 4. installs uninstalled dependencies
install.deps(
  repos = c(
    "https://ices-tools-prod.r-universe.dev",
    "https://flr.r-universe.dev",
    "https://cloud.r-project.org"
  )
)

# 5. boot the repository (
taf.boot()
# 6. source all files (
source.all()
