
#!/bin/bash


for a in `cat /root/script/attachments.txt`
do
aws s3 rm s3://bizmerlin-attachment/$a --recursive
echo "Process is completed"
done
