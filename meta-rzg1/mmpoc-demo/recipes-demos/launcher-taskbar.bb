LICENSE = "CLOSED"
DESCRIPTION = "launcher taskbar"

SRC_URI = " \	
 file://mmpoc-rzg-pkg-v1.0.tar.xz \
 file://0001-Update-new-video-names-change-name-for-easier-to-upl.patch \
"

INSANE_SKIP_${PN} = "already-stripped"

do_patch() {
    cd ${S}/../mmpoc-scripts/
    patch -p1 < ../0001-Update-new-video-names-change-name-for-easier-to-upl.patch
}

do_install() {
    install -d ${D}/home/root/launcher-taskbar/mmpoc-icons
    install -d ${D}/home/root/launcher-taskbar/mmpoc-scripts
    install -d ${D}/etc/udev/rules.d
    install -d ${D}/usr/local
    install -d ${D}/home/root/audios
    install -d ${D}/home/root/videos

    cp -Rf ${S}/../mmpoc-icons/* ${D}/home/root/launcher-taskbar/mmpoc-icons/
    cp -Rf ${S}/../mmpoc-scripts/* ${D}/home/root/launcher-taskbar/mmpoc-scripts/
    cp -Rf ${S}/../mmpoc-automount/81-auto.rules ${D}/etc/udev/rules.d/
    cp -Rf ${S}/../mmpoc-automount/sbin ${D}/usr/local/
    cp -Rf ${S}/../mmpoc-scripts/Audio-Demo/audio/* ${D}/home/root/audios/
}

FILES_${PN} = "/home/root/launcher-taskbar/mmpoc-icons \
               /home/root/launcher-taskbar/mmpoc-scripts \
               /home/root \
               /etc/udev/rules.d \
               /usr/local \
               /home/root/audios \
               /home/root/videos \
"
FILES_${PN}-dbg += " \
 /home/root/launcher-taskbar/mmpoc-scripts/.debug/* \
 /home/root/launcher-taskbar/mmpoc-scripts/Audio-Demo/bin/.debug/* \
 /home/root/launcher-taskbar/mmpoc-scripts/IPCamera-Demo/.debug/* \
 /home/root/launcher-taskbar/mmpoc-scripts/PowerVR-Demo/.debug/* \
 /home/root/launcher-taskbar/mmpoc-scripts/HW-vs-SW-Comparison/.debug/* \
 /home/root/launcher-taskbar/mmpoc-scripts/MJPEG-Camera-Demo/.debug/* \
 /home/root/launcher-taskbar/mmpoc-scripts/Video-Streaming-From-Device-Wifi/.debug/* \
 /home/root/launcher-taskbar/mmpoc-scripts/File-Player-Demo/.debug/* \
"
