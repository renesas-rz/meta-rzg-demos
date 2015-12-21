FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0001-gst-plugins-bad-waylandsink-Add-set-window-position.patch \
    file://0002-gst-plugins-bad-waylandsink-Add-set-window-scale.patch \
    file://0003-waylandsink-fix-memory-leak.patch \
"

PACKAGECONFIG_append = " opencv "

FILES_${PN}-opencv += "${datadir}/"

