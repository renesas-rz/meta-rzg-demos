FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_skrzg1m += " \
	file://0001-Solve-problem-when-build-QtWebEngine-v5.6.patch \
	file://libQt5WebEngineCore.so.5.6.1 \
"
SRC_URI_append_skrzg1e += " \
	file://libQt5WebEngineCore.so.5.6.1 \
"
SRC_URI_append_iwg20m += " \
    file://0001-qtwebengine-quicknanobrowser-update-GUI-for-compatible-with-iWave.patch \
"

#Work around fix issue can't load web page in RZG1M
do_install_append_skrzg1m() {
    install -d ${D}/usr/lib/
    install -m 755 ${S}/../libQt5WebEngineCore.so.5.6.1 ${D}/usr/lib/
}

#Work around use this lib for SKZG1E like as RZG1M
do_install_append_skrzg1e() {

    install -d ${D}/usr/lib/

    install -m 755 ${S}/../libQt5WebEngineCore.so.5.6.1 ${D}/usr/lib/

}

INSANE_SKIP_${PN} = "already-stripped"
