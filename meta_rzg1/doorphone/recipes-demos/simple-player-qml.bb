LICENSE = "CLOSED"
DESCRIPTION = "launcher"

DEPENDS = "qtdeclarative qtquickcontrols axistatlib qtmultimedia" 
RDEPENDS_${PN} = "qtquickcontrols-qmlplugins  axistatlib qtmultimedia"

SRC_URI = " \
 file://simpleplayer.tar.gz \
"
S = "${WORKDIR}/simpleplayer"

SRC = "${THISDIR}/simple-player-qml"

# Use qmake to build .pro file
inherit qmake5

do_install(){

	install -d ${D}/home/root/doorphone
	install -m 0755 ${B}/simpleplayer ${D}/home/root/doorphone
}


FILES_${PN} = "/home/root/doorphone \
"
FILES_${PN}-dbg += " \
 /home/root/doorphone/.debug/* \
"
