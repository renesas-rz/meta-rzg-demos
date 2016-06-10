LICENSE = "CLOSED"
DESCRIPTION = "launcher"

DEPENDS = "qtdeclarative qtquickcontrols axistatlib qtmultimedia" 
RDEPENDS_${PN} = "qtquickcontrols-qmlplugins  axistatlib qtmultimedia"

SRC_URI = " \
  file://simpleplayer.tar.gz \
  file://0001-Workaround-error-sometimes-touch-button-has-no-effec.patch \
  file://0002-Flexible_Display_Support_get_physical_display.patch \
  file://0003-Flexible_Display_Support_remake_CPU_MEM_commponents.patch \
  file://0004-Flexible_Display_Support_add_icon_to_qml.patch \
  file://Flexible_Display_icons.zip \
  file://0005-Main-implement-for-Flexible-display.patch \
  file://0006-Flexible-Display-Support-icon-hidden.patch \
  file://0007-Adjust-indent-and-trailing-space-for-main.qml.patch \
  file://0008-Update-for-Flexible-resolution.patch \
  file://0009-Update-new-path-for-simple-player.patch \
  file://0010-DoorPhone-Support-auto-recognize-screen-on-RZG1EM-an.patch \
  file://welcome-screen5.6.tar.xz \
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
