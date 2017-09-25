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
  file://0011-DoorPhone-Modify-graph-display-of-memory-measurement.patch \
  file://0013-doorphone-simpleplayer-Enable-function-to-select-1-b.patch \
  file://0014-main.qml-input-host-and-port-from-qml-when-switch-mo.patch \
"

SRC_URI_append_iwg20m = " \
  file://0012-DoorPhone-iWave-Modify-GUI-for-touch-screen.patch \
"

SRC_URI_append_iwg21m = " \
  file://0012-DoorPhone-iWave-Modify-GUI-for-touch-screen.patch \
  file://0015-Doorphone-iwrzg1h-change-default-screen-to-LVDS-800x.patch \
  file://0016-Doorphone-iwrzg1h-Change-to-eth1.patch \
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