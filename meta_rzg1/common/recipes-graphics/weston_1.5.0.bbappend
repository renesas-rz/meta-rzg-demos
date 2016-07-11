
require meta-rzg1/include/gles-control.inc

PATCHTOOL_rzg1 = "git"

FILESEXTRAPATHS_prepend := '${THISDIR}/patches:'
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# Cairo-glesv2 support in weston 1.5.0 is not stable. Disable temporary.
#PACKAGECONFIG_append = "${@' cairo-glesv2' if '${USE_GLES_WAYLAND}' == '1'  else ''}"


SRC_URI_append = " \
    file://0001-desktop-shell-add-option-to-avoid-creating-the-panel.patch \
    file://0001-Share-toytoolkit-lib.patch \
    file://0002-Add-non-blocking-display_poll-routine-to-dispatch-ev.patch \
    file://0003-libtoytoolkit-rename-header-window.h-toytoolkit.h.patch \
    file://0007-notify-client-immediately-on-buffer-release.patch \
    file://0008-window.c-do-not-resize-if-not-needed.patch \
    file://0017-Fixed-memory-corruption-when-focus-listener-is-moved.patch \
    file://0020-set-position-to-fix-problem-app-under-weston-bar.patch \
	file://0021-larger-weston-bar-suitable-for-touch-screen.patch \
"

FILES_${PN}-dev += "${libdir}/libweston-toytoolkit*"


# libinput improves touch features on Wayland/Weston
# Without this lib, Weston will use old touch implement and cannot
#    support multiple touch screens.
# Note that currently API of libinput is not stable, so newer version
#    of Weston may require newer version of libinput (and vice versa)
DEPENDS += "libinput"
EXTRA_OECONF += " --enable-libinput-backend "


# Rule for indentify LVDS touch device.
# Without this rule, if users connect HDMI touch device, they cannot touch
#    correctly on LVDS (all touch event will go to HDMI screen)
SRC_URI_append_iwg20m = " file://iwg20m-lvdstouch.rules "

do_install_append_iwg20m () {
    install -d ${D}/${sysconfdir}/udev/rules.d/
    install ${WORKDIR}/iwg20m-lvdstouch.rules ${D}/${sysconfdir}/udev/rules.d/
}


FILES_${PN}_append_iwg20m += " ${sysconfdir}/udev/rules.d/iwg20m-lvdstouch.rules "
