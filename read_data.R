setwd("/Users/Lara/Documents/Repository/harriscriminalcourt/data")
library(readr)
library(dplyr)

# prep the raw file
# detect fixed width lengths - include spaces!
s <- paste("---- ------------ -------- ---- ---- ---- ---- ---- ------ -------- ------------------------------ -------- ------- ------------------------------ ------- ------ ------------------------------ ------ -------- ---- ---- -------------------------------------------------- -------- ------- ------- -------- --------- -------------------------- ---------- ------ ------- -------------------------------------------------- -------- ------- -------------------------------------------------- ------------------------ ----------------------------------------------- --------------- -------- ------------------------------------------------------------ --------------------------------------------------")
cols <- strsplit(s, " ") %>% unlist() %>% nchar()
cols <- list(cols)
cols <- cols[[1]] +1 # add 1 to the length to account for the spaces
cols2 <- fwf_widths(cols) # convert lengths into something `read_fwf` can understand
raw <- read_fwf("DATA - Jenkins Monthly Disposition Reports.txt", cols2)
colnames(raw) <- raw[1, ] # create column names from the first row of the data frame
raw <- raw[-1, ] # drop the column name row
raw <- raw[-1, ] # drop the dash row

head(raw)

raw$fda <- as.Date(raw$fda, format = "%Y%m%d")
raw$nda <- as.Date(raw$nda, format = "%Y%m%d")
raw$def_dob <- as.Date(raw$def_dob, format = "%Y%m%d")
raw$dispdt <- as.Date(raw$dispdt, format = "%Y%m%d")



write.csv(raw, file = "/Users/Lara/Documents/Repository/harriscriminalcourt/data/parsed.csv", row.names= FALSE)
