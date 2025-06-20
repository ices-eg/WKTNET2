
######################################################################################################
### Create start up code to sort out skeleton and the data to be used and defined the Data draft.
###   Ana Ribeiro Santos 19/04/2025 
#### this is done internally, just to set up things- outside TAF 
# we need to create a cover/note 
# 1. Create a TAF skeleton #taf.skeleton("example-1")
# 2. copy data from a folder to boot/intial data. All data that is going to be used. We can add data as we go through the data call season
# 3. Create the Data.bib
# 4. transfer the skeleton to TAF/github


library (icesTAF)
library (TAF)
taf.skeleton("UKE_Eng_test")##
setwd("UKE_Eng_test")
dir.tree()

### Code in boot won't run in the TAf server. Boot.r are not part of source.all(). so
#So any libraries that are needed in the estimation codes, should be done in the data.r or method.r and output.r

# copy data from a folder to boot/intial data.

#RDBES data. in the future, we might skip this step because we retrieve the data via API.
cp("../data and scripts needed/download data/H1_2024_06_10_110801.zip",
   "boot/initial/data")
cp("../data and scripts needed/download data/H5_2024_06_10_111107.zip",
   "boot/initial/data")

#landings and effrt data - this is UK specific issue
cp("../data and scripts needed/fad.effort.csv",
   "boot/initial/data")
cp("../data and scripts needed/all.landings.csv",
   "boot/initial/data")

## extra bits of data
cp("../data and scripts needed/wl.params.csv",
   "boot/initial/data")
cp("../data and scripts needed/WGNSSK_ALK_dis.Rdata",
   "boot/initial/data")
cp("../data and scripts needed/WGNSSK_ALK_lan.Rdata",
   "boot/initial/data")

##get the master table
cp ("../data and scripts needed/master.table.example.csv", "boot/initial/data")

## params setting  code
cp ("../data and scripts needed/params.r", "boot")

dir.tree()

#Create the DATA.bib file using the useful draft.data() function, 
# and add some useful information to document the data being imported 
#append = FALSE will create a new DATA.bib file
#append = TRUE will add the entry to an existing DATA.bib file

# RDBES data. 
draft.data(
  data.files = c ("H1_2024_06_10_110801.zip", "H5_2024_06_10_111107.zip", "master.table.example.csv"),
  data.scripts = NULL,
  year = 2024,
  originator = "Cefas",
  title = c ("H1", "H5", "master.table.example"),
  file = TRUE,
  append = TRUE
)

## landings and effort data
draft.data(
  data.files = c ("fad.effort.csv", "all.landings.csv"),
  data.scripts = NULL,
  year = 2024,
  originator = "Cefas",
  title = c ("UK-Eng effort", "UK-Eng landings"),
  file = TRUE,
  append = TRUE
)

## addtional data 
draft.data(
  data.files = c ( "wl.params.csv", "WGNSSK_ALK_dis.Rdata", "WGNSSK_ALK_lan.Rdata"),
  data.scripts = NULL,
  year = 2024,
  period = "2014-2024",
  originator = "Cefas",
  title = c ("W.L params", "ALKs_dis", "ALKs_lan"),
  file = TRUE,
  append = TRUE
)

## add the extra scripts
draft.data(
  data.files = NULL,
  data.scripts = "params.r",
  originator = "Cefas",
  title = c ("paramaters"),
  file = TRUE,
  append = TRUE
)


taf.boot()

#Run the command  dir.tree() to see the directory tree now in your working folder.
dir.tree()
