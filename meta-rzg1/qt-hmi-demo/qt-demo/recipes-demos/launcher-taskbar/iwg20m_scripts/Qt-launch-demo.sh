#!/bin/sh
export LD_PRELOAD=/usr/lib/libEGL.so
/home/root/loading-qt-app/Loading &
/usr/bin/qt5/qmlscene /usr/share/qt5-launch-demo/main_lofi.qml --fullscreen &
