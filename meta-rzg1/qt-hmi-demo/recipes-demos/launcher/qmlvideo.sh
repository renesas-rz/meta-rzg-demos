#!/bin/sh
#qmlvideo need to use pulseaudio for multi video playing function
pulseaudio --resample-method=speex-fixed-1 --exit-idle-time=-1 --start
/usr/share/qt5/examples/multimedia/video/qmlvideo/qmlvideo
pulseaudio --kill