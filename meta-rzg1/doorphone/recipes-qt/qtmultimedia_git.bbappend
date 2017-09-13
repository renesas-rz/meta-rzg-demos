
FILESEXTRAPATHS_append := "${THISDIR}/qtmultimedia:"

SRC_URI_append = " \
	 file://0002-qtmultimedia-Add-services-for-Doorphone-demo.patch \
	 file://0003-H264streaming-fix-memory-leak.patch \
	 file://0004-audiostreaming-fix-memory-leak.patch \
	 file://0005-H264Streaming-Fix-unstable-connect-for-External-devi.patch \
	 file://0006-Flexible_Display_Support_H264StreamingSession_h.patch \
	 file://0007-Correct_function_call_for_SetVspmfiler1.patch \
	 file://0008-Flexible_Display_Support_H264StreamingSession_cpp.patch \
	 file://0009-DoorPhone-Fix-qtmultimedia-issues-on-Qt5.6.patch \
	 file://0010-DoorPhone-Modify-review-size-of-recorded-video.patch \
	 file://0011-DoorPhone-iWave-Fix-audio-issue-on-basephone.patch \
	 file://0012-Doorphone-audiostreaming-enable-change-port-host.patch \
"


DEPENDS += " gstreamer1.0-rtsp-server axistatlib qtquickcontrols "
RDEPENDS_${PN} += " gstreamer1.0-rtsp-server axistatlib qtquickcontrols-qmlplugins "
#PACKAGECONFIG += " gstreamer"

#TODO: Below workaround is need because Qt will not regenerate files
# with uppercase name. Change them to lowercase and remove workaround
do_compile_prepend () {
       # These header files are added for Doorphone demo.
       # But they are not generated automatically, so copy them manually here
       mkdir -p ${WORKDIR}/build/include/QtMultimedia
       cp ${S}/src/multimedia/controls/qaudiostreamingcontrol.h ${B}/include/QtMultimedia
       cp ${S}/src/multimedia/audio/qaudiostreaming.h           ${B}/include/QtMultimedia
       cp ${S}/src/multimedia/controls/qH264Streamingcontrol.h  ${B}/include/QtMultimedia
       cp ${S}/src/multimedia/playback/qH264Streaming.h         ${B}/include/QtMultimedia
       cp ${S}/src/multimedia/controls/qMP4Playbackcontrol.h    ${B}/include/QtMultimedia
       cp ${S}/src/multimedia/playback/qMP4Playback.h           ${B}/include/QtMultimedia
       cp ${S}/src/multimedia/controls/qMP4Recordercontrol.h    ${B}/include/QtMultimedia
       cp ${S}/src/multimedia/recording/qMP4Recorder.h          ${B}/include/QtMultimedia


       # Note: this issue happens because of conflict in QT and GLIB.
       # QT reserves "signal" keyword and does not allow other module use
       # this name, thus cause error with GLIB.
       # Remove unclean remain workaround
       sed -i 's/signals_rvc/signals/g' ${STAGING_DIR_TARGET}/usr/include/glib-2.0/gio/gdbusintrospection.h
       # Workaround
       sed -i 's/signals/signals_rvc/g' ${STAGING_DIR_TARGET}/usr/include/glib-2.0/gio/gdbusintrospection.h
}

do_compile_append () {
        # Remove workaround after finished building
        sed -i 's/signals_rvc/signals/g' ${STAGING_DIR_TARGET}/usr/include/glib-2.0/gio/gdbusintrospection.h
}


do_install_prepend () {
       # Note: this issue happens because of conflict in QT and GLIB.
       # QT reserves "signal" keyword and does not allow other module use
       # this name, thus cause error with GLIB.
       # Remove unclean remain workaround
       sed -i 's/signals_rvc/signals/g' ${STAGING_DIR_TARGET}/usr/include/glib-2.0/gio/gdbusintrospection.h
       # Workaround
       sed -i 's/signals/signals_rvc/g' ${STAGING_DIR_TARGET}/usr/include/glib-2.0/gio/gdbusintrospection.h
}

do_install_append () {
        # Remove workaround after finished building
        sed -i 's/signals_rvc/signals/g' ${STAGING_DIR_TARGET}/usr/include/glib-2.0/gio/gdbusintrospection.h
}


