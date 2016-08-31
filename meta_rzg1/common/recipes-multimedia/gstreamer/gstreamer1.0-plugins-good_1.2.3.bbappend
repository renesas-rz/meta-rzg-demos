FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://0001-rtpL16depay-Allow-arbitrary-payload-id.patch \
	file://0002-v4l2src-Add-NV16-color-conversion.patch \
        file://0003-v4l2src-color-conversion-Use-memcpy_unalign-instead-of-memcpy-when-copy-data.patch \
"

