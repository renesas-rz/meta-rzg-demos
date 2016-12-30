FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0004-change-default-size-for-v4l2src-to-support-encode-im.patch \
"
