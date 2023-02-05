#!/bin/bash

# test for ssh-agent socket. if socket exists, exports applicable environment
# variables to current bash environment. So far only tested with bash
#
# add the line below to your .*shrc file for persistence in new shells,
# replacing the path with the location where this script is saved. the
# "2>/dev/null" will supress the error message that prints when there is no
# active socket

# source /path/to/this/script 2>/dev/null

# bash-foo to test for an ssh-agent socket in /tmp
if [ -S /tmp/ssh*/*agent* ]; then 
    echo "ssh-agent socket exists"

    # grabs the first socket owned by the current user
    socket=$(find /tmp -name "*agent*" -user `whoami` | head -n1 2>/dev/null)

    # the first time ssh-agent is called, the socket is created with that PID.
    # after the socket is created, ssh-agent forks into the background, and the
    # child process has a PID that is one more than that of the parent process

    ppid=$(echo $socket | awk -F'\.' '{print $2}' 2>/dev/null) # parent process
    pid=$(($ppid + 1)) # pid of child forked into background

    echo "socket: $socket"
    echo "pid: $pid"
    export SSH_AUTH_SOCK=$socket
    export SSH_AGENT_PID=$pid
fi
