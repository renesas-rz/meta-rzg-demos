FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://0001-Add-camerarecordermode-service-for-using-omxh264enc.patch \
	file://0004-Fix-binding-loop-for-declarative-camera.patch \
	file://0001-change-position-video-format.patch \
	file://0002-qtmultimedia-Fix-Internal-data-stream-error-error-wh.patch \
	file://0004-add_QtGstLaunch_service.patch \
"

SRC_URI_append_iwg20m = " \
	file://0001-Fix-warning-issue-when-fullscreen-mode.patch \
"

SRC_URI_append_iwg22m = " \
	file://0001-Fix-warning-issue-when-fullscreen-mode.patch \
"