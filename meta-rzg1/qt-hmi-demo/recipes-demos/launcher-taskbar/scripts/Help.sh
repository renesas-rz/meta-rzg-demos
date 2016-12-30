#!/bin/sh
export LD_PRELOAD=/usr/lib/libEGL.so
/home/root/loading-qt-app/Loading &
/usr/share/qt5/examples/webkitwidgets/browser/browser  /home/root/start.html &
