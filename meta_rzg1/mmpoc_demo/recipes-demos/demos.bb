LICENSE = "CLOSED"
DESCRIPTION = "This is configuration for environments"

FILESEXTRAPATHS = "${THISDIR}/files:"
SRC_URI = "file://RZ_scripts.tar.xz"

do_install () {
	install -d ${D}/${ROOT_HOME}/RZ_scripts
	cp ${S}/../RZ_scripts/* ${D}/${ROOT_HOME}/RZ_scripts
}

INSANE_SKIP_${PN} += "ldflags debug-files"
do_patch[noexec] = "1"
do_cofigure[noexec] = "1"
do_compile[noexec] = "1"

PACKAGES = "${PN}"

FILES_${PN} = " /* "
