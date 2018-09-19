FILESEXTRAPATHS_append := "${THISDIR}/qtmultimedia:"

SRC_URI_append += " \
    file://0001-Fix-warning-issue-when-fullscreen-mode.patch \
    file://0002-Fix-wrong-GUI-and-warning-when-fullscreen-mode.patch \
"
