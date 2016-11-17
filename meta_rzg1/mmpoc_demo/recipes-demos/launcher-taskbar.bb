LICENSE = "CLOSED"
DESCRIPTION = "launcher taskbar"

SRC_URI = " \	
 file://mmpoc-rzg-pkg-v1.0.tar.xz \
 file://0001-Update-new-video-names-change-name-for-easier-to-upl.patch \
 file://0002-change-icon-size-from-56x32-to-35x20.patch \
 file://0003-fix-audio-issue-no-sound-in-playing-MP3-and-correct-.patch \
 file://0004-Glmask3D-demo-add-display-weston-resolution.patch \
 file://0005-update-script-PowerVR-use-width-height-arguments.patch \
 file://0006-FilePlayerDemo-add-weston-resolution-and-auto-detect.patch \
 file://0007-HW-SW-ComparisionDemo-add-weston-resolution.patch \
 file://0008-IPCamDemo-display-full-weston-resolution.patch \
 file://0009-MJPEG-Cam-Demo-add-scale-down-resolution-for-LVDS-80.patch \
 file://0010-StreamVideoDemo-display-weston-resolution-in-receivi.patch \
 file://mmpoc-icons-small/Audio-Demo-icon.png \
 file://mmpoc-icons-small/Camera-Preview-Record-icon.png \
 file://mmpoc-icons-small/Exit.png \
 file://mmpoc-icons-small/File-Player-Demo-icon.png \
 file://mmpoc-icons-small/Glmask3D-Demo-icon.png \
 file://mmpoc-icons-small/HW-vs-SW-Comparison-icon.png \
 file://mmpoc-icons-small/IPCamera-Demo-icon.png \
 file://mmpoc-icons-small/IP-icon.png \
 file://mmpoc-icons-small/MJPEG-Camera-Demo-icon.png \
 file://mmpoc-icons-small/PowerVR-Demo-icon.png \
 file://mmpoc-icons-small/Video-Streaming-From-Board-Lan-icon.png \
 file://mmpoc-icons-small/Video-Streaming-From-Board-Wifi-icon.png \
 file://mmpoc-icons-small/Video-Streaming-From-Device-Wifi-icon.png \
 file://OGLES2Water \
"

INSANE_SKIP_${PN} = "already-stripped"

do_patch() {
    cd ${S}/../mmpoc-scripts/
    patch -p1 < ../0001-Update-new-video-names-change-name-for-easier-to-upl.patch
    cd ${S}/../.
    mv mmpoc-icons mmpoc-icons-original
    mv mmpoc-icons-small mmpoc-icons
    rm mmpoc-scripts/PowerVR-Demo/OGLES2Water
    cp OGLES2Water mmpoc-scripts/PowerVR-Demo/.
    patch -p1 < 0003-fix-audio-issue-no-sound-in-playing-MP3-and-correct-.patch
    patch -p1 < 0004-Glmask3D-demo-add-display-weston-resolution.patch
    patch -p1 < 0005-update-script-PowerVR-use-width-height-arguments.patch
    patch -p1 < 0006-FilePlayerDemo-add-weston-resolution-and-auto-detect.patch
    patch -p1 < 0007-HW-SW-ComparisionDemo-add-weston-resolution.patch
    patch -p1 < 0008-IPCamDemo-display-full-weston-resolution.patch
    patch -p1 < 0009-MJPEG-Cam-Demo-add-scale-down-resolution-for-LVDS-80.patch
    patch -p1 < 0010-StreamVideoDemo-display-weston-resolution-in-receivi.patch
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
