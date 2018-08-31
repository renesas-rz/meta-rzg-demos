#!/bin/bash
source /home/root/.bashrc

TTY=$(grep "\/bin\/start_getty" /etc/inittab | grep 'ttyS' | awk '{ print $3 }')
TTY=/dev/${TTY}

printf "\n\e[32m[Info]:\e[0m\n" > ${TTY}
printf "\tRunning Glmask 3D Graphics demo\n" > ${TTY}
printf "\n\e[31mNOTE: Click on Exit icon to exit from running applications\e[0m\n\n" > ${TTY}

out_width=`expr $D_WIDTH`
out_height=`expr $D_HEIGHT`

glmark2-es2-wayland -b :show-fps=true -s ${out_width}x${out_height}  &> /dev/null &

sleep 15s

killall -9 -q glmark2-es2-wayland &> /dev/null
sync
