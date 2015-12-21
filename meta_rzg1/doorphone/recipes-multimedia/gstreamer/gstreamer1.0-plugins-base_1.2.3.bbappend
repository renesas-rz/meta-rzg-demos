FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += " \
    file://0001-gst-plugins-base-playbin-add-properties-decode-dmabuf-and-decode-nocopy.patch \
"

DEPENDS_append += " mmngr-kernel-module mmngr-user-module mmngrbuf-kernel-module mmngrbuf-user-module vspm-user-module vspm-kernel-module"

SRC_URI_append = " \
	file://0002-gst-plugins-base-vspmfilter-Add-new-plugin-support-DMAbuf.patch \
    file://0003-gst-plugins-base-vspmfilter-add-outbuf-alloc-mode.patch \
    file://0004-gst-plugins-base-videoencoder-fix-error-w-I420-format.patch \
    file://0005-vspmfilter-Align-the-start-address-of-the-CbCr-ingre.patch \
	file://0006-vspmfilter-add-RGB-and-RGBx-output.patch \
	file://0007-vspmfilter-fix-memory-leak.patch \
"
