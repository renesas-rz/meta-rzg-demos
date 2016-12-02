LICENSE = "CLOSED"
DESCRIPTION = "This is configuration for environments"

FILESEXTRAPATHS = "${THISDIR}/files:"
SRC_URI = " \
 file://RZ_scripts.tar.xz \
 file://0001-adding-flexible-display-for-camera-encoded-review.patch \
 file://0002-adding-scaling-function-for-video-playback.patch \
 file://0003-adding-flexible-display-for-video-streaming.patch \
 file://ATT93936.bashrc \
"
# SRC_URI = " \
#  file://RZ_scripts.tar.xz \
# "
do_patch() {
    cd ${S}/../RZ_scripts/
    patch -p1 < ../0001-adding-flexible-display-for-camera-encoded-review.patch
    patch -p1 < ../0002-adding-scaling-function-for-video-playback.patch
    patch -p1 < ../0003-adding-flexible-display-for-video-streaming.patch
}

do_install () {
    install -d ${D}/${ROOT_HOME}/RZ_scripts
    cp ${S}/../RZ_scripts/* ${D}/${ROOT_HOME}/RZ_scripts
    cp ${S}/../ATT93936.bashrc ${D}/${ROOT_HOME}/.bashrc
}

INSANE_SKIP_${PN} += "ldflags debug-files"
# do_patch[noexec] = "1"
do_cofigure[noexec] = "1"
do_compile[noexec] = "1"

PACKAGES = "${PN}"

FILES_${PN} = " /* "
