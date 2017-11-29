# Prepend to force bitbake takes our file first
FILESEXTRAPATHS_prepend := "${THISDIR}/weston-init:"

SRC_URI_append_iwg22m = " \
 file://0001-Remove-IP-show-and-terminal-icon.patch \
"
