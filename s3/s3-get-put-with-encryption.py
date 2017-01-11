import boto3
import os

BUCKET = 'your-bucket-name'
KEY = os.urandom(32)
s3 = boto3.client('s3')

print("Uploading S3 object with SSE-C")
s3.put_object(Bucket=BUCKET,
              Key='encrypt-key',
              Body=b'foobar',
              SSECustomerKey=KEY,
              SSECustomerAlgorithm='AES256')
print("Done")

# Getting the object:
print("Getting S3 object...")
# Note how we're using the same ``KEY`` we
# created earlier.
response = s3.get_object(Bucket=BUCKET,
                         Key='encrypt-key',
                         SSECustomerKey=KEY,
                         SSECustomerAlgorithm='AES256')
print("Done, response body:")
print(response['Body'].read())

