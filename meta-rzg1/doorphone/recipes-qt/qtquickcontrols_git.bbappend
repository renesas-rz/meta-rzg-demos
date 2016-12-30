FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
#Revision to update qt5.6.2
PV = "5.6.2+git${SRCPV}"
SRCREV = "59c6c0e0b1b5b46747595a58e11311b7393d7e70"

LIC_FILES_CHKSUM = " \
    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
"

# Replace patch to work with Qt5.6.2, old patch only work with Qt.5.6.1
SRC_URI_remove = "file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch"
SRC_URI += " file://0001-Update-texteditor-fix-invalid-use-of-incomplete-type-class-.patch "
