LICENSE = "CLOSED"
DESCRIPTION = "This is configuration for environments"

FILESEXTRAPATHS = "${THISDIR}/files:"
SRC_URI = " \
	file://profile \
	file://0001-remove-redundancy-amixer-setting-in-etc-profile-and-.patch \
"

do_patch() {
	cd ${S}/../.
	patch -p1 < 0001-remove-redundancy-amixer-setting-in-etc-profile-and-.patch
}

do_install () {
	install -d ${D}/${ROOT_HOME}
	cp ${S}/../profile ${D}/${ROOT_HOME}/.profile
	cp ${S}/../bashrc ${D}/${ROOT_HOME}/.bashrc
}

INSANE_SKIP_${PN} += "ldflags"
do_cofigure[noexec] = "1"
do_compile[noexec] = "1"

PACKAGES = "${PN}"

FILES_${PN} = " /* "
