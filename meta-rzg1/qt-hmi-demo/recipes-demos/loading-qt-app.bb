LICENSE = "CLOSED"
DESCRIPTION = "Loading Qt app"

SRC_URI += " \
 file://Loading \
 file://check_loading.sh \
 file://libjpeg.so.9 \
"

S = "${WORKDIR}"

do_install() {
    install -d ${D}/home/root/loading-qt-app
    install -d ${D}/usr/lib/
    install -m 755 ${S}/Loading ${D}/home/root/loading-qt-app/
    install -m 755 ${S}/check_loading.sh ${D}/home/root/loading-qt-app/
    install -m 755 ${S}/libjpeg.so.9 ${D}/usr/lib/
}

FILES_${PN} = "/home/root/loading-qt-app/* \
               /usr/lib/* \
"
FILES_${PN}-dbg = "/home/root/loading-qt-app/.debug/*"
INSANE_SKIP_${PN} = "already-stripped file-rdeps"
