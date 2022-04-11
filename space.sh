#!/usr/bin/bash

# prints the percentage of hard drive usage

df -a | grep -e \/$ | awk '{print $5}'
