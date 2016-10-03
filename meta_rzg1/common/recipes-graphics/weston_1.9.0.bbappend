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
"

FILES_${PN}-dev += "${libdir}/libweston-toytoolkit*"

# Rule for indentify LVDS touch device.
# Without this rule, if users connect HDMI touch device, they cannot touch
#    correctly on LVDS (all touch event will go to HDMI screen)
SRC_URI_append_iwg20m = " weston://iwg20m-lvdstouch.rules "

do_install_append_iwg20m () {
    install -d ${D}/${sysconfdir}/udev/rules.d/
    install ${WORKDIR}/iwg20m-lvdstouch.rules ${D}/${sysconfdir}/udev/rules.d/
}

FILES_${PN}_append_iwg20m += " ${sysconfdir}/udev/rules.d/iwg20m-lvdstouch.rules "

RDEPENDS_${PN} = "gles-user-module"
RDEPENDS_${PN}_examples = "gles-user-module"
