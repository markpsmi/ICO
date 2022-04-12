#!/bin/bash
IpAddress=$1
timer=0
printf "%s" "waiting for OS to install ..."
while ! ping -c 1 -n -w 1 $IpAddress &> /dev/null
do
    printf "%c" "."
    sleep 60
    timer=$((timer+1))
    if [ "$timer" -gt 60 ]; then
      printf "\n%s\n"  "OS Failed to install - Timed Out"
      exit 1
    fi
done
printf "\n%s\n" "OS Installed Successfully"
exit 0
