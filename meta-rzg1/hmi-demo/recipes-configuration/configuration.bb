LICENSE = "CLOSED"
DESCRIPTION = "This is configuration for environments"

FILESEXTRAPATHS = "${THISDIR}/files:"
SRC_URI = "file://profile "
	   
do_install () {
	install -d ${D}/${ROOT_HOME}
	cp ${S}/../profile ${D}/${ROOT_HOME}/.profile
}

INSANE_SKIP_${PN} += "ldflags"
do_patch[noexec] = "1"
do_cofigure[noexec] = "1"
do_compile[noexec] = "1"

PACKAGES = "${PN}"

FILES_${PN} = " /* "
