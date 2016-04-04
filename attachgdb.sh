#!/bin/bash
if [ -z "$1" ]
  then
    echo "A binary must be specified"
    exit
fi

BIN="/exploits/$1"

PID="$(sudo netstat -tupn | grep ESTABLISHED | grep $1 | awk '{print $7}' | awk -F '/' '{print $1}')"

if [ -z "$PID" ]
  then
    echo "No established connection found"
    exit
fi

sudo gdb $BIN $PID
