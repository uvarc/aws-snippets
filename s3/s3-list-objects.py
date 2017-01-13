import boto3

bucket = ''

s3 = boto3.resource('s3')
bucket = s3.Bucket(bucket)
for obj in bucket.objects.all():
    print(obj.key)
