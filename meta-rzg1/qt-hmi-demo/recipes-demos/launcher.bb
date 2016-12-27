LICENSE = "CLOSED"
DESCRIPTION = "launcher"

DEPENDS = "qtbase qtdeclarative"
RDEPENDS_${PN} = "bash"

SRC_URI = " \
 file://launcher.init \
 file://launcher.tar.gz \
"
S = "${WORKDIR}/launcher"

SRC = "${THISDIR}/launcher"

# Use qmake to build .pro file
inherit qmake5

inherit update-rc.d

INITSCRIPT_NAME = "launcher.init"
INITSCRIPT_PARAMS = "start 99 5 2 3 . stop 99 0 1 6 ."

do_install() {
    install -d ${D}/home/root/
    install -d ${D}/etc/profile.d
    install -d ${D}/usr/share/pixmaps/

    

    install -m 0755 ${SRC}/weston_exp.sh ${D}/etc/profile.d

    install -m 0755 ${B}/launcher ${D}/home/root/

    install -m 755 ${SRC}/icons/* ${D}/usr/share/pixmaps/
    install -m 755 ${SRC}/start.sh ${D}/home/root/
    install -m 755 ${SRC}/qmlvideo.sh ${D}/home/root/

    install -d ${D}/etc/init.d
    install -m 0755 ${SRC}/launcher.init ${D}${sysconfdir}/init.d/launcher.init 
}

do_install_append_skrzg1m(){
    cp ${SRC}/l_main_strzg1m.qml ${D}/home/root/main.qml
    install -d ${D}/home/root/start_files
    install -m 755 ${SRC}/porter_info/start_files/* ${D}/home/root/start_files
    install -m 755 ${SRC}/porter_info/start.html ${D}/home/root/
}



do_install_append_skrzg1e(){
    cp ${SRC}/l_main_strzg1e.qml ${D}/home/root/main.qml
    install -d ${D}/home/root/start_files
    install -m 755 ${SRC}/skrzg1e_info/start_files/* ${D}/home/root/start_files
    install -m 755 ${SRC}/skrzg1e_info/start.html ${D}/home/root/
}


FILES_${PN} = "/home/root/* \
	/etc/profile.d \
	/usr/share/pixmaps/ \
	/etc/init.d \
"
FILES_${PN}-dbg += " \
 /home/root/.debug/* \
"
