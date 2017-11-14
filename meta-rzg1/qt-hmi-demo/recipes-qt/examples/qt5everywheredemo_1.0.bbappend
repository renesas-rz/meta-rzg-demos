FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LIC_FILES_CHKSUM = "file://main.cpp;md5=71adff51aafebb2633598bbadd6aad70"
SRCREV = "35d72a2eba7456a2efc5eb8b77afbc00f69ba0ac"
DEPENDS_append += "qtmultimedia qtsvg"

SRC_URI_append += " \
    file://0001-set_window_size.patch \
    file://btn_exit.png \
    file://0002-fullscreen-and-exit-button.patch \
    file://0003-Add-font_setting.patch \
    file://0004-Change-resolution-of-internal-apps.patch \
    file://0005-Fore-complete-loading-incubator-if-it-not-ready.patch \
    file://0006-Not-hide-source-of-shader-effects-at-initialization.patch \
    file://0007-Add-video-and-audio-offline-for-Qteverywhere.patch \
    file://qt5_video_fhd30fps.png \
    file://qt5_video_hd30fps.png \
    file://COMMON6_MPEG2_L3_24KHZ_160_2.mp3 \
    file://04_16KH_2ch_bgm_maoudamashii_healing01.wav \
"

do_compile_prepend() {
    cp ${WORKDIR}/btn_exit.png ${WORKDIR}/git/QtDemo/qml/QtDemo/images
    cp ${WORKDIR}/qt5_video_fhd30fps.png ${WORKDIR}/git/QtDemo/qml/QtDemo/demos/video
    cp ${WORKDIR}/qt5_video_hd30fps.png ${WORKDIR}/git/QtDemo/qml/QtDemo/demos/video
}

do_install_append() {
        install -d ${D}/home/root
        install -m 755 ${WORKDIR}/COMMON6_MPEG2_L3_24KHZ_160_2.mp3 ${D}/home/root/
        install -m 755 ${WORKDIR}/04_16KH_2ch_bgm_maoudamashii_healing01.wav ${D}/home/root/
}

FILES_${PN}-dbg += "home/root/.debug"
FILES_${PN} += "home/root"
