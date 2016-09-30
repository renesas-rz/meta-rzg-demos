FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0001-gst145-gst-launch-Add-pad-probe.patch \
"
