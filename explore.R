setwd("/Users/Lara/Documents/Repository/harriscriminalcourt/data")
library(readr)
library(dplyr)
library(anytime)

raw <- read.csv('parsed.csv', stringsAsFactors =FALSE)
# needs arguments to rad in "fda" as a date



min(raw$fda)
#"19690206
max(raw$fda)
#"fected)"

date <- anytime(raw$fda)
max(date)
#NA
min(date)
#NA
head(date)
# "1969-02-06 CST" "1969-03-28 CST" "1970-01-20 CST" "1970-01-20 CST" "1970-01-20 CST" "1970-01-20 CST"
tail(date)
#"1994-12-22 CST" "1994-12-24 CST" "1994-12-25 CST" "1994-12-28 CST" "1994-12-30 CST" NA 

