#!/usr/bin/bash

input=/home/cole/.ssh/authorized_keys

while IFS= read -r line
do
    ssh-keygen -lf /dev/stdin <<< $line >> keyfps
done < $input
