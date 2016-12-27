#!/bin/sh
export LD_PRELOAD=/usr/lib/libEGL.so
/home/root/loading-qt-app/Loading &
/usr/share/cinematicexperience-1.0/Qt5_CinematicExperience --fullscreen &
