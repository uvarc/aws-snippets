aws emr create-cluster --applications Name=Hadoop Name=Spark Name=Hive Name=Pig Name=Tez Name=Ganglia \
--release-label emr-5.2.0 --name "EMR 5.2.0 RStudio + sparklyr" --service-role EMR_DefaultRole \
--instance-groups InstanceGroupType=MASTER,InstanceCount=1,InstanceType=m3.2xlarge \
InstanceGroupType=CORE,InstanceCount=5,InstanceType=m3.2xlarge --bootstrap-actions \
Path=s3://aws-bigdata-blog/artifacts/aws-blog-emr-rstudio-sparklyr/rstudio_sparklyr_emr5.sh,\
Args=["--rstudio","--sparkr","--rexamples","--plyrmr","--rhdfs","--sparklyr"],\
Name="Install RStudio" --ec2-attributes InstanceProfile=EMR_EC2_DefaultRole,KeyName={YOURKEY} \
--configurations '[{"Classification":"spark","Properties":{"maximizeResourceAllocation":"true"}}]' \
--region us-east-1
