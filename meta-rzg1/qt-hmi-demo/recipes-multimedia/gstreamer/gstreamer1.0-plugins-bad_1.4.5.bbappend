FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0001-Solve-issue-horizontal-noise-from-camera-due-to-usin.patch \
"
