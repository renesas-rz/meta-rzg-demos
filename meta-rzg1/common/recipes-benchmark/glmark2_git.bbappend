FILESEXTRAPATHS_prepend := '${THISDIR}/glmark2:'
# Change setting for support GLES2 of wayland only
# Disable the drm-gl drm-gles2 wayland-gl modules of glmark2
PACKAGECONFIG_remove = " drm-gl drm-gles2 wayland-gl"

DEPENDS += " libegl mesa"

SRC_URI_append = " \
    file://0001-glmark2-Define-WL_EGL_PLATFORM-to-fix-compilation-wi.patch \
    file://0002-glmark2-gl-state-egl-Add-define-EGL_PLATFORM_GBM_KHR.patch \
"

FILES_${PN}-dev = "${libdir}/* ${includedir}"

do_package_qa() {
}
