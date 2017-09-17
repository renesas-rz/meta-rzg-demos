
# Overwrite original do_configure function in meta-qt5, to remove
# "-no-nis" option, which is not supported anymore
do_configure() {
    # we need symlink in path relative to source, because
    # EffectivePaths:Prefix is relative to qmake location
    if [ ! -e ${B}/bin/qmake ]; then
        mkdir -p ${B}/bin
        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
    fi

    ${S}/configure -v \
        -opensource -confirm-license \
        -sysroot ${STAGING_DIR_NATIVE} \
        -no-gcc-sysroot \
        -system-zlib \
        -dbus-runtime \
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
        -verbose \
        -release \
        -prefix ${OE_QMAKE_PATH_PREFIX} \
        -bindir ${OE_QMAKE_PATH_BINS} \
        -libdir ${OE_QMAKE_PATH_LIBS} \
        -datadir ${OE_QMAKE_PATH_DATA} \
        -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
        -docdir ${OE_QMAKE_PATH_DOCS} \
        -headerdir ${OE_QMAKE_PATH_HEADERS} \
        -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
        -libexecdir ${OE_QMAKE_PATH_LIBEXECS} \
        -plugindir ${OE_QMAKE_PATH_PLUGINS} \
        -importdir ${OE_QMAKE_PATH_IMPORTS} \
        -qmldir ${OE_QMAKE_PATH_QML} \
        -translationdir ${OE_QMAKE_PATH_TRANSLATIONS} \
        -testsdir ${OE_QMAKE_PATH_TESTS} \
        -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
        -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
        -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
        -no-glib \
        -no-iconv \
        -silent \
        -nomake examples \
        -nomake tests \
        -nomake libs \
        -no-compile-examples \
        -no-rpath \
        -platform ${OE_QMAKESPEC} \
        -xplatform linux-oe-g++ \
        ${QT_CONFIG_FLAGS}

    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
}
