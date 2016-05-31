FILESEXTRAPATHS_append := "${THISDIR}/qtmultimedia:"

SRC_URI_append += " \
    file://0001-qtmultimedia-add-EGLImage-render-for-video-playback.patch \
    file://0002-qtmultimedia-qmlvideo-add-fullscreen-display-support.patch \
    file://0003-qtmultimedia-Fix-error-code-in-qmlvideo.patch \
"
PACKAGECONFIG += " gstreamer"
