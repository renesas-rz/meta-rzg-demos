LICENSE = "CLOSED"
DESCRIPTION = "Videos for Doorphone demo, need to encode in H264 with I frames only for sending via network"

FILESEXTRAPATHS = "${THISDIR}/doorphone-data:"
SRC_URI = "file://vga1.h264 \
           file://vga2.h264 \
           file://vga3.h264 "


do_install () {
    install -d ${D}/home/root/videos

    cp -RP ${WORKDIR}/vga*.h264  ${D}/home/root/videos
    
}

INSANE_SKIP_${PN} += "ldflags"
do_patch[noexec] = "1"
do_cofigure[noexec] = "1"
do_compile[noexec] = "1"

PACKAGES = "${PN}"

FILES_${PN} = " /* "

