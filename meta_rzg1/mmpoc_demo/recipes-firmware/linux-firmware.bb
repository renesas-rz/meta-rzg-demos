LICENSE = "CLOSED"
DESCRIPTION = "Linux wireless firmware"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI = " \
    file://linux-firmware.tar.xz \
"
	   
do_install () {
    install -d ${D}/${base_libdir}/firmware

    cp -rf ${S}/../linux-firmware/* ${D}/${base_libdir}/firmware/
}

INSANE_SKIP_${PN} += "ldflags"
do_patch[noexec] = "1"
do_cofigure[noexec] = "1"
do_compile[noexec] = "1"

PACKAGES = "${PN}"

FILES_${PN} = " /* "
