SUMMARY = "Qt5 launch demo"
DESCRIPTION = "Quick tour of Qt 5.0, primarily focusing on its graphical capabilities."
HOMEPAGE = "http://code.qt.io/cgit/{non-gerrit}/qt-labs/"
LICENSE = "LGPLv2.1"

# This package actually has no License file. Below is dummy info to build
LIC_FILES_CHKSUM = "file://main_lofi.qml;md5=61743fae5e4e8d28e9ee8b95b3f6a5fc"

SRCREV = "c43ddf9d354761c51266ecbdc6cb90a3aac1903d"
SRC_URI = "git://code.qt.io/{non-gerrit}/qt-labs/qt5-launch-demo.git \
           file://0001-change_video_file.patch \
           file://renesas.mov \
           file://0002-qt5-launch-demo-update-QtWebKit-to-QtWebEngine.patch \
"

SRC_URI_append_iwg20m += " \
    file://0001-qt5-launch-demo-update-GUI-compatible-with-iWave.patch \
"

S = "${WORKDIR}/git"

#require recipes-qt/qt5/qt5.inc

do_install() {
    install -d ${D}${datadir}/${PN}
    cp -a ${S}/* ${D}${datadir}/${PN} 
    install -m 755 ${WORKDIR}/renesas.mov ${D}${datadir}/${PN}
}

#FILES_${PN}-dbg += "${datadir}/${P}/.debug"
FILES_${PN} += "${datadir}/${PN}"

