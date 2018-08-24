LICENSE = "CLOSED"
DESCRIPTION = "preload qt libs"

SRC_URI += " \
 file://qtpreload.sh \
 file://qtpreload \
"

S = "${WORKDIR}"

inherit update-rc.d
INITSCRIPT_NAME = "qtpreload.sh"
INITSCRIPT_PARAMS = "start 99 2 3 4 5 . stop 99 0 1 6 ."

do_install() {
    install -d ${D}/home/root/qtpreload
    install -m 755 ${S}/qtpreload ${D}/home/root/qtpreload/
    install -d ${D}/etc/init.d
    install -m 755 ${S}/qtpreload.sh ${D}/etc/init.d/
}

do_package_qa() {
}

FILES_${PN} = "/home/root/qtpreload/* \
/etc/init.d/ \
"
FILES_${PN}-dbg = "/home/root/qtpreload/.debug/*"
