import boto3

# Snippet for deleting a specific message in a queue, based on the 'handle' retrieved earlier.


# This is an example SQS queue url. Found in details of SQS queue:
queueurl = 'https://sqs.us-east-1.amazonaws.com/474683445819/AWS-ElasticMapReduce-j-3NJO2WEHD83NR'


# This fcn deletes a specific message by referencing its handle. This is used after other code has
# successfully retrieved and processed the message.
def delete_sqs_message(handle):
    client = boto3.client('sqs', region_name='us-east-1')
    req = client.delete_message(
        QueueUrl=queueurl,
        ReceiptHandle=handle
    )
