# Set volume for audio demo
do_install_append () {
        echo "amixer set 'DVC Out' 10" >> ${D}${sysconfdir}/profile
        echo "amixer set 'LINEOUT Mixer DACL' on" >> ${D}${sysconfdir}/profile
}
