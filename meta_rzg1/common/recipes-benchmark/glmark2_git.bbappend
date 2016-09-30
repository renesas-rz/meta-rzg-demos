# Change setting for support GLES2 of wayland only
PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gl x11-gles2', '', d)} \
                  ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-gles2', '', d)} \
                  "
