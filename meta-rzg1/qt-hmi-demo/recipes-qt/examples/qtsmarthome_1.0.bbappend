FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_iwg20m-g1m += " \
    file://0001-config-size-for-compatible-with-LVDS-screen.patch \
"

SRC_URI_append_iwg20m-g1n += " \
    file://0001-config-size-for-compatible-with-LVDS-screen.patch \
"

SRC_URI_append_iwg21m += " \
    file://0001-config-size-for-compatible-with-LVDS-screen.patch \
"

SRC_URI_append_iwg22m += " \
    file://0001-qt-hmi-demo-Fit-qtsmarthome-app-with-the-screen-reso.patch \
"
