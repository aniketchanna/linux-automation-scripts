#!/bin/bash
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=10

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
#echo "Kindly check the disk space"
     echo Disk Space-alert |  sendmail -t  aniket@tecnostore-group.com << EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
EOF
else 
echo "disk space is haelthy"
fi
