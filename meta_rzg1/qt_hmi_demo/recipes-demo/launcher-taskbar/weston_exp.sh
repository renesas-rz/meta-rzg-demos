#!/bin/sh

		export XDG_RUNTIME_DIR=/run/user/root/
                mkdir --parents $XDG_RUNTIME_DIR
                chmod 0700 $XDG_RUNTIME_DIR

export QT_QPA_PLATFORM=wayland

export PATH=$PATH:/usr/share/qt5/examples/multimedia/video/qmlvideofx/
export LD_PRELOAD=/usr/lib/libEGL.so
