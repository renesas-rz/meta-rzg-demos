FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_iwg20m = " \
    file://0001-Add-fake-button-for-create-virtual-keyboard-for-r8a7743.patch \
"

SRC_URI_append_iwg22m = " \
    file://iwg22m/0001-ARM-mach-shmobile-Reducing-CMA-reserve-from-256M-to-.patch \
"
