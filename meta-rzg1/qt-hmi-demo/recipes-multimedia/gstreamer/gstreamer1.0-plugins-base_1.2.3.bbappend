FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0014-gstvspmfilter-change-to-output-alloc-as-default.patch \
    file://0016-gstplaybin-remove-queue.patch \
"
