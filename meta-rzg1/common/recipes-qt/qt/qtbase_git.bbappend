FILESEXTRAPATHS_append := "${THISDIR}/qtbase:"

#SRC_URI_append += " \
#	file://0001-Disable-DirectFB-automatic-detection-and-mark-it-dep.patch \
#"

# add necessary packages
PACKAGECONFIG_append += " sm"

# nis option is not supported anymore, disable it here
PACKAGECONFIG[nis] = ""
