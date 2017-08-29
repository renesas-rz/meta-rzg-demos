FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_iwg20m += " \
    file://0001-Make-text-flexible-with-resolution-screen-in-qt-smarthome.patch \
"
