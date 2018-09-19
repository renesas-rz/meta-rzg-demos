FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://0001-Make-application-compatible-with-flexible-resolution.patch \
	file://0002-Add-fileio.h-to-avoid-error-when-build.patch \
"
