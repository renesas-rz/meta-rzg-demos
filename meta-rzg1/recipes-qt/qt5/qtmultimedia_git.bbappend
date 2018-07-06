#Revision to update qt5.6.3
require qt5.6.3_git.inc
SRCREV = "4dd780a81e886a8a5eb86d1a045716ac4194eba1"

LIC_FILES_CHKSUM = " \
    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
"

PACKAGECONFIG_append = " gstreamer alsa"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-qtmultimedia-add-EGLImage-render-for-video-playback.patch \
    file://0002-change-position-video-format.patch \
    file://0003-qtmultimedia-Fix-Internal-data-stream-error-error-wh.patch \
    file://0004-Add-camerarecordermode-service-for-using-omxh264enc.patch \
    file://0005-Fix-binding-loop-for-declarative-camera.patch \
"

RDEPENDS_${PN}-plugins += " \
               gstreamer1.0 \
               gstreamer1.0-libav \
               gstreamer1.0-plugins-base \
               gstreamer1.0-plugins-base-app \
               gstreamer1.0-plugins-good \
               gstreamer1.0-plugins-good-video4linux2 \
               gstreamer1.0-plugins-bad \
               libgstbasecamerabinsrc-1.0 \
"
