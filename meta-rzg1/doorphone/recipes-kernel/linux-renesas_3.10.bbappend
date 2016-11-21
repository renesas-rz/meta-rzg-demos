FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_iwg20m = " \
    file://0001-DoorPhone-iWave-change-cma-size-and-add-fake-button.patch \
"
