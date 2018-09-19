
#EXTRA_IMAGE_FEATURES = "debug-tweaks tools-debug tools-profile"

IMAGE_INSTALL_append = " \
    libegl \
    strace \
    jpeg \
    launcher-taskbar \
    loading-qt-app \
    qtpreload \
    demo-videos \
    configuration \
"
