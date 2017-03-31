FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://0001-Add-camerarecordermode-service-for-using-omxh264enc.patch \
	file://0004-Fix-binding-loop-for-declarative-camera.patch \
"

SRC_URI_append_iwg20m = " \
	file://0001-Fix-warning-issue-when-fullscreen-mode.patch \
"

SRC_URI_append_iwg21m = " \
	file://0001-Fix-warning-issue-when-fullscreen-mode.patch \
"

SRC_URI_append_iwg22m = " \
	file://0001-Fix-warning-issue-when-fullscreen-mode.patch \
"
