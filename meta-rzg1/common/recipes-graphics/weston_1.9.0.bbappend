FILESEXTRAPATHS_prepend := '${THISDIR}/weston:'

# Cairo-glesv2 support in weston 1.5.0 is not stable. Disable temporary.
PACKAGECONFIG_append = "${@' cairo-glesv2' if '${USE_GLES_WAYLAND}' == '1'  else ''}"


SRC_URI_append = " \
    file://1001-Share-toytoolkit-lib.patch \
    file://1002-Add-non-blocking-display_poll-routine-to-dispatch-ev.patch \
    file://1003-libtoytoolkit-rename-header-window.h-toytoolkit.h.patch \
    file://1004-window.c-do-not-resize-if-not-needed.patch \
    file://1005-Fixed-memory-corruption-when-focus-listener-is-moved.patch \
    file://1007-set-position-to-fix-problem-app-under-weston-bar.patch \
	file://1008-larger-weston-bar-suitable-for-touch-screen.patch \
	file://1009-Remove-checking-status-of-device-to-support-display-.patch \
    file://1010-Fix-Weston-crash-on-touchscreen-input.patch \
"

FILES_${PN}-dev += "${libdir}/libweston-toytoolkit*"

RDEPENDS_${PN} = "gles-user-module"
RDEPENDS_${PN}_examples = "gles-user-module"
