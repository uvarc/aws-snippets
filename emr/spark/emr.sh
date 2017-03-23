aws emr create-cluster --name "Spark cluster" --release-label emr-5.4.0 --applications Name=Spark \
--ec2-attributes KeyName={YOURKEY} --instance-type m3.xlarge --instance-count 3 --use-default-roles
