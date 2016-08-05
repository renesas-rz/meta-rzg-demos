
EXTRA_IMAGE_FEATURES = "debug-tweaks tools-debug tools-profile"


IMAGE_INSTALL_append = " \
    mm-init \
    cairo \
    gstreamer1.0-plugins-base-vspmfilter \
    gstreamer1.0-plugins-base-apps \
    gstreamer1.0-plugins-good-multifile \
    gstreamer1.0-plugins-good-rtp \
    gstreamer1.0-plugins-good-udp \
    faac \
    gstreamer1.0-plugins-bad-faac \
    pulseaudio-server \
    pulseaudio-module-echo-cancel \
    gstreamer1.0-plugins-good-pulse \
    gstreamer1.0-plugins-good-rtpmanager \
    gstreamer1.0-rtsp-server \
    gstreamer1.0-plugins-base-app \
    libgstapp-1.0 \
    gstreamer1.0-plugins-good-jpeg \
    gstreamer1.0-plugins-base-volume \
    gstreamer1.0-plugins-base-audiorate \
    gstreamer1.0-plugins-base-videorate \
    gstreamer1.0-plugins-base-encodebin \
    gstreamer1.0-plugins-bad-camerabin2 \
    gstreamer1.0-plugins-good-icydemux \
    libgstphotography-1.0 \
    glmark2 \
    configuration \
    demos \
    launcher-taskbar \
    wireless-firmware \
    weston-staticdev \
    demo3d \
"
