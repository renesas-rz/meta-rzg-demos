# Prepend to force bitbake takes our file first
FILESEXTRAPATHS_prepend := "${THISDIR}/weston-init:"

SRC_URI_append_rzg1 = " file://weston.ini"

do_install_append_rzg1() {
    install -D -m 644 ${WORKDIR}/weston.ini ${D}/etc/xdg/weston/weston.ini
}
