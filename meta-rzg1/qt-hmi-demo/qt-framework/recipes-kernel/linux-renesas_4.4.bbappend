FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

#SRC_URI_append_iwg20m = " \
#    file://iwg20m/0001-Add-fake-button-for-create-virtual-keyboard-for-r8a7743.patch \
#    file://iwg20m/0002-Add-fake-button-for-create-virtual-keyboard-for-r8a7744.patch \
#"

SRC_URI_append_iwg22m = " \
    file://iwg22m/0001-ARM-mach-shmobile-Reducing-CMA-reserve-from-256M-to-.patch \
"

SRC_URI_append_iwg21m = " \
    file://iwg21m-qt.cfg \
"

SRC_URI_append_iwg23s = " \
    file://iwg23s-qt.cfg \
"

SRC_URI_append_iwg20m = " \
    file://iwg20m-qt.cfg \
"
