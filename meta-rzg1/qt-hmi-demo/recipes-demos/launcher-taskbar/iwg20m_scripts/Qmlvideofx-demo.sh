#!/bin/sh
export LD_PRELOAD=/usr/lib/libEGL.so
/home/root/loading-qt-app/Loading &
pulseaudio --resample-method=speex-fixed-1 --exit-idle-time=-1 --start
/usr/share/qt5/examples/multimedia/video/qmlvideofx/qmlvideofx --fullscreen &
