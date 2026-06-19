#!/bin/bash

service=nrpe

echo "Start the script"
echo
if (( $(ps -afux | grep -v grep | grep -i $service | wc -l) > 0 ))
then
        echo "$service is running"
else
        systemctl restart $service
fi


