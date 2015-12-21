
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
    file://0014-weston-add-support-set-position-from-client.patch \
    file://0015-weston-add-support-set-scaling-from-client.patch \
    file://0016-weston-update-support-flexible-set-scaling-from-client.patch \
    file://0017-Fixed-memory-corruption-when-focus-listener-is-moved.patch \
    file://0018-weston-add-activate-when-set-toplevel.patch \
"

FILES_${PN}-dev += "${libdir}/libweston-toytoolkit*"
