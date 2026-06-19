#!/bin/bash

cat  /home/aniketchanna/test1

if [ $? -eq 0 ]
then
echo "File exist" | sendmail -t aniket@tecnostore-group.com
else 
echo "File doesn't exist" | sendmail -t aniket@tecnostore-group.com
fi
