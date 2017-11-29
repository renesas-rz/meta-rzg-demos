FILESEXTRAPATHS_prepend := '${THISDIR}/weston:'

SRC_URI_append = " \
    file://0021-add-script-kill-Loading-app-when-finish-display-Qt.patch \
    file://1010-Fix-app-under-weston-taskbar-after-restore-down-issu.patch \
"
