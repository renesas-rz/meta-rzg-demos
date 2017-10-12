#!/bin/bash
source /home/root/.bashrc # get D_WIDTH, D_HEIGHT

TTY=$(grep "\/sbin\/getty" /etc/inittab | grep 'ttyS' | awk '{ print $NF }')
TTY=/dev/${TTY}

printf "\n\e[32m[Info]:\e[0m\n" > ${TTY}
printf "\tRunning Glmask 3D Graphics demo\n" > ${TTY}
printf "\n\e[31mNOTE: Click on Exit icon to exit from running applications\e[0m\n\n" > ${TTY}

glmark2-es2-wayland -b :show-fps=true -s $D_WIDTH'x'`expr $D_HEIGHT - 32` &> /dev/null &

sleep 15s

killall -9 -q glmark2-es2-wayland &> /dev/null
echo 3 > /proc/sys/vm/drop_caches
