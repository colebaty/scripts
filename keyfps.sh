#!/usr/bin/bash

input=/home/cole/.ssh/authorized_keys

while IFS= read -r line
do
    filename=`echo $line | awk '{print $3}'`
    touch $filename.keyfp
    echo $line > $filename.keyfp
    ssh-keygen -lf $filename.keyfp
done < $input
