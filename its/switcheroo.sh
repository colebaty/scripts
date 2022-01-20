#!/usr/bin/expect -f 

# interactive script to help automate common tasks on switches
# forecast usage:   ./switcheroo <user> <switchname> <action> 
#   <user>          the `groupadm` username you were assigned
#                   recommend invoking script with `cat whoami` (including backticks)
#
#   <switchname>    the switch to be worked on
#
#   <action>        the action to be performed

set user [lindex $argv 0]
set server [lindex $argv 1]

#send_user "user:\t%s\nserver:\t%s\n" $user $server

send_user "hello $user@$server\n"

# spawn ssh

