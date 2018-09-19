EXTRA_IMAGE_FEATURES = "debug-tweaks tools-debug tools-profile"

# Common lib,app
IMAGE_INSTALL_append_rzg1 = " \
    gstreamer1.0-plugins-base-apps \
    gstreamer1.0-plugins-good-multifile \
    gstreamer1.0-plugins-good-rtp \
    gstreamer1.0-plugins-good-udp \
    gstreamer1.0-plugins-good-rtpmanager \
    gstreamer1.0-rtsp-server \
    gstreamer1.0-plugins-base-app \
    libgstapp-1.0 \
    gstreamer1.0-plugins-good-jpeg \
    gstreamer1.0-plugins-base-volume \
    gstreamer1.0-plugins-base-audiorate \
    gstreamer1.0-plugins-good-icydemux \
    libgstphotography-1.0 \
    faac \
"

# Common apps
IMAGE_INSTALL_append_rzg1 = " \
    iperf3 \
"
