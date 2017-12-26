include core-image-weston.inc
  
IMAGE_INSTALL_append_rzg1 = " \
    opencv \
    opencv-apps \
    opencv-samples \
    python-opencv \
    qtwayland \
    qtwayland-plugins \
    qtbase-fonts \
    qtbase-plugins \
    qtbase-tools \
    qtbase-examples \
    qtdeclarative \
    qtdeclarative-plugins \
    qtdeclarative-tools \
    qtdeclarative-examples \
    qtdeclarative-qmlplugins \
    qtimageformats-plugins \
    qtsvg \
    qtsvg-plugins \
    qtsensors \
    qtscript \
    qtgraphicaleffects-qmlplugins \
    qtmultimedia \
    qtmultimedia-examples \
    qtmultimedia-plugins \
    qtmultimedia-qmlplugins \
    qtquickcontrols-qmlplugins \
    gstreamer1.0-plugins-good-alaw \
"

IMAGE_INSTALL_append_rzg1 = " \
     gstreamer1.0-rtsp-server \
     qtmultimedia qtmultimedia-plugins \
     qtmultimedia-qmlplugins \
     gstreamer1.0-libav \
     pulseaudio-server \
     pulseaudio-module-echo-cancel \
     gstreamer1.0-plugins-good-pulse \
     gstreamer1.0-plugins-good-rtpmanager \
     doorphone-scripts \
     doorphone-videos \
     mailx \
     msmtp \
     axistatlib \
     simple-player-qml \
     wireless-firmware \
     gstreamer1.0-plugins-bad-opencv \
"

### MODIFY for Doorphone before creating image###
# Doorphone needs two different images for Basephone and Outdoor boards

# Manually set up the IP for Outdoor board
# Doorphone demo need this IP to run, don't change it
setup_outdoor () {

    # Back up first
    cp ${IMAGE_ROOTFS}${sysconfdir}/network/interfaces ${IMAGE_ROOTFS}/../interfaces.bk

    # Set static IP for Outdoor: 192.168.10.101
    sed -i 's/iface eth0 inet dhcp/iface eth0 inet static\
    address 192.168.10.101\
    hwaddress ether 00:01:02:03:04:45\
    netmask 255.255.255.0/' ${IMAGE_ROOTFS}${sysconfdir}/network/interfaces
    # Use nl80211 driver instead of wext, which is older and not support Wifi AC
    sed -i 's/wpa-driver wext/wpa-driver nl80211/' ${IMAGE_ROOTFS}${sysconfdir}/network/interfaces
}

# Create Outdoor image manually
python create_image_outdoor () {

    # Manually create image for Outdoor

    from oe.image import create_image
    img_name = d.getVar('IMAGE_NAME', True)
    new_name = img_name + '-outdoor'
    d.setVar('IMAGE_NAME', new_name)
    bb.note("Outdoor img name is %s " % new_name)

    create_image(d)


    # Create symbolic link for Outdoor image
    # Remember to avoid IMAGE_LINK_NAME or ${IMAGE_BASENAME}-${MACHINE}
    #    otherwise bitbake will assume it is an old link and delete it

    os.chdir(d.getVar('DEPLOY_DIR_IMAGE', True))
    link_name = d.getVar('IMAGE_BASENAME', True) + "-outdoor-" + d.getVar('MACHINE', True) + ".rootfs.tar.bz2"
    target_name = new_name + ".rootfs.tar.bz2"
    if os.path.exists(link_name) and os.path.islink(link_name):
        os.remove(link_name)             # Remove old link if exist

    os.symlink(target_name, link_name)
    bb.note("Creating symlink for Outdoor img: %s -> %s" % (link_name, target_name))
}

# Set up network (IP for LAN and DHCP for WLAN) for Basephone
setup_basephone () {

    # Back up first
    cp ${IMAGE_ROOTFS}${sysconfdir}/network/interfaces ${IMAGE_ROOTFS}/../interfaces.bk

    # Set static IP for Basephone: 192.168.10.100
    sed -i 's/iface eth0 inet dhcp/iface eth0 inet static\
    address 192.168.10.100\
    hwaddress ether 00:01:02:03:04:46\
    netmask 255.255.255.0/' ${IMAGE_ROOTFS}${sysconfdir}/network/interfaces
    # Use nl80211 driver instead of wext, which is older and not support Wifi AC
    sed -i 's/wpa-driver wext/wpa-driver nl80211/' ${IMAGE_ROOTFS}${sysconfdir}/network/interfaces

    # Enable WLAN0
    #echo 'auto wlan0' >> ${IMAGE_ROOTFS}${sysconfdir}/network/interfaces
}

# Create image for Basephone (only change name, image will be created later)
python change_name_basephone () {

    # Simply change the name
    # The image will be created later by normal procedure

    img_name = d.getVar('IMAGE_NAME', True)
    new_name = img_name.replace ('-outdoor', '', 1) + '-basephone'
    d.setVar('IMAGE_NAME', new_name)
    bb.note("Basephone img name is %s " % new_name)


    # Also create symbolic link for Basephone image

    os.chdir(d.getVar('DEPLOY_DIR_IMAGE', True))
    link_name =  d.getVar('IMAGE_BASENAME', True) + "-basephone-" + d.getVar('MACHINE', True) + ".rootfs.tar.bz2"
    target_name = new_name + ".rootfs.tar.bz2"
    if os.path.exists(link_name) and os.path.islink(link_name):
        os.remove(link_name)             # Remove old link if exist

    os.symlink(target_name, link_name)
    bb.note("Creating symlink for Outdoor img: %s -> %s" % (link_name, target_name))
}

ROOTFS_POSTPROCESS_COMMAND_append = "setup_outdoor; create_image_outdoor; setup_basephone; change_name_basephone; "


### REMOVE modification of Doorphone after build and restore default###
remove_basephone_setup () {
ls ${IMAGE_ROOTFS}/../
    if [ -e ${IMAGE_ROOTFS}/../interfaces.bk ]
    then
        mv ${IMAGE_ROOTFS}/../interfaces.bk ${IMAGE_ROOTFS}${sysconfdir}/network/interfaces
    fi
}
IMAGE_POSTPROCESS_COMMAND_append = "remove_basephone_setup; "
