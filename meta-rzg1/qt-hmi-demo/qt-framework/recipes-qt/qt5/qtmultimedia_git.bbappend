FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://0001-Add-camerarecordermode-service-for-using-omxh264enc.patch \
"

SRC_URI_append_iwg20m = " \
	file://0001-Fix-warning-issue-when-fullscreen-mode.patch \
"
