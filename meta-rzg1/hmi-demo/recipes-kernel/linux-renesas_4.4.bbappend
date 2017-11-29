FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_iwg22m = " \
    file://0001-kernel-edit-reserve-mem-to-value-SZ_64M.patch \
"
