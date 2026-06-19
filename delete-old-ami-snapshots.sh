#!/bin/bash

echo "Delete the Snapshots of EC2 AMI in the AWS PROD"


#Get the SnapshotId's from the AWS account
#aws ec2 --region us-east-1 describe-snapshots --owner-ids=765313141718 --query 'Snapshots[*].SnapshotId' | cut -d"," -f1 | sed 's/"//g'  > snapshots-id.txt


for a in `cat /root/script/snapshots-id.txt`
do
aws ec2 --region us-east-1 delete-snapshot --snapshot-id $a
sleep 2
echo "Process is completed"
done
