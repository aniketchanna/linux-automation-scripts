#!/bin/bash

echo "start the Deregistering Process of AMI in the Ec2 Instance"

# Get the Private AMI from the Ec2 Dashboard
aws ec2 describe-images --owners self | grep -i "ImageId" | awk {'print $2'} | cut -d"," -f1 | sed 's/"//g' > AmiID-latest.txt


for a in `cat /root/script/AmiID-latest.txt`
do 
aws ec2 deregister-image --image-id $a
sleep 5
echo "process is completed"
done


