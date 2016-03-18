#!/bin/sh
export LD_PRELOAD=/usr/lib/libEGL.so
/home/root/loading-qt-app/Loading &
/usr/share/qt5everywheredemo-1.0/QtDemo &
