
EXTRA_IMAGE_FEATURES = "debug-tweaks tools-debug tools-profile"

IMAGE_INSTALL_append = " \
    mm-init \
    demo-videos \
    qtwayland \
    qtwayland-plugins \
    qt5ledscreen \
    qt5nmapcarousedemo \
    qt5nmapper \
    qt5-opengles2-test \
    qtsmarthome \
    quitbattery \
    qtbase-fonts \
    qtbase-plugins \
    qtbase-tools \
    qtbase-examples \
    qtdeclarative \
    qtdeclarative-plugins \
    qtdeclarative-tools \
    qtdeclarative-examples \
    qtdeclarative-qmlplugins \
    qtquickcontrols-qmlplugins \
    qtimageformats-plugins \
    qtsvg \
    qtsvg-plugins \
    qtsensors \
    qtscript \
    qtserialport \
    qtwebchannel \
    qtwebchannel-qmlplugins \
    qtwebkit \
    qtwebkit-examples-examples \
    qtwebkit-qmlplugins \
    qtwebsockets \
    qtwebsockets-qmlplugins \
    ca-certificates \
    qtgraphicaleffects-qmlplugins \
    qtconnectivity \
    qtconnectivity-examples \
    qtconnectivity-qmlplugins \
    cinematicexperience \
    qtmultimedia \
    qtmultimedia-examples \
    qtmultimedia-plugins \
    qtmultimedia-qmlplugins \
    qt5everywheredemo \
    qt5-launch-demo \
    qt5-qml-presentation-system \
    icu \
    libicudata \
    libicuuc \
    libicui18n  \
    strace \
    connman \
    connman-client connman-tests \
    launcher-taskbar \
    \
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
    gstreamer1.0-plugins-base-app \
    libgstapp-1.0 \
    gstreamer1.0-plugins-good-jpeg \
    gstreamer1.0-plugins-base-volume \
    gstreamer1.0-plugins-base-audiorate \
    gstreamer1.0-plugins-base-videorate \
    gstreamer1.0-plugins-base-encodebin \
    gstreamer1.0-plugins-bad-camerabin2 \
    gstreamer1.0-plugins-good-icydemux \
    gstreamer1.0-plugins-base-vspmfilter \
    \
    gstreamer1.0-plugins-good-avi \
    gstreamer1.0-plugins-good-audioparsers \
    gstreamer1.0-plugins-good-id3demux \
    libmad \
    gstreamer1.0-plugins-ugly-mad \
    gstreamer1.0-plugins-good-wavparse \
    libgstphotography-1.0 \
    loading-qt-app \
    qtpreload \
    wireless-firmware \
"


# Remove qt-framework-launcher inherited from qt-framework since we
# do not need it here.
# Note that IMAGE_INSTALL_remove does not work
python () {

    img_install = d.getVar('IMAGE_INSTALL', True)
    img_install = img_install.replace("qt-framework-launcher", "")
    d.setVar('IMAGE_INSTALL', img_install)
}
