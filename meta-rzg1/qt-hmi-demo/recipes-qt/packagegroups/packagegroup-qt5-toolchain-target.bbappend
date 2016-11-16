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

# Remove qtsystems since it is actually not released with Qt5.0
# Also remove qtenginio as it it not guarantee compatible with Qt5.6
RDEPENDS_${PN}_remove = "qtsystems-dev"
RDEPENDS_${PN}_remove = "qtsystems-mkspecs"
RDEPENDS_${PN}_remove = "qtsystems-qmlplugins"
RDEPENDS_${PN}_remove = "qtenginio-dev"
RDEPENDS_${PN}_remove = "qtenginio-mkspecs"
RDEPENDS_${PN}_remove = "qtenginio-qmlplugins"

