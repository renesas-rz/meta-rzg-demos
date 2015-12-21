#!/bin/sh
export LD_PRELOAD=/usr/lib/libEGL.so
/usr/bin/qt5/qmlscene /usr/share/qt5-launch-demo/main.qml
