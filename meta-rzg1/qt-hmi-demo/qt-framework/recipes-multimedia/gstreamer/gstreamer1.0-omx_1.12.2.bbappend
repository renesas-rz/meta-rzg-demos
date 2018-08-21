FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0013-Workaround-issue-video-encode-set-property-2-times-u.patch \
"
