LICENSE = "CLOSED"
DESCRIPTION = "This is configuration for environments"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI = " \
 file://RZ_scripts.tar.xz  \
 file://ATT93936.bashrc \
 file://0001-Add-CAM_DEV-variable-to-camera-encoding-script.patch \
 file://0002-HMI-fix-issue-video-file-encoded-too-fast.patch \
"

do_install () {
	install -d ${D}/${ROOT_HOME}/RZ_scripts
	cd ${S}/../RZ_scripts
	git apply ../*.patch
	chmod 755 ${S}/../RZ_scripts -Rf
	cp ${S}/../RZ_scripts/* ${D}/${ROOT_HOME}/RZ_scripts
	cp ${S}/../ATT93936.bashrc ${D}/${ROOT_HOME}/.bashrc
}

INSANE_SKIP_${PN} += "ldflags debug-files"
do_patch[noexec] = "1"
do_cofigure[noexec] = "1"
do_compile[noexec] = "1"

PACKAGES = "${PN}"

FILES_${PN} = " /* "
