FILESEXTRAPATHS_prepend := '${THISDIR}/patches:'

SRC_URI_append = " \
     file://0001-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
"
