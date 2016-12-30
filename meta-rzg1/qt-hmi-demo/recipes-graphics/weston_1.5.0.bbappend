FILESEXTRAPATHS_prepend := '${THISDIR}/patches:'

SRC_URI_append = " \
    file://0021-add-script-kill-Loading-app-when-finish-display-Qt.patch \
    file://0022-Weston-add-launcher-taskbar-height-entry-in-weston.i.patch \
"
