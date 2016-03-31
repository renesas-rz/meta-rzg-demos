FILESEXTRAPATHS_prepend := '${THISDIR}/patches:'

SRC_URI_append = " \
    file://0021-add-script-kill-Loading-app-when-finish-display-Qt.patch \
"
