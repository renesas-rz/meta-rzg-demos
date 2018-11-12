LICENSE = "CLOSED"
DESCRIPTION = "launcher taskbar"

SRC_URI = " \	
 file://hmi-icons/* \
 file://hmi-scripts/* \
 file://Demo3D.png \
 file://Demo3D.sh \
 file://libjpeg.so.9 \
 file://0001-Video_Playback-set-D_SCALE-for-HDMI-sreen-resolution.patch \
"

INSANE_SKIP_${PN} = "already-stripped"

do_patch() {
    cd ${WORKDIR}
    git apply *.patch
}

do_install() {
    install -d ${D}/home/root/launcher-taskbar/hmi-icons
    install -d ${D}/home/root/launcher-taskbar/hmi-scripts
    install -d ${D}/home/root/videos
    install -d ${D}/usr/lib/

    cp -Rf ${S}/../hmi-icons/* ${D}/home/root/launcher-taskbar/hmi-icons/
    cp -Rf ${S}/../hmi-scripts/* ${D}/home/root/launcher-taskbar/hmi-scripts/

    install ${WORKDIR}/Demo3D.png ${D}/home/root/launcher-taskbar/hmi-icons/
    install ${WORKDIR}/Demo3D.sh ${D}/home/root/launcher-taskbar/hmi-scripts/

    install ${WORKDIR}/libjpeg.so.9 ${D}/usr/lib/ 
}

INSANE_SKIP_${PN} += "file-rdeps"

FILES_${PN} = "/home/root/launcher-taskbar/hmi-icons \
               /home/root/launcher-taskbar/hmi-scripts \
               /home/root \
               /home/root/videos \
               /usr/lib/ \
"
FILES_${PN}-dbg += " \
 /home/root/launcher-taskbar/hmi-scripts/.debug/* \
 /home/root/launcher-taskbar/hmi-scripts/*/.debug/* \
"
