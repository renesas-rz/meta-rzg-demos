FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
	file://pulse-daemon.conf \
"

do_install_append() {
	install -d ${D}/${sysconfdir}/pulse/
	install -m755 ${WORKDIR}/pulse-daemon.conf ${D}/${sysconfdir}/pulse/daemon.conf
}
