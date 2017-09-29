
#EXTRA_IMAGE_FEATURES = "debug-tweaks tools-debug tools-profile"

IMAGE_INSTALL_append = " \
    qtquickcontrols-qmlplugins \
    wireless-firmware \
    libegl \
	\
    strace \
    libgstapp-1.0 \
	jpeg \
	launcher-taskbar \
    loading-qt-app \
    qtpreload \
    cinematicexperience \
    qtsmarthome \
    qt5everywheredemo \
    qt5-launch-demo \
    qt5-qml-presentation-system \
	qtwebsockets \
    qtserialport \
    qtwebchannel \
    qtwebchannel-qmlplugins \
    qtwebkit \
    qtwebkit-examples-examples \
    qtwebkit-qmlplugins \
"

# Remove qt-framework-launcher inherited from qt-framework since we
# do not need it here.
# Note that IMAGE_INSTALL_remove does not work
python () {

    img_install = d.getVar('IMAGE_INSTALL', True)
    img_install = img_install.replace("qt-framework-launcher", "")
    d.setVar('IMAGE_INSTALL', img_install)
}
