# install.packages("tidyverse")
# install.packages(c("nycflights13")
library(nycflights13)
library(tidyverse)
library(sparklyr)

# set up a spark connection object
sc <- spark_connect(master = "local")

# copy the flights object from nycflights13 to spark
smallflights <- copy_to(sc, flights, "smallflights")

# is it in there?
src_tbls(sc)

# create a bigger flights object
bigflights <- 
  rbind(flights,
        flights,
        flights,
        flights,
        flights,
        flights)

# we can try this one with a csv method
write_csv(bigflights, "bigflights.csv")
rm(bigflights)

# read in the csv file and make sure that the file:// system is used and object is assigned
bigflights <- spark_read_csv(sc = sc, name = "bigflights", path = "file:///home/hadoop/bigflights.csv")

# now we can build up a query
bigflights %>%
  group_by(tailnum) %>%
  summarise(count = n(), dist = mean(distance), delay = mean(arr_delay)) %>%
  filter(count > 20, dist < 2000, !is.na(delay))

# notice the above is a "lazy query" ...
# ... if we want a tibble (so we can actually do something with this object) we need to collect()
bigflights %>%
  group_by(tailnum) %>%
  summarise(count = n(), dist = mean(distance), delay = mean(arr_delay)) %>%
  filter(count > 20, dist < 2000, !is.na(delay)) %>%
  collect()

# to disconnect from the cluster use spark_disconnect
spark_disconnect(sc)
