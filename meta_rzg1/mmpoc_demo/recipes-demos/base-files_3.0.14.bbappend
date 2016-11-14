# Set volume for audio demo
do_install_append () {
        echo "amixer set 'DVC Out' 30" >> ${D}${sysconfdir}/profile
        echo "amixer set 'Headphone' 110" >> ${D}${sysconfdir}/profile
}
