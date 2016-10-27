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
"
do_compile_prepend() {
    cp ${WORKDIR}/btn_exit.png ${WORKDIR}/git/QtDemo/qml/QtDemo/images
}
