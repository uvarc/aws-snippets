# `sparklyr` on Amazon EMR

This repo contains code and documentation adapted from the [AWS Big Data blog](https://aws.amazon.com/blogs/big-data/running-sparklyr-rstudios-r-interface-to-spark-on-amazon-emr/) ... it includes:

1. Shell script to create Amazon EMR cluster (with `sparklyr` and RStudio server installed) via AWS CLI 
2. Local benchmarking script
3. Cluster benchmarking script
4. General `sparklyr` example script

To launch the cluster described in the shell script use `. emr.sh`. 

**NB** You will need to replace `{YOURKEY}` with the name of your AWS key. You may also want to adjust the size and number of nodes in the cluster.


