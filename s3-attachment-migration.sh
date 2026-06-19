#!/bin/bash
file=`cat /root/phh-data.txt`
for i in $file
do
aws s3 cp s3://bizmerlin-attachment/$i /home/centos/phh-attachment-data/
done