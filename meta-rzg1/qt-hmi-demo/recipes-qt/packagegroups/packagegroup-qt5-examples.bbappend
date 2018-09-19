# TODO add license
DESCRIPTION = "All Demos Packages for Qt5"

LICENSE = "MIT"

inherit packagegroup

PACKAGES = "\
    packagegroup-qt5-examples \
    "

ALLOW_EMPTY_${PN} = "1"

QT5_EXAMPLES += " \
	qtconnectivity-examples \
	qt5ledscreen \
	qt5nmapcarousedemo \
	qt5nmapper \
	qt5-opengles2-test \
	qtsmarthome \
	quitbattery \
	cinematicexperience \
	qtsmarthome \
	qt5everywheredemo \
	qt5-launch-demo \
	qtwebkit \
	qtwebkit-examples-examples \
	qtwebkit-qmlplugins \
	qt-framework-launcher \
	qt-omxh264enc-demo \
"
