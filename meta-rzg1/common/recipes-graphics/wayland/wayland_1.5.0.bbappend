FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += "							\
	file://wayland-environment					\
	file://userspace-proprietary-environment			\
"

do_install_append() {
	install -d ${D}/${sysconfdir}/profile.d
	install -m755 ${WORKDIR}/wayland-environment ${D}/${sysconfdir}/profile.d/wayland-environment
	install -m755 ${WORKDIR}/userspace-proprietary-environment ${D}/${sysconfdir}/profile.d/userspace-proprietary-environment
}
