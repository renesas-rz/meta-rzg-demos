FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}"

PATCHTOOL_rzg1 = "git"

SRC_URI_append += " \
    file://0001-add-wifi-bcmdhd.patch \
    file://0003-Build-driver-support-USBWifi-band-5GHz.patch \
    file://0042-Add-uio_prr-module-for-skrzg1m-into-kernel.patch \
"

do_configure_append() {
    # Enable usb cam
    kernel_configure_variable MEDIA_USB_SUPPORT=y
    kernel_configure_variable USB_VIDEO_CLASS=m
    kernel_configure_variable USB_VIDEO_CLASS_INPUT_EVDEV=y
    kernel_configure_variable USB_GSPCA=m
    kernel_configure_variable VIDEO_RENESAS_VSP1 n
    kernel_configure_variable PROFILING=y
    kernel_configure_variable OPROFILE=m

    kernel_configure_variable HID_MULTITOUCH y
    kernel_configure_variable INPUT_TOUCHSCREEN y

    # Enable bootloader args
    kernel_configure_variable ARM_APPENDED_DTB y
    kernel_configure_variable ARM_ATAG_DTB_COMPAT y
    kernel_configure_variable ARM_ATAG_DTB_COMPAT_CMDLINE_FROM_BOOTLOADER y

    # wlan crypto
    kernel_configure_variable CRYPTO_PCRYPT m
    kernel_configure_variable CRYPTO_AEAD m
    kernel_configure_variable CRYPTO_AEAD2 m
    kernel_configure_variable CRYPTO_CTR m

    # Enable EXT4
    kernel_configure_variable EXT4_FS y

    # Enable debugfs
    kernel_configure_variable DEBUG_FS y

    kernel_configure_variable SERIAL_SH_SCI_DMA=y
    yes '' | oe_runmake oldconfig
}

do_configure_append() {
    kernel_configure_variable MAC80211 y   
    kernel_configure_variable CFG80211=y
    kernel_configure_variable CFG80211_DEFAULT_PS=y
    kernel_configure_variable WLAN y
    kernel_configure_variable WEXT_CORE y
    kernel_configure_variable WEXT_PROC y
    kernel_configure_variable CFG80211_WEXT y
    kernel_configure_variable MAC80211_HAS_RC y
    kernel_configure_variable MAC80211_RC_MINSTREL y
    kernel_configure_variable MAC80211_RC_MINSTREL_HT y
    kernel_configure_variable MAC80211_RC_DEFAULT_MINSTREL y
    kernel_configure_variable MAC80211_RC_DEFAULT "minstrel_ht"


# Enable iw
    kernel_configure_variable HOSTAP y
    kernel_configure_variable HOSTAP_FIRMWARE=y
    kernel_configure_variable HOSTAP_FIRMWARE_NVRAM=y
    kernel_configure_variable SERIAL_SH_SCI_DMA=y

# Enable some USB Wifi
    kernel_configure_variable RT2X00=y
    kernel_configure_variable RT2X00_LIB=y
    kernel_configure_variable RT2X00_LIB_USB=y
    kernel_configure_variable RTL8187=y
    kernel_configure_variable B43=y
    kernel_configure_variable B43_SDIO=y
    kernel_configure_variable T2500USB=y
    kernel_configure_variable RT73USB=y
    kernel_configure_variable RT2800USB=y
    kernel_configure_variable RT2800USB_RT53XX=y
    kernel_configure_variable RT2800USB_RT55XX=y
    kernel_configure_variable RT2800USB_UNKNOWN=y
    kernel_configure_variable RTLWIFI=y
    kernel_configure_variable RTL8192CE=y
    kernel_configure_variable RTL8188EE=y
    kernel_configure_variable RTL8192CU=y
    kernel_configure_variable RTL8812AU_8821AU=y

    yes '' | oe_runmake oldconfig
}

do_configure_append_iwg21m() {
    kernel_configure_variable CMA_SIZE_MBYTES "256"
    yes '' | oe_runmake oldconfig
}

do_configure_append_iwg23s() {
    kernel_configure_variable CMA_SIZE_MBYTES 178
    yes '' | oe_runmake oldconfig
}


