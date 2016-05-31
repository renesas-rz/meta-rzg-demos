SUMMARY = "Qt5 launch demo"
DESCRIPTION = "Quick tour of Qt 5.0, primarily focusing on its graphical capabilities."
HOMEPAGE = "http://code.qt.io/cgit/{non-gerrit}/qt-labs/"
LICENSE = "LGPLv2.1"

# This package actually has no License file. Below is dummy info to build
LIC_FILES_CHKSUM = "file://main.qml;md5=8473cadb2248e18965569787c6c04557"

SRCREV = "c43ddf9d354761c51266ecbdc6cb90a3aac1903d"
SRC_URI = "git://code.qt.io/{non-gerrit}/qt-labs/qt5-launch-demo.git \
           file://0001-change_video_file.patch \
           file://renesas.mov \
           file://0002-qt5-launch-demo-update-QtWebKit-to-QtWebEngine.patch \
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

