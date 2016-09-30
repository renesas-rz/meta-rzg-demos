CONF_ADD_WAYLAND = "${@base_contains('DISTRO_FEATURES', 'wayland', ' -qpa wayland -no-xcb -no-eglfs -wayland', '', d)}"

# Select wayland as the default platform abstraction plugin for Qt

PACKAGECONFIG_CONFARGS_append += " \
            ${CONF_ADD_WAYLAND} \
            "

DEPENDS_append = " gles-user-module"
