echo "you are about to launch an aws emr cluster ..."

echo "what kind of nodes (instance types) do you want in your cluster?"
read tnodes

echo "how many of these nodes would you like in your cluster?"
read nnodes

echo "what is your aws key?"
read awskey


aws emr create-cluster --applications Name=Hadoop Name=Spark Name=Hive Name=Pig Name=Tez Name=Ganglia \
--release-label emr-5.2.0 --name "EMR 5.2.0 RStudio + sparklyr" --service-role EMR_DefaultRole \
--instance-groups InstanceGroupType=MASTER,InstanceCount=1,InstanceType=m3.2xlarge \
InstanceGroupType=CORE,InstanceCount=$nnodes,InstanceType=$tnodes --bootstrap-actions \
Path=s3://aws-bigdata-blog/artifacts/aws-blog-emr-rstudio-sparklyr/rstudio_sparklyr_emr5.sh,\
Args=["--rstudio","--sparkr","--rexamples","--plyrmr","--rhdfs","--sparklyr"],\
Name="Install RStudio" --ec2-attributes InstanceProfile=EMR_EC2_DefaultRole,KeyName=$awskey \
--configurations '[{"Classification":"spark","Properties":{"maximizeResourceAllocation":"true"}}]' \
--region us-east-1
