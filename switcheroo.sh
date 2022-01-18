#!/usr/bin/expect -f

# script to help automate common tasks at ODU's ITS Networking Department
#
# usage:    ./switcheroo <user> <switch> <action>
#   <user>              the `gpadmin` username
#                       recommend use of `whoami`
#
#   <switch>            the name of the switch to be accessed
#
#   <action>            the action performed - baby steps

# variables

set _user [lindex $argv 0]
set _switch [lindex $argv 1]

set timeout 3

send_user "hello, $_user@$_switch\n"

spawn ssh "-p 2220" "$_user@$_switch" "/bin/bash"
send "touch test"

# interact
