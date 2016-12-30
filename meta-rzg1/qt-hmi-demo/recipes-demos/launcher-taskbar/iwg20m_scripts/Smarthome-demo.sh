#!/bin/sh
export LD_PRELOAD=/usr/lib/libEGL.so
/home/root/loading-qt-app/Loading &
cd /usr/share/qtsmarthome-1.0
./smarthome &
