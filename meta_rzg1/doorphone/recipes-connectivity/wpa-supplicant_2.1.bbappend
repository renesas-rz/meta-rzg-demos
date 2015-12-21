FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append = " file://wpa_supplicant_doorphone.conf"

do_install_append () {
    install -m 600 ${WORKDIR}/wpa_supplicant_doorphone.conf ${D}${sysconfdir}/wpa_supplicant.conf
}
