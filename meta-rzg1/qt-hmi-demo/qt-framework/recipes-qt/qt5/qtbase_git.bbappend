FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://example.xml \
    file://800px_El_Guamache_Bay.jpg \
"

do_install_append() {
	install -d ${D}/home/root
	install -m 755 ${WORKDIR}/example.xml ${D}/home/root/
	install -m 755 ${WORKDIR}/800px_El_Guamache_Bay.jpg ${D}/home/root/
}

#INSANE_SKIP_${PN} = "installed-vs-shipped "
FILES_${PN}-dbg += "home/root/.debug"
FILES_${PN} += "home/root"
