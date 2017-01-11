import boto3

# This snippet performs a file open() in Python and then pushes that into the boto3 s3.put_object call
# Includes error handling.


def upload_image():
    # Upload to S3 with the put_object call
    client = boto3.client('s3', region_name='us-east-1')
    bucket = '<bucketname>'
    folder = 'folder/'
    image = 'picture.png'
    filepath = '/tmp/subfolder/' + image
    file = open(filepath, 'r+')
    # The key name is the full path within your bucket to the object.
    s3keyname = folder + image
    # Specify the MIME type manually -- S3 does not guess that for you unless you use the web UI
    contenttype = 'image/png'
    try:
        uploadfile = client.put_object(
        Bucket=bucket,
        Body=file,
        Key=s3keyname,
        ContentType=contenttype,
        # IMPORTANT -- the ACL setting determines the security settings for your object
        # This can be 'public-read', 'private' or 
        ACL='public-read'
        )
    except Exception, e:
        print("There has been an error in uploading the image to S3")
