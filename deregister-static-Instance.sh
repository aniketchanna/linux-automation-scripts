#!/bin/bash
# Author: Aniket
# Date: 05-07-2023
# Description: This script is bascially use for checking the status of Instance in the TG.


echo "check the status of target group"
targetstatus=$(aws elbv2 describe-target-health --targets Id=i-0fbd1f526cba33a95 --target-group-arn arn:aws:elasticloadbalancing:us-east-1:765313141718:targetgroup/hotstack/6fdc3d7064c508b8 | grep -i "healthy")
echo $targetstatus
echo $?
if [ $? -eq 0 ];
then
echo "no change in target group"
else
aws elbv2 deregister-targets --target-group-arn arn:aws:elasticloadbalancing:us-east-1:765313141718:targetgroup/hotstack/6fdc3d7064c508b8 --targets Id=i-06246178be3b69bb5
fi
