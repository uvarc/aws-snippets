import boto3

# Snippets for checking a queue for messages and then retrieving one. Note that this contains no error handling.


# This is an example SQS queue url. Found in details of SQS queue:
queueurl = 'https://sqs.us-east-1.amazonaws.com/474683445819/AWS-ElasticMapReduce-j-3NJO2WEHD83NR'

# Check queue for presence of any messages (ideal for steady cron-based polling):
def get_queue_count():
    client = boto3.client('sqs', region_name='us-east-1')
    currentcount = client.get_queue_attributes(
        QueueUrl=queueurl,
        AttributeNames=[
            'ApproximateNumberOfMessages',
        ]
    )['Attributes']['ApproximateNumberOfMessages']
    if int(currentcount) == 0:
        print("0 messages in the queue.")
    else:
        check_sqs_queue()

# Get a message if msgs > 0:
def check_sqs_queue():
    # Create the boto client for SQS:
    client = boto3.client('sqs', region_name='us-east-1')
    # Build the request. Note that you'll grab message [0] but that could be in any random order unless you specify FIFO
    req = client.receive_message(
        QueueUrl=queueurl,
        # Messages can have 0 or many attributes of types STRING, NUMBER and BINARY. Message attributes can be up to 256KB total (all attributes together).
        MessageAttributeNames=[
            'JobID',
            'Times',
        ],
        WaitTimeSeconds=20,
        MaxNumberOfMessages=1
    )['Messages'][0]
    global handle, jobid, times
    # Pull out these values into vars:
    # ReceiptHandle useful later when you want to delete msg.
    handle = req['ReceiptHandle']
    jobid = req['MessageAttributes']['JobID']['StringValue']
    times = req['MessageAttributes']['Times']['StringValue']
