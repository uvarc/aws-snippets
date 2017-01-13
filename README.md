# aws-snippets
A collelction of snippets for interacting with AWS via Python/boto3

## Installations:
`pip install boto3`
`pip install awscli`
`sudo apt-get install jq / yum install jq`

## Authentication
boto3 can make use of (at least) three levels of authentication:
1. Hard-coded key/secret key (NEVER in production).
2. An application or server-level config file containing the key/secret key.
3. An IAM role specifically tailored to the EC2 instance running the code (Best practice).
