#!/bin/bash

dbs=(ahosts ahostsv4 ahostsv6 aliases ethers group gshadow hosts initgroups netgroup networks passwd protocols rpc services shadow)

for n in $dbs; do
    #getent "$dbs[n]"
    echo "$dbs[$n]"
done

