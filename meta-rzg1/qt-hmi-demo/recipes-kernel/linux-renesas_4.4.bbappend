FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_iwg22m = " \
    file://iwg22m/0001-ARM-mach-shmobile-Reducing-CMA-reserve-from-256M-to-.patch \
"

SRC_URI_append_iwg21m = " \
    file://iwg21m-qt.cfg \
"

SRC_URI_append_iwg23s = " \
    file://iwg23s-qt.cfg \
    file://iwg23s/0001-ARM-shmobilel-setup-rcar-gen2-resize-CMA-area-1-for-.patch \
"

SRC_URI_append_iwg20m-g1m = " \
    file://iwg20m-g1m-qt.cfg \
"

SRC_URI_append_iwg20m-g1n = " \
    file://iwg20m-g1n-qt.cfg \
"
