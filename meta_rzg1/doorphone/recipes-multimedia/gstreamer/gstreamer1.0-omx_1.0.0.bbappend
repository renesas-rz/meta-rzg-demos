FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0002-omx-videodec-add-planebuf-to-allocation-request.patch \
    file://0003-Fixed-memory-corruption-and-bad-access.patch \
"

SRC_URI_append = " \
    file://0004-omxvideoenc-add-UseBuffer-with-physical-addr.patch \
    file://0005-omxvideoenc-add-nPFrames-for-AVCINTRAPERIOD-config.patch \
    file://0006-omxvideoenc-Add-re-matching-p_address.patch \
    file://0007-omxvideoenc-add-querysink-for-inbuf-address.patch \
    file://0008-omxvideoenc-fix-error-w-v4l2src-I420-format.patch \
    file://0009-omxvideoenc-fix-error-with-v4l2src-by-update-p_buffers.patch \
    file://0010-omxh264enc-Workaround-issue-only-support-video-with-.patch \
    file://0011-fix-memory-leak-for-omx.patch \
    file://0012-fix-memory-leak-for-omxvideodec.patch \
"
