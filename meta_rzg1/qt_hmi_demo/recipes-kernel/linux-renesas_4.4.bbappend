FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0001-Revert-Cogent-update-due-to-low-performance-Qt.patch \
"
