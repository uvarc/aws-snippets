# Spark on Amazon EMR

This repo contains code and documentation adapted from the [AWS documentation](http://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-spark-launch.html
) ... it includes:

1. Shell script to create Amazon EMR cluster (with generic Spark platform) via AWS CLI 

To launch the cluster described in the shell script use `. emr.sh`. 

**NB** You will need to replace `{YOURKEY}` with the name of your AWS key. You may also want to adjust the size and number of nodes in the cluster.

