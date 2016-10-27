FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# This patch is back-ported from Wayland upstream repo.
# It prevents error when building wayland-scanner for target package.
# Without this, we can only cross-compile wayland-scanner, cannot self-compile
SRC_URI_append = " file://0001-always-build-wayland-scanner.patch "


# Overwrite EXTRA_OECONF:
#    Before above patch, Wayland use option enable/disable-scanner
#    After apply above patch, it is replaced by --with/without-host-scanner
EXTRA_OECONF = "--disable-documentation --with-host-scanner"
EXTRA_OECONF_class-native = "--disable-documentation --without-host-scanner"
