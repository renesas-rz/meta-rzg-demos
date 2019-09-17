meta-rzg-demos

INTRODUCTION
------------

This package supports building Yocto-based images for Renesas RZ/G1 eveluation boards
with HMI or Qt-HMI demos, basing on following components:

    GCC 7.2

    Linux kernel 4.4 - CIP


DEPENDENCIES
------------

This package is for Yocto 2.4.2 framework and depends on following layers:

    URI: git://git.yoctoproject.org/poky

    revision: 342fbd6a3e57021c8e28b124b3adb241936f3d9d

    URI: git://git.openembedded.org/meta-openembedded

    revision: dacfa2b1920e285531bec55cd2f08743390aaf57

    URI: git://git.linaro.org/openembedded/meta-linaro.git

    revision: 75dfb67bbb14a70cd47afda9726e2e1c76731885

    URI: https://github.com/meta-qt5/meta-qt5.git

    revision: c1b0c9f546289b1592d7a895640de103723a0305


In addition, this package has to be built with corresponding meta-renesas package.
