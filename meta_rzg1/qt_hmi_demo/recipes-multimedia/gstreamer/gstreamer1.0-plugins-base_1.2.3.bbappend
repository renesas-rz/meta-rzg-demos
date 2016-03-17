FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0001-gst-plugins-base-vspmfilter-Add-new-plugin-support-DMAbuf.patch \
    file://0002-gst-plugins-base-vspmfilter-add-outbuf-alloc-mode.patch \
    file://0003-gst-plugins-base-videoencoder-fix-error-w-I420-format.patch \
    file://0001-vspmfilter-Align-the-start-address-of-the-CbCr-ingre.patch \
    file://0004-gst-plugins-base-playbin-add-properties-decode-dmabuf-and-decode-nocopy.patch \
    file://0005-vspmfilter-add-RGB-and-RGBx-output.patch \
    file://0006-vspmfilter-fix-memory-leak.patch \
    file://0007-vspmfilter-Rewrite-implement-for-swap.patch \
    file://0008-vspmfilter-Add-all-possible-format-that-vspm-can-han.patch \
    file://0009-vspmfilter-Rewrite-caps-with-available-format-only.patch \
    file://0010-vspmfilter-Update-setting-in-out-params.patch \
    file://0011-gstvspmfilter-add-bufferpool.patch \
    file://0012-gstvspmfilter-re-add-memory_alignment.patch \
    file://0013-gstvspmfilter-change-to-output-alloc-as-default.patch \
"

DEPENDS_append += " mmngr-kernel-module mmngr-user-module mmngrbuf-kernel-module mmngrbuf-user-module vspm-user-module vspm-kernel-module"
