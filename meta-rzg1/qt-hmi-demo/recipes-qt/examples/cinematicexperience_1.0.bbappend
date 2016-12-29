FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0001-add-exit-button-for-full-screen-display.patch \
    file://exit.png \
    file://0002-remove_heading_image.patch \
    file://0003-fix_missing_avatar_pic_support_iwaveN.patch \
"
do_install_append() {
    install ${WORKDIR}/exit.png ${D}${datadir}/${P}/content/images
}
