LICENSE = "CLOSED"

FILESEXTRAPATHS = "${THISDIR}/doorphone-data:"
SRC_URI = "file://Test_scripts.tar.xz \
           file://0001-Modify-for-easier-to-change-location.patch \
"


S = "${WORKDIR}/Test_scripts"

inherit update-rc.d
INITSCRIPT_NAME = "doorphone.init"
INITSCRIPT_PARAMS = "start 99 5 2 3 . stop 99 0 1 6 ."

do_compile () {
    ${CC} ${S}/OutDoor/GPIO_button.c -o ${S}/OutDoor/GPIO_button
    ${CC} ${S}/OutDoor/guess-mess.c  -o ${S}/OutDoor/guess-mess $(pkg-config --cflags --libs gstreamer-1.0)
}

do_install () {
    install -d ${D}/${base_libdir}/
    install -d ${D}/${sysconfdir}/xdg/weston/
    install -d ${D}/home/root/doorphone
    #install -d ${D}/${sysconfdir}/network/
    install -d ${D}/${sysconfdir}/init.d
    install -d ${D}/${sysconfdir}/rc0.d/
    install -d ${D}/${sysconfdir}/rc1.d/
    install -d ${D}/${sysconfdir}/rc2.d/
    install -d ${D}/${sysconfdir}/rc3.d/
    install -d ${D}/${sysconfdir}/rc4.d/
    install -d ${D}/${sysconfdir}/rc5.d/
    install -d ${D}/${sysconfdir}/rc6.d/

    # Common
    install -m 0755 ${S}/doorphone.init  ${D}/${sysconfdir}/init.d/doorphone.init
    cp -RP ${S}/profile                  ${D}/home/root/.profile

    # Basephone
#    cp -RP ${S}/firmware                 ${D}/${base_libdir}/
    cp -RP ${S}/BasePhone/mailrc         ${D}/home/root/.mailrc
    cp -RP ${S}/BasePhone/msmtprc        ${D}/home/root/.msmtprc
    cp -RP ${S}/BasePhone/ssl            ${D}/${sysconfdir}/
    #cp -RP ${S}/BasePhone/weston.ini     ${D}/${sysconfdir}/xdg/weston/
    cp -RP ${S}/BasePhone/mail_list.txt  ${D}/
    cp -RP ${S}/BasePhone/mail           ${D}/home/root/doorphone

    #cp -RP ${S}/BasePhone/interfaces_basephone      ${D}/${sysconfdir}/network/interfaces

    # Outdoor
    install -m755 ${S}/OutDoor/GPIO_button            ${D}/home/root/doorphone
    install -m755 ${S}/OutDoor/guess-mess             ${D}/home/root/doorphone
    install -m755 ${S}/OutDoor/loop_script.sh         ${D}/home/root/doorphone
    install -m755 ${S}/OutDoor/run_outdoor_opencv.sh  ${D}/home/root/doorphone
    
}

INSANE_SKIP_${PN} += "ldflags"
do_cofigure[noexec] = "1"

PACKAGES = "\
    ${PN}-dbg \
    ${PN} \
"

FILES_${PN}-dbg = " /home/root/doorphone/.debug/ "

FILES_${PN} = " /* "

