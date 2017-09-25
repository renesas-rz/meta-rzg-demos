IMAGE_INSTALL_append = ' gstreamer1.0-plugins-good-isomp4 \
                         gstreamer1.0-plugins-bad-faad \
                         alsa-bat \
                         ltp \
			 menu-cache \
			 pulseaudio-init \
'

IMAGE_INSTALL_append = " \
    libsocauth-dev \
"

update_issue() {
    # Set BSP version
    BSP_VERSION="1.0.0"

    # Set SoC and Board info
    case "${MACHINE}" in
    iwg21m)
      BSP_SOC="RZG1H"
      BSP_BOARD="iWave"
      ;;
    iwg22m)
      BSP_SOC="RZG1E"
      BSP_BOARD="iWave"
      ;;
    iwg23s)
      BSP_SOC="RZG1C"
      BSP_BOARD="iWave"
      ;;
    skrzg1e)
      BSP_SOC="RZG1E"
      BSP_BOARD="SK"
      ;;
    skrzg1m)
      BSP_SOC="RZG1M"
      BSP_BOARD="SK"
      ;;
    iwg20m)
      case "${SOC_FAMILY}" in
        *r8a7743*)
          BSP_SOC="RZG1M"
          BSP_BOARD="iWave"
        ;;
        *)
          BSP_SOC="RZG1N"
          BSP_BOARD="iWave"
        ;;
      esac
      ;;
    *)
      ;;
    esac

    # Make issue file
    echo "BSP: ${BSP_SOC}/${BSP_BOARD}/${BSP_VERSION}" > ${IMAGE_ROOTFS}/etc/issue
    echo "LSI: ${BSP_SOC}" >> ${IMAGE_ROOTFS}/etc/issue
    echo "Version: ${BSP_VERSION}" >> ${IMAGE_ROOTFS}/etc/issue
}
ROOTFS_POSTPROCESS_COMMAND += "update_issue; "
