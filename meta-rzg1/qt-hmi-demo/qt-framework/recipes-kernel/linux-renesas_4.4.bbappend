FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

do_configure_append_iwg23s() {
    kernel_configure_variable_val CMA_SIZE_MBYTES 178
    yes '' | oe_runmake oldconfig
}

do_configure_append_iwg21m() {
    kernel_configure_variable_val CMA_SIZE_MBYTES 256
    yes '' | oe_runmake oldconfig
}

#SRC_URI_append_iwg20m = " \
#    file://iwg20m/0001-Add-fake-button-for-create-virtual-keyboard-for-r8a7743.patch \
#    file://iwg20m/0002-Add-fake-button-for-create-virtual-keyboard-for-r8a7744.patch \
#"

SRC_URI_append_iwg22m = " \
    file://iwg22m/0001-ARM-mach-shmobile-Reducing-CMA-reserve-from-256M-to-.patch \
"
