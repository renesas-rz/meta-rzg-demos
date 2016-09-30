PROVIDES += "virtual/libgles2-native"

do_install_append() {
    ln -s libGLESv2.so ${D}/usr/lib/libGLESv2.so.2
}
