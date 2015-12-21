FILESEXTRAPATHS_append := "${THISDIR}/qtmultimedia:"

SRC_URI_append += " \
    file://0001-qtmultimedia-fix-issue-drop-frame-when-play-video.patch \
    file://0002-qtmultimedia-add-configure-flag-for-playbin-not-usin.patch \
    file://0003-qtmultimedia-increase-timeout-in-waitForAsyncEvent.patch \
    file://0004-qtmultimedia-disable-I420-support-in-qgstutils.patch \
    file://0005-qtmultimedia-workaround-for-segmentation-fault-when-.patch \
    file://0006-qtmultimedia-add-setting-properties-for-playbin.patch \
    file://0007-qtmultimedia-change-glTexImage2D-to-glTexSubImage2D.patch \
    file://0008-qtmultimedia-Fix-wrong-display-color-for-Full-HD-vid.patch \
    file://0009-qtmultimedia-Fix-error-code-in-qmlvideo.patch \
    file://0010-qtmultimedia-rerun-glTexImage2D-when-glTexSubImage2D-fail.patch \
"
PACKAGECONFIG += " gstreamer"
