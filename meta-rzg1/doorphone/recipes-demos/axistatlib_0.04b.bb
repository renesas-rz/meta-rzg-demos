LICENSE = "CLOSED"

SRC_URI = "file://Axistat0.04b_rzg.tar.xz"


S = "${WORKDIR}/usr"


do_install() {
    mkdir ${D}/usr
    cp -RP ${S}/include ${D}/usr
    cp -RP ${S}/lib ${D}/usr
}

INSANE_SKIP_${PN} += "ldflags"
do_compile[noexec] = "1"
do_patch[noexec] = "1"
do_cofigure[noexec] = "1"

PACKAGES = "\
    ${PN} \
    ${PN}-dev \
    ${PN}-dbg \
"

FILES_${PN} = " \
    ${libdir}/* \
"

FILES_${PN}-dev = " \
    ${includedir}/* \
"
FILES_${PN}-dbg = " \
     ${libdir}/.debug \
"
