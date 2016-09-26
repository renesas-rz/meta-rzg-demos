LICENSE = "CLOSED"
DESCRIPTION = "Videos for Doorphone demo, need to encode in H264 with I frames only for sending via network"

FILESEXTRAPATHS = "${THISDIR}/doorphone-data:"
SRC_URI = "http://www.renesas.com/ja-jp/media/products/microcontrollers-microprocessors/rz/rzg/doorphone-videos/vga1.h264;name=vga1 \
           http://www.renesas.com/ja-jp/media/products/microcontrollers-microprocessors/rz/rzg/doorphone-videos/vga2.h264;name=vga2 \
           http://www.renesas.com/ja-jp/media/products/microcontrollers-microprocessors/rz/rzg/doorphone-videos/vga3.h264;name=vga3 "

SRC_URI[vga1.md5sum] = "60ffbac29a9e0d11dc7386dc27b621aa"
SRC_URI[vga1.sha256sum] = "3c7186328f2b4408f04ec16488a4439e233b3a7fa0f087868a5f77bde5e70b30"
SRC_URI[vga2.md5sum] = "12ec2bc9f9de43e98a925221be5d8fb8"
SRC_URI[vga2.sha256sum] = "5dd2f84f13df1b89a66a35537cd3193612297ccfa9d0b298f7e4436b3b02bec1"
SRC_URI[vga3.md5sum] = "398ffe680591adc30f4217239f4d6bbf"
SRC_URI[vga3.sha256sum] = "58824011ce7dfbb8b639e8bef039000f1f6098062e8469efab6e5b8545f17dfc"


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

