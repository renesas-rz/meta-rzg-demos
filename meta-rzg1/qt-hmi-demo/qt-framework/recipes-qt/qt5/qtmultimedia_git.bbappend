FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
        file://0001-camerarecordermode-fit-screen-display-camera-with-Qt.patch \
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
