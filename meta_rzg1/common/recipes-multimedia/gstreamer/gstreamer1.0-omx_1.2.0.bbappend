FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-gst145-omxbufferpool-Fixed-memory-corruption-and-bad-acc.patch \
    file://0002-gst145-omxvideodec-add-planebuf-to-allocation-reques.patch \
    file://0003-gst145-omxvideoenc-add-UseBuffer-with-physical-addr.patch \
    file://0004-gst145-omxvideoenc-Add-re-matching-p_address.patch \
    file://0005-gst145-omxvideoenc-add-querysink-for-inbuf-address.patch \
"
