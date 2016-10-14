#!/bin/bash

TTY=$(grep "\/sbin\/getty" /etc/inittab | grep 'ttyS' | awk '{ print $NF }')
TTY=/dev/${TTY}

printf "\n\e[32m[Info]:\e[0m\n" > ${TTY}
printf "\tRunning Glmask 3D Graphics demo\n" > ${TTY}
printf "\n\e[31mNOTE: Click on Exit icon to exit from running applications\e[0m\n\n" > ${TTY}

glmark2-es2-wayland -b :show-fps=true &> /dev/null &

sleep 15s

killall -9 -q glmark2-es2-wayland &> /dev/null
sync
