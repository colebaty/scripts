#!/bin/bash

dhclient -r enp1s0f0
sleep 2s
dhclient -1 enp1s0f0
