FILESEXTRAPATHS_append := "${@base_contains('DISTRO_FEATURES', 'wayland','${THISDIR}/qtwayland:','',d)}"
SRC_URI_append = " file://qtwayland-re-acivate-wayland-shell-surface.patch "

SRC_URI_append_iwg20m = " \
	file://0001-DoorPhone-Fix-issue-HDMI-display-on-iWave.patch \
"
