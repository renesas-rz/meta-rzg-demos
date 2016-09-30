FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
        file://0001-gst145-rtpL16depay-Allow-arbitrary-payload-id.patch \
        file://0002-gst145-v4l2src-Add-NV16-color-conversion.patch \
        file://0003-gst145-v4l2src-color-conversion-Use-memcpy_unalign-i.patch \
"

# Depend to libmemcpy as it is used in patch 0003
DEPENDS_append = " libmemcpy"
