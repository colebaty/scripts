#!/bin/bash

# usage:
#   ./findusername.sh [-o <outfile>]
#
# options:
#   -o <outfile>        specify the name of <outfile>.  default is out.usr

outfile="out.usr"

if [[ $# -gt 1 ]]; then
    case "$1" in
        "-h")
            echo -e "usage:\n\t./findusername.sh [-o <outfile>]\n\n options:\n \t\t-o <outfile>\t\tspecify the name of <outfile>. default is out.usr"
            ;;
        "-o")
            outfile="$2"
            ;;
        *)
            echo "error: improper usage"
    esac
fi

touch $outfile

echo "****************************************" >> $outfile
echo "* output of command getent run against *" >> $outfile
echo "* every protocol mentioned in man page *" >> $outfile
echo "* of getent                            *" >> $outfile
echo "* `date`                               *" >> $outfile
echo "****************************************" >> $outfile
echo -e "\n\n" >> $outfile

dbs=("ahosts" "ahostsv4" "ahostsv6" "aliases" "ethers" "group" "gshadow" "hosts" 
     "initgroups" "netgroup" "networks" "passwd" "protocols" "rpc" "services" "shadow")

for n in ${dbs[@]}; 
do
    echo "===== $n =====" >> $outfile
    data=$(getent "$n" 2>/dev/null) 
    if [[ $? -eq 0 ]]; then
        echo "$data" >> $outfile
    else
        continue
    fi
done

