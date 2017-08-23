
#EXTRA_IMAGE_FEATURES = "debug-tweaks tools-debug tools-profile"

IMAGE_INSTALL_append = " \
    packagegroup-qt5-examples \
    qtquickcontrols-qmlplugins \
    wireless-firmware \
    libegl \
	\
    strace \
    gstreamer1.0-plugins-base-apps \
    gstreamer1.0-plugins-good-multifile \
    gstreamer1.0-plugins-good-rtp \
    gstreamer1.0-plugins-good-udp \
    gstreamer1.0-plugins-good-rtpmanager \
    gstreamer1.0-plugins-base-app \
    libgstapp-1.0 \
	jpeg \
    gstreamer1.0-plugins-good-jpeg \
    gstreamer1.0-plugins-base-volume \
    gstreamer1.0-plugins-base-audiorate \
    gstreamer1.0-plugins-base-videorate \
    gstreamer1.0-plugins-base-encodebin \
    gstreamer1.0-plugins-bad-camerabin2 \
    gstreamer1.0-plugins-good-icydemux \
    gstreamer1.0-plugins-base-vspmfilter \
    libgstphotography-1.0 \
	mm-init \
	launcher-taskbar \
    loading-qt-app \
    qtpreload \
    faac \
    gstreamer1.0-plugins-bad-faac \
    qtbase-fonts \
    cinematicexperience \
    qt5everywheredemo \
    qt5-launch-demo \
    qt5-qml-presentation-system \
	qtwebsockets \
    qtwebkit \
    qtwebkit-examples-examples \
    qtwebkit-qmlplugins \
	demo-videos \
"

# Remove qt-framework-launcher inherited from qt-framework since we
# do not need it here.
# Note that IMAGE_INSTALL_remove does not work
python () {

    img_install = d.getVar('IMAGE_INSTALL', True)
    img_install = img_install.replace("qt-framework-launcher", "")
    d.setVar('IMAGE_INSTALL', img_install)
}
