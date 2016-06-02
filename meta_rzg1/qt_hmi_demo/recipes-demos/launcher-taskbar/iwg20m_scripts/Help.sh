#!/bin/sh
export LD_PRELOAD=/usr/lib/libEGL.so
/home/root/loading-qt-app/Loading &
/usr/share/qt5/examples/webengine/quicknanobrowser/quicknanobrowser  /home/root/renesas_iWave_info.html &
