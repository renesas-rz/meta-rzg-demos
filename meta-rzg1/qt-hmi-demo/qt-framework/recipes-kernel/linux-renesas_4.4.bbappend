FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_iwg20m = " \
    file://0001-Add-fake-button-for-create-virtual-keyboard-for-r8a7743.patch \
"
