FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_iwg20m = " \
    file://0002-Add-fake-button-for-create-virtual-keyboard-for-r8a7744.patch \
    file://0003-Update-CMA-config-to-solve-issue-low-memory.patch \
"
