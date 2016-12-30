FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0014-gstvspmfilter-change-to-output-alloc-as-default.patch \
    file://0016-gstplaybin-remove-queue.patch \
    file://0017-add-vspmfilter-and-omxh264enc-caps-in-encodebin.patch \
"
