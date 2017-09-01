EXTRA_IMAGE_FEATURES = "debug-tweaks tools-debug tools-profile"

# Common lib,app
IMAGE_INSTALL_append_rzg1 = " \
    mm-init \
    cairo \
    gstreamer1.0-plugins-base-vspmfilter \
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
    gstreamer1.0-plugins-base-videorate \
    gstreamer1.0-plugins-base-encodebin \
    gstreamer1.0-plugins-bad-camerabin2 \
    gstreamer1.0-plugins-good-icydemux \
    libgstphotography-1.0 \
    faac \
    gstreamer1.0-plugins-bad-faac \
    gstreamer1.0-plugins-bad-faad \
    gstreamer1.0-plugins-good-isomp4 \
"

# Common apps
IMAGE_INSTALL_append_rzg1 = " \
    dosfstools \
    evtest \
    e2fsprogs-mke2fs \
    i2c-tools \
    iproute2 \
    memtester \
    python-subprocess \
    python-datetime \
    python-json \
    ethtool \
    mtd-utils \
    mtd-utils-ubifs \
    iperf \
    can-utils \
    pciutils \
    libsocketcan \
    minicom \
    lttng-tools \
    lttng-modules \
    lttng-ust \
"
