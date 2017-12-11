#!/usr/bin/env python

import json
import boto3
import datetime


ec2 = boto3.client('ec2')

today = datetime.date.today()
weekago = today - datetime.timedelta(days=7)

todayz = today.strftime("%Y%m%d")
weekagoz = weekago.strftime("%Y%m%d")
weekfilter = "*" + weekagoz
todayfilter = "*" + todayz

def lambda_handler(event, context):
    
    response = ec2.describe_instances(
        MaxResults=99
    )

    ids = []

    for r in response['Reservations']:
      for i in r['Instances']:
        # print i['InstanceId']
        ids.append(i['InstanceId'])

    for instance in ids:
        AmiName = instance + '-' + str(todayz)
        response = ec2.create_image(
            DryRun=False,
            InstanceId=instance,
            NoReboot=True,
            Name=AmiName,
            Description='Weekly backup AMI run via Lambda'
        )

    remove_old()
    #print(ids)
    print("AMI Creation completed")


def remove_old():
    
    response = ec2.describe_images(
        Filters=[
            {
                'Name': 'name',
                'Values': [
                    weekfilter,
                ]
            },
        ],
        Owners=[
            '123456789012',
        ],
    )

    ids = []

    for r in response['Images']:
      print r['ImageId']
      ids.append(r['ImageId'])
    
    for id in ids:
      del_response = ec2.deregister_image(
        ImageId=id,
        DryRun=False
      )
      print(del_response)
      
    print("AMI Deletion completed - for week-old images")
