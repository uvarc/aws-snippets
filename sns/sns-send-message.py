import boto3
import botocore

# Set up the SNS client as usual
client = boto3.client('sns')
# Sending a message to SNS is called "publishing". Here is the publish call:
response = client.publish(
    TopicArn='string',
    TargetArn='string',
    PhoneNumber='string',
    Message='string',
    Subject='string',
    MessageStructure='string',
    MessageAttributes={
        'string': {
            'DataType': 'string',
            'StringValue': 'string',
            'BinaryValue': b'bytes'
        }
    }
)
