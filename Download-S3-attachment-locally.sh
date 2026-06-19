
#!/bin/bash

for a in `cat /root/script/s3-steren-download.txt`
do
aws s3 cp s3://bizmerlin-attachment/$a /home/gauravc/steren-attachment
done
echo "Process is comleted"
