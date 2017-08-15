FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://load-proprietary-modules.init;md5=21de822be98a8ba6855b50f0328f329b \
"

do_install_append() {
    install -d ${D}/${sysconfdir}/init.d
    install -m755 ${WORKDIR}/load-proprietary-modules.init ${D}/${sysconfdir}/init.d/load-proprietary-modules
}

inherit update-rc.d

INITSCRIPT_NAME = "load-proprietary-modules"
INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 20 0 1 6 ."
