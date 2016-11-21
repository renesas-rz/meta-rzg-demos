# TODO add license
DESCRIPTION = "All Demos Packages for Qt5"

LICENSE = "MIT"

inherit packagegroup

PACKAGES = "\
    packagegroup-qt5-examples \
    "

ALLOW_EMPTY_${PN} = "1"


# Requires Wayland to work
QT5_WAYLAND_PACKAGES = " \
    qtwayland \
    qtwayland-plugins \
    qtwayland-tools \
"

QT5_EXAMPLES = " \
	qtbase-examples \
	qtconnectivity-examples \
	qtdeclarative-examples \
	qtmultimedia-examples \
	qt5ledscreen \
	qt5nmapcarousedemo \
	qt5nmapper \
	qt5-opengles2-test \
	qtsmarthome \
	quitbattery \
"

RDEPENDS_${PN} += " \
	qtbase \
	qtbase-plugins \
	qtbase-tools \
	${@base_contains('DISTRO_FEATURES', 'wayland', '${QT5_WAYLAND_PACKAGES}', '', d)} \
	qtdeclarative \
	qtdeclarative-plugins \
	qtdeclarative-tools \
	qtdeclarative-qmlplugins \
	qtimageformats-plugins \
	qtgraphicaleffects-qmlplugins \
	qtconnectivity \
	qtconnectivity-qmlplugins \
	qtmultimedia \
	qtmultimedia-plugins \
	qtmultimedia-qmlplugins \
	qtsvg \
	qtsvg-plugins \
	qtsensors \
	qtsensors-plugins \
	qtsensors-qmlplugins \
	qtscript \
	${QT5_EXAMPLES} \
"
