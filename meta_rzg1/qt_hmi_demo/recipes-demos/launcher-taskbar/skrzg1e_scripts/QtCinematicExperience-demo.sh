#!/bin/sh
export LD_PRELOAD=/usr/lib/libEGL.so
/home/root/loading-qt-app/Loading &
/usr/bin/qt5/qmlscene /usr/share/cinematicexperience-1.0/Qt5_CinematicExperience.qml --fullscreen &
