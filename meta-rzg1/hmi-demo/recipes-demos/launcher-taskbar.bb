LICENSE = "CLOSED"
DESCRIPTION = "launcher taskbar"

SRC_URI = " \	
 file://hmi-rzg-pkg-v1.0.tar.xz \
 file://0001-Update-new-video-names-change-name-for-easier-to-upl.patch \
 file://Demo3D.png \
 file://Demo3D.sh \
 file://0001-adding-3D-demo-to-Exit-script.patch \
 file://0002-play-glmask-full-screen.patch \
 file://0003-adding-flexible-display-for-video-playback-demo.patch \
 file://0001-Scaling-down-height-of-Glmark3D-demo-because-of-wayl.patch \
"
#SRC_URI = " \	
# file://hmi-rzg-pkg-v1.0.tar.xz \
# file://0001-Update-new-video-names-change-name-for-easier-to-upl.patch \
# file://Demo3D.png \
# file://Demo3D.sh \
#"
INSANE_SKIP_${PN} = "already-stripped"

do_patch() {
    cd ${S}/../hmi-scripts/
    patch -p1 < ../0001-Update-new-video-names-change-name-for-easier-to-upl.patch
    patch -p1 < ../0001-adding-3D-demo-to-Exit-script.patch
    patch -p1 < ../0002-play-glmask-full-screen.patch
    patch -p1 < ../0003-adding-flexible-display-for-video-playback-demo.patch
    patch -p1 < ../0001-Scaling-down-height-of-Glmark3D-demo-because-of-wayl.patch
}

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
