FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SUMMARY = "QT Launcher Application"
DESCRIPTION = "The started application to launch some demo apps"
LICENSE = "CLOSED"

DEPENDS += "qtbase qtdeclarative"

SRC_URI = "file://launcher.tar.gz \
	file://network_demo_script.sh \
	file://0001-Make-compatible-with-flexible-resolution-screen.patch \
	file://0002-Remove-unnecessary-app-add-quitbattery-for-graphic-d.patch \
	file://0003-Remove-unecessary-application.patch \
	file://0004-Add-omxh26enc-to-qt-framework-launcher.patch \
	file://0005-Fix-issue-can-not-open-client-server-app-at-the-same.patch \
	file://0006-Make-text-flexible-with-resolution-screen.patch \
"

SRC_URI[md5sum] = "99AD3F57FE016B99DCE4AA83FEE545CB"

S = "${WORKDIR}/launcher"

require recipes-qt/qt5/qt5.inc

inherit update-rc.d
INITSCRIPT_NAME = "qt_framework_launcher.sh"
INITSCRIPT_PARAMS = "start 99 2 3 4 5 . stop 99 0 1 6 ."

do_install() {
    install -d ${D}${datadir}/${P}
    install -m 0755 ${B}/launcher ${D}${datadir}/${P}
    cp -a ${S}/content ${D}${datadir}/${P}
    cp -a ${S}/launcher.qrc ${D}${datadir}/${P}
    install -d ${D}/home/root/qt_framework
    install -m 755 ${WORKDIR}/network_demo_script.sh ${D}/home/root/qt_framework/
}

FILES_${PN}-dbg += "${datadir}/${P}/.debug"
FILES_${PN} += "${datadir} \
	/home/root/qt_framework/ \
"


