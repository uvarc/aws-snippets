# load the sparklyr package and others
library(sparklyr)
library(nycflights13)
library(tidyverse)

# # create the Spark context, for EMR 4.7/4.8 use version = "1.6.2" and for EMR 4.6 use "1.6.1"
# how much time does it take to connect?
connect_time <-
  system.time(
    sc <- spark_connect(master = "yarn-client", version = "2.0.0")
  )[3]

# # copy some built-in sample data to the Spark cluster
# how much time does it take to copy to spark?
transfer_time <-
  system.time(
    flights_tbl <- copy_to(sc, nycflights13::flights, "flights")
  )[3]

# see what tables are available?
# src_tbls(sc)

# how much time does it take to model?
process_time <- 
  system.time(
    flights_tbl %>%
      filter(!is.na(arr_delay) & !is.na(distance)) %>%
      ml_random_forest(arr_delay ~ distance)
  )[3]

# total time
connect_time + transfer_time + process_time

spark_disconnect(sc)
