SUMMARY = "Qt5 launch demo"
DESCRIPTION = "Quick tour of Qt 5.0, primarily focusing on its graphical capabilities."
HOMEPAGE = "http://code.qt.io/cgit/{non-gerrit}/qt-labs/"
LICENSE = "BSD"

# This package actually has no License file. Below is dummy info to build
LIC_FILES_CHKSUM = "file://main.qml;beginline=1;endline=39;md5=46fcfe21b4d58845077530223ab020af"

SRCREV = "c43ddf9d354761c51266ecbdc6cb90a3aac1903d"
SRC_URI = "git://code.qt.io/{non-gerrit}/qt-labs/qt5-launch-demo.git \
           file://0001-change_video_file.patch \
           http://resource.renesas.com/resource/lib/img/products/media/auto-j/microcontrollers-microprocessors/rz/rzg/qt-videos/renesas-bigideasforeveryspace.mp4;name=video \
		   file://0003-qt5-launch-demo-work-around-issue-cannot-play-video.patch \
"
# Tempory remove due to license issue with Qt webengine
# file://0002-qt5-launch-demo-update-QtWebKit-to-QtWebEngine.patch

SRC_URI[video.md5sum] = "44748e486a971d1e039fbfc3bc15b6f1"
SRC_URI[video.sha256sum] = "148ec58a28be27700a944b66e404d38ac9d0bbb376485ce60069bdc890a0e0c6"

SRC_URI_append += " \
    file://0001-qt5-launch-demo-update-GUI-compatible-with-iWave.patch \
    file://0002-Change-address-webpage-offline-to-show-for-customer.patch \
    file://0003-Add-flexible-screen-resolution-for-qt-launcher-demo-.patch \
"

S = "${WORKDIR}/git"

#require recipes-qt/qt5/qt5.inc

do_install() {
    install -d ${D}${datadir}/${PN}
    cp -a ${S}/* ${D}${datadir}/${PN}
    install -m 755 ${WORKDIR}/renesas-bigideasforeveryspace.mp4 ${D}${datadir}/${PN}
}

#FILES_${PN}-dbg += "${datadir}/${P}/.debug"
FILES_${PN} += "${datadir}/${PN}"
