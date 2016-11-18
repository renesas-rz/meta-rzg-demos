# Solve issue build qtbase-native due to no exist "-no-nis" setting anymore.

PACKAGECONFIG_CONFARGS = " \
    -prefix ${prefix} \
    -sysroot ${STAGING_DIR_NATIVE} \
    -no-gcc-sysroot \
    -system-zlib \
    -no-libjpeg \
    -no-libpng \
    -no-gif \
    -no-accessibility \
    -no-cups \
    -no-gui \
    -no-qml-debug \
    -no-sql-mysql \
    -no-sql-sqlite \
    -no-opengl \
    -no-openssl \
    -no-xcb \
    -no-icu \
    -verbose \
    -release \
    -prefix ${OE_QMAKE_PATH_PREFIX} \
    -bindir ${OE_QMAKE_PATH_BINS} \
    -libdir ${OE_QMAKE_PATH_LIBS} \
    -headerdir ${OE_QMAKE_PATH_HEADERS} \
    -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
    -datadir ${OE_QMAKE_PATH_DATA} \
    -docdir ${OE_QMAKE_PATH_DOCS} \
    -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
    -no-glib \
    -no-iconv \
    -silent \
    -nomake examples \
    -nomake tests \
    -no-rpath \
    -platform linux-oe-g++ \
"
