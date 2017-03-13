library(tidyverse)
library(sparklyr)
library(randomForest)
library(nycflights13)

# take flights dataset from nycflights13
# filter out NA values
flights <- 
  flights %>%
  filter(!is.na(arr_delay) & !is.na(distance))

# check elapsed time for random forest of the whole dataset
system.time(
  randomForest(arr_delay ~ distance, data = flights)
  )[3]