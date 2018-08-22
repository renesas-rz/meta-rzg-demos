FILESEXTRAPATHS_prepend := '${THISDIR}/weston:'

SRC_URI_append = " \
    file://0001-weston-add-script-kill-Loading-app-when-finish-displ.patch \
"
