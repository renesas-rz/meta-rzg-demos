LICENSE = "CLOSED"
DESCRIPTION = "Linux wireless firmware"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI = " \
	file://rt2561.bin \
	file://rt2561s.bin \
	file://rt2661.bin \
	file://rt2860.bin \
	file://rt2870.bin \
	file://rt3071.bin \
	file://rt3290.bin \
	file://rt73.bin \
	file://rtlwifi.tar.xz \
"

S = "${WORKDIR}"

do_install () {
	install -d ${D}/${base_libdir}/firmware
	install -m 775 ${S}/rt*.bin ${D}/${base_libdir}/firmware

	install -d ${D}/${base_libdir}/firmware/rtlwifi
	install -m 775 ${S}/rtlwifi/* ${D}/${base_libdir}/firmware/rtlwifi
}

INSANE_SKIP_${PN} += "ldflags"
do_patch[noexec] = "1"
do_cofigure[noexec] = "1"
do_compile[noexec] = "1"

PACKAGES = "${PN}"

FILES_${PN} = " /* "
