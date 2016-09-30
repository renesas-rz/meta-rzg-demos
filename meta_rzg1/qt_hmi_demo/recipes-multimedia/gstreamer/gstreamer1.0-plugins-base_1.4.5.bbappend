FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0001-gst145-gstplaybin-remove-queue.patch \
    file://0002-gst145-gstvspmfilter-change-to-output-alloc-as-default.patch \
"
