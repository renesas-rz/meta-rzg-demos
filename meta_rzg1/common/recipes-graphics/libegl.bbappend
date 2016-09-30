PROVIDES = "${@base_contains("DISTRO_FEATURES", "wayland", " virtual/egl virtual/egl-native", "", d)}"
