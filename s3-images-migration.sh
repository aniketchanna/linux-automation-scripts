#!/bin/bash
aws s3 ls s3://bizmerlin_images | grep -E '314959|315028' | awk {'print $4'} > data-images.txt
file=`cat /root/data-images.txt`
for i in $file
do
aws s3 cp s3://bizmerlin_images/$i s3://canada-images/
done