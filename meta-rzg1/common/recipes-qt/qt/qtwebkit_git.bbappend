#Remove qtlocation due to license issue
PACKAGECONFIG = "gstreamer qtmultimedia qtsensors qtwebchannel"

DEPENDS += " gperf-native"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
    file://0004-QtWebKit-doesn-t-build-with-ICU-5.6.3.patch \
"
PROVIDES = " qtwebkit-qmlplugins"
