FILESEXTRAPATHS_append := "${THISDIR}/qtmultimedia:"

SRC_URI_append += " \
    file://0002-qtmultimedia-qmlvideo-add-fullscreen-display-support.patch \
    file://0003-qtmultimedia-Fix-error-code-in-qmlvideo.patch \
"
SRC_URI_append_iwg20m += " \
    file://0001-qtmultimedia-qmlvideofx-update-GUI-compatible-iWave.patch \
    file://0002-qtmultimedia-qmlvideofx-correct-Fullscreen-setting-f.patch \
"

SRC_URI_append_iwg21m += " \
    file://0001-qtmultimedia-qmlvideofx-update-GUI-compatible-iWave.patch \
    file://0002-qtmultimedia-qmlvideofx-correct-Fullscreen-setting-f.patch \
"

SRC_URI_append_iwg22m += " \
    file://0001-qtmultimedia-qmlvideofx-update-GUI-compatible-iWave.patch \
    file://0002-qtmultimedia-qmlvideofx-correct-Fullscreen-setting-f.patch \
"
SRC_URI_append_iwg23s += " \
    file://0001-qtmultimedia-qmlvideofx-update-GUI-compatible-iWave.patch \
    file://0002-qtmultimedia-qmlvideofx-correct-Fullscreen-setting-f.patch \
"

PACKAGECONFIG += " gstreamer alsa"
