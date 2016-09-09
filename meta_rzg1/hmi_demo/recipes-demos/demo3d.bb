LICENSE = "CLOSED"
DESCRIPTION = "Demo3D"

DEPENDS = " mesa gles-user-module weston wayland freetype libpng12 gstreamer1.0 gstreamer1.0-plugins-base"

SRC_URI = " \	
 file://Demo3D.tar.xz \
 file://Renesas.mp4 \
 file://0001-Demo3D-add-option-to-set-window-width-height.patch \
"

INSANE_SKIP_${PN} = "already-stripped"

do_patch() {
    cd ${WORKDIR}/Demo3D
    git apply ../*.patch
}

do_compile() {
    cd ${WORKDIR}/Demo3D
    make
}

do_install() {
    install -d ${D}/home/root/Demo3D
    cp -Rf ${WORKDIR}/Demo3D/data/* ${D}/home/root/Demo3D
    install ${WORKDIR}/Demo3D/Demo3D ${D}/home/root/Demo3D/
    install ${WORKDIR}/Renesas.mp4 ${D}/home/root/Demo3D/
}

FILES_${PN} = "/home/root/Demo3D/* \	
               /home/root/Demo3D/pics* \
"
FILES_${PN}-dbg += " \
 /home/root/Demo3D/.debug/* \
"