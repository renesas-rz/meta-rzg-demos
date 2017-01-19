FILESEXTRAPATHS_prepend := '${THISDIR}/weston:'

SRC_URI_append = " \
    file://0001-weston-add-active-when-set-toplevel.patch \
"
