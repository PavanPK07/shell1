#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE "tmp|file")
DISK_THRESOLD=1
message=""

while IFS= read -r line
do
    usage=$(echo $line | awk '{print 6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print 1F}' )
    if [ $usage -ge $DISK_THRESOLD ]
    then
        message+="High disk usage detected on $partition: $usage"
    fi
done <<<$DISK_USAGE

echo "message"


