FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
LICENSE = "CC-BY-3.0"
DESCRIPTION = "Videos for demos"

LIC_FILES_CHKSUM = "file://${WORKDIR}/VIDEO_LICENSE;md5=2b911b583e4ee03e3de03ef4b3158401"

SRC_URI = "http://resource.renesas.com/resource/lib/img/products/media/auto-j/microcontrollers-microprocessors/rz/rzg/hmi-mmpoc-videos/h264-bl10-fhd-30p-5m-aac-lc-stereo-124k-48000x264.mp4;name=video_fhd30 \
           http://resource.renesas.com/resource/lib/img/products/media/auto-j/microcontrollers-microprocessors/rz/rzg/hmi-mmpoc-videos/h264-hd-30.mp4;name=video_hd30 \
           file://VIDEO_LICENSE \
"

SRC_URI[video_fhd30.md5sum] = "33696ae57ae684e2cc6f83b3aabee005"
SRC_URI[video_fhd30.sha256sum] = "67f8a8695e7adf54f8d9b3db0e629d3a964c23d0c8011500d1695e618507d16c"
SRC_URI[video_hd30.md5sum] = "619825b0713dc39f7689c85750f136a7"
SRC_URI[video_hd30.sha256sum] = "12f283bafefc7f43050b2bee3025245902943131ae496a46c8e79ea4e102fe65"


do_install () {
    install -d ${D}/home/root/videos

    cp -RP ${WORKDIR}/*.mp4  ${D}/home/root/videos
    cp -RP ${WORKDIR}/VIDEO_LICENSE ${D}/home/root/videos

}

INSANE_SKIP_${PN} += "ldflags"
do_patch[noexec] = "1"
do_cofigure[noexec] = "1"
do_compile[noexec] = "1"

PACKAGES = "${PN}"

FILES_${PN} = " /* "
