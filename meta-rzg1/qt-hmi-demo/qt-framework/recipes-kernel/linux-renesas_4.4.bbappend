FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

do_configure_append_iwg23s() {
    kernel_configure_variable_val CMA_SIZE_MBYTES 178
    yes '' | oe_runmake oldconfig
}

SRC_URI_append_iwg20m = " \
    file://0001-Add-fake-button-for-create-virtual-keyboard-for-r8a7743.patch \
"

SRC_URI_append_iwg22m = " \
    file://iwg22m/0001-ARM-mach-shmobile-Reducing-CMA-reserve-from-256M-to-.patch \
"
