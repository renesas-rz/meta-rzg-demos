FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SUMMARY = "QT omxh264enc demo Application"
DESCRIPTION = "App shows ability to encode by omxh264enc from Renesas IP"
LICENSE = "CLOSED"

DEPENDS += "qtbase qtdeclarative"

SRC_URI = "file://omxh264enc_demo.tar.gz \
           file://0001-Set-app-flexible-screen.patch \
           file://0002-Improve-performance-and-GUI-for-app.patch \
           file://0003-Config-to-match-position-between-video-and-app.patch \
"
SRC_URI[md5sum] = "00266731b2e76275fe07395ad7d261cf"

S = "${WORKDIR}/omxh264enc_demo"

require recipes-qt/qt5/qt5.inc

do_install() {
    install -d ${D}${datadir}/${P}
    install -m 0755 ${B}/omxh264enc_demo ${D}${datadir}/${P}
    cp -a ${S}/images ${D}${datadir}/${P}
    cp -a ${S}/qml.qrc ${D}${datadir}/${P}
}

FILES_${PN}-dbg += "${datadir}/${P}/.debug"
FILES_${PN} += "${datadir}"
