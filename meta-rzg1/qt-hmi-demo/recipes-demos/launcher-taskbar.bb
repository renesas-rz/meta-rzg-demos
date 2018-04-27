LICENSE = "CLOSED"
DESCRIPTION = "launcher taskbar"

SRC_URI = " \
 file://launcher.init \
"

S = "${WORKDIR}/launcher-taskbar"

SRC = "${THISDIR}/launcher-taskbar"

inherit update-rc.d
INITSCRIPT_NAME = "launcher.init"
INITSCRIPT_PARAMS = "start 99 2 3 4 5 . stop 99 0 1 6 ."

do_install() {
    install -d ${D}/home/root/launcher-taskbar
	install -d ${D}/etc/profile.d

	install -m 0755 ${SRC}/weston_exp.sh ${D}/etc/profile.d

    install -m 755 ${SRC}/icons/* ${D}/home/root/launcher-taskbar/

	install -d ${D}/etc/init.d
	install -m 755 ${SRC}/launcher.init ${D}/etc/init.d/launcher.init
}

do_install_append_skrzg1e(){
    install -d ${D}/home/root/start_files
    install -m 755 ${SRC}/skrzg1e_info/start_files/* ${D}/home/root/start_files
    install -m 755 ${SRC}/skrzg1e_info/start.html ${D}/home/root/
    install -m 755 ${SRC}/skrzg1e_scripts/* ${D}/home/root/launcher-taskbar/
}

do_install_append_skrzg1m(){
    install -d ${D}/home/root/start_files
    install -m 755 ${SRC}/skrzg1m_info/start_files/* ${D}/home/root/start_files
    install -m 755 ${SRC}/skrzg1m_info/start.html ${D}/home/root/
    install -m 755 ${SRC}/skrzg1m_scripts/* ${D}/home/root/launcher-taskbar/
}

do_install_append_iwg20m(){
    install -d ${D}/home/root/renesas_iWave_info_files
    install -m 755 ${SRC}/iwg20m_info/renesas_iWave_info_files/* ${D}/home/root/renesas_iWave_info_files
    install -m 755 ${SRC}/iwg20m_info/renesas_iWave_info.html ${D}/home/root/
    install -m 755 ${SRC}/iwg20m_scripts/* ${D}/home/root/launcher-taskbar/
}

do_install_append_iwg21m(){
    install -d ${D}/home/root/renesas_iWave_info_files
    install -m 755 ${SRC}/iwg20m_info/renesas_iWave_info_files/* ${D}/home/root/renesas_iWave_info_files
    install -m 755 ${SRC}/iwg20m_info/renesas_iWave_info.html ${D}/home/root/
    install -m 755 ${SRC}/iwg20m_scripts/* ${D}/home/root/launcher-taskbar/
}

do_install_append_iwg22m(){
    install -d ${D}/home/root/renesas_iWave_info_files
    install -m 755 ${SRC}/iwg20m_info/renesas_iWave_info_files/* ${D}/home/root/renesas_iWave_info_files
    install -m 755 ${SRC}/iwg20m_info/renesas_iWave_info.html ${D}/home/root/
    install -m 755 ${SRC}/iwg20m_scripts/* ${D}/home/root/launcher-taskbar/
}

do_install_append_iwg23s(){
    install -d ${D}/home/root/renesas_iWave_info_files
    install -m 755 ${SRC}/iwg20m_info/renesas_iWave_info_files/* ${D}/home/root/renesas_iWave_info_files
    install -m 755 ${SRC}/iwg20m_info/renesas_iWave_info.html ${D}/home/root/
    install -m 755 ${SRC}/iwg20m_scripts/* ${D}/home/root/launcher-taskbar/
}

FILES_${PN} = "/home/root/launcher-taskbar/* \
	/etc/profile.d \
	/etc/init.d \
	/home/root/start_files/* \
	/home/root/renesas_iWave_info_files/* \
	/home/root \
"
FILES_${PN}-dbg += " \
 /home/root/launcher-taskbar/.debug/* \
"
