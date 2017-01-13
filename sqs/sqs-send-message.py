import boto3

# Snippets for sending an SQS message with attributes. Note that this contains no error handling.


# This is an example SQS queue url. Found in details of SQS queue:
queueurl = 'https://sqs.us-east-1.amazonaws.com/474683445819/AWS-ElasticMapReduce-j-3NJO2WEHD83NR'

# Create the SQS client for boto3 and build message to a queue.
# Messages must have a BODY, and can then OPTIONALLY contain attributes of data types STRING, NUMBER, or BINARY.
# Total size of the message must be under 256k.
def create_next_sqs_message(jobid, mode, flow):
    client = boto3.client('sqs', region_name='us-east-1')
    req = client.send_message(
        QueueUrl=queueurl,
        MessageBody='Here is a message related to ' + jobid,
        MessageAttributes={
            'JobID': {
                'StringValue': jobid,
                'DataType': 'String'
            },
            'Mode': {
                'StringValue': mode,
                'DataType': 'Number'
            },
            'Flow': {
                'StringValue': flow,
                'DataType': 'String'
            }
        })
