#Do not use X11 if we are building for Wayland
USE_X11 = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', 'qtx11extras-dev', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', 'qtx11extras-mkspecs', d)} \
"

RDEPENDS_${PN} += " \
    qtbase-tools \
    qtdeclarative-tools \
    qtxmlpatterns-tools \
"

# meta-qt5 still use qtwebkit and qtquick1, although they are removed from Qt 5.6
# Overwrite USE_RUBY to prevent using them
USE_RUBY = " "
