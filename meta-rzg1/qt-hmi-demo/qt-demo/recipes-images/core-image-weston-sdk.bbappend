inherit meta
inherit populate_sdk

create_sdk_files_append () {

       echo "export PATH=${SDKPATHNATIVE}/usr/bin/qt5:\$PATH" >> $script
       echo 'export OE_QMAKE_COMPILER="arm-poky-linux-gnueabi-gcc -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a7 --sysroot=$SDKTARGETSYSROOT"' >> $script
       echo 'export OE_QMAKE_CC="arm-poky-linux-gnueabi-gcc -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a7 --sysroot=$SDKTARGETSYSROOT"' >> $script
       echo 'export OE_QMAKE_CXX="arm-poky-linux-gnueabi-g++ -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a7 --sysroot=$SDKTARGETSYSROOT"' >> $script
       echo 'export OE_QMAKE_CFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types"' >> $script
       echo 'export OE_QMAKE_CXXFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden"' >> $script
       echo 'export OE_QMAKE_LINK="arm-poky-linux-gnueabi-g++ -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a7 --sysroot=$SDKTARGETSYSROOT"' >> $script
       echo 'export OE_QMAKE_LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"' >> $script
       echo 'export OE_QMAKE_AR="arm-poky-linux-gnueabi-ar"' >> $script
       echo 'export OE_QMAKE_STRIP="echo"' >> $script
       echo 'export OE_QMAKE_INCDIR_QT="$SDKTARGETSYSROOT/usr/include/qt5"' >> $script
       echo 'export OE_QMAKE_WAYLAND_SCANNER="${SDKPATHNATIVE}/usr/bin/wayland-scanner"' >> $script
}

# This allow reuse of Qt paths
inherit qmake5_paths

create_sdk_files_prepend () {
    # make a symbolic link to mkspecs for compatibility with QTCreator
    (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
         ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)

    # Generate oe-device-extra.pri
    oe_device_extra_pri=${SDK_OUTPUT}/${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs/oe-device-extra.pri
    touch $oe_device_extra_pri

    # Generate a qt.conf file to be deployed with the SDK
    qtconf=${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
    touch $qtconf
    echo '[Paths]' >> $qtconf
    echo 'Prefix = ${SDKTARGETSYSROOT}' >> $qtconf
    echo 'Headers = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_HEADERS}' >> $qtconf
    echo 'Libraries = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_LIBS}' >> $qtconf
    echo 'ArchData = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_ARCHDATA}' >> $qtconf
    echo 'Data = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_DATA}' >> $qtconf
    echo 'Binaries = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_BINS}' >> $qtconf
    echo 'LibraryExecutables = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_LIBEXECS}' >> $qtconf
    echo 'Plugins = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_PLUGINS}' >> $qtconf
    echo 'Imports = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_IMPORTS}' >> $qtconf
    echo 'Qml2Imports = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QML}' >> $qtconf
    echo 'Translations = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_TRANSLATIONS}' >> $qtconf
    echo 'Documentation = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_DOCS}' >> $qtconf
    echo 'Settings = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_SETTINGS}' >> $qtconf
    echo 'Examples = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_EXAMPLES}' >> $qtconf
    echo 'Tests = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_TESTS}' >> $qtconf
    echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
    echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
}

IMAGE_INSTALL_append = " qtmultimedia qtconnectivity qtwebchannel qtwebkit qtwebsockets qtwayland qtserialport "
TOOLCHAIN_HOST_TASK_append = " nativesdk-qtbase-tools nativesdk-packagegroup-qt5-toolchain-host"

### For self-compile ###
IMAGE_INSTALL_append = " packagegroup-qt5-toolchain-target "

# Set up environment variables for self-compileing
setup_qt_env () {
    if [ ! -e ${IMAGE_ROOTFS}${sysconfdir}/profile.d/setup_qt_env ]
    then
        echo 'export PATH=$PATH:/usr/bin/qt5' > ${IMAGE_ROOTFS}${sysconfdir}/profile.d/setup_qt_env
        echo 'export INCLUDEPATH=$INCLUDEPATH:/usr/include/qt5' >> ${IMAGE_ROOTFS}${sysconfdir}/profile.d/setup_qt_env
    fi
}
ROOTFS_POSTPROCESS_COMMAND_append = "setup_qt_env"

# Include this make it similar to core-image-weston
include core-image-weston.inc

# Qt multimedia needs alsa-dev when self-compiling
IMAGE_INSTALL_append = " alsa-dev "
