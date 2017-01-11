FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
        file://0001-Add-waylandsink-as-default-playing-in-gstreamer-play.patch \
"
PACKAGECONFIG_append = " faac faad"
