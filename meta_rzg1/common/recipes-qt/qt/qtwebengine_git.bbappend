FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
	file://0001-Solve-problem-when-build-QtWebEngine-v5.6.patch \
"
