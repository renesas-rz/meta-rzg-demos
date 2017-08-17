SUMMARY = "ALSA Basic Audio Tester command line tool"

SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2"
SRC_URI[md5sum] = "b9d6102fbbd0b68040bb77023ed30c0c"
SRC_URI[sha256sum] = "3b1c3135b76e14532d3dd23fb15759ddd7daf9ffbc183f7a9a0a3a86374748f1"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
DEPENDS = "alsa-lib fftw"

S = "${WORKDIR}/alsa-utils-${PV}"

EXTRA_OECONF +=  "\
		 --disable-alsatest \
		 --disable-alsamixer \
		 --disable-alsaconf \
		 --disable-alsaloop \
		 --disable-xmlto \
		 --disable-largefile \
		 --disable-nls \
		"

inherit autotools-brokensep

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${S}/bat/bat ${D}${bindir}
	install -d ${D}${mandir}/man1
	install -m 0644 ${S}/bat/bat.1 ${D}${mandir}/man1
}
