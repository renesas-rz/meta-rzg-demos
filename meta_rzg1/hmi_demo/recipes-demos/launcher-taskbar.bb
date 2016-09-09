LICENSE = "CLOSED"
DESCRIPTION = "launcher taskbar"

SRC_URI = " \	
 file://hmi-rzg-pkg-v1.0.tar.xz \
 file://Demo3D.png \
 file://Demo3D.sh \
"

INSANE_SKIP_${PN} = "already-stripped"

do_install() {
    install -d ${D}/home/root/launcher-taskbar/hmi-icons
    install -d ${D}/home/root/launcher-taskbar/hmi-scripts
    install -d ${D}/home/root/videos

    cp -Rf ${S}/../hmi-icons/* ${D}/home/root/launcher-taskbar/hmi-icons/
    cp -Rf ${S}/../hmi-scripts/* ${D}/home/root/launcher-taskbar/hmi-scripts/
    
    install ${WORKDIR}/Demo3D.png ${D}/home/root/launcher-taskbar/hmi-icons/
    install ${WORKDIR}/Demo3D.sh ${D}/home/root/launcher-taskbar/hmi-scripts/
}

FILES_${PN} = "/home/root/launcher-taskbar/hmi-icons \
               /home/root/launcher-taskbar/hmi-scripts \
               /home/root \
               /home/root/videos \
"
FILES_${PN}-dbg += " \
 /home/root/launcher-taskbar/hmi-scripts/.debug/* \
 /home/root/launcher-taskbar/hmi-scripts/*/.debug/* \
"
