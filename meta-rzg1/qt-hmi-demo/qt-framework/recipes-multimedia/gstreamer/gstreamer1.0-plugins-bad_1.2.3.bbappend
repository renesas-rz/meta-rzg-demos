FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0001-Solve-issue-horizontal-noise-from-camera-due-to-usin.patch \
    file://0004-Change-encode-element-from-theora-to-omxh264enc.patch \
    file://0005-add-capsfilter-into-wrapper-camerabin-for-correct-wi.patch \
    file://0006-Temperory-disable-audio-as-RCA-camera-do-not-use-it.patch \
"
