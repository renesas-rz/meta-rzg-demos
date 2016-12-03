FILESEXTRAPATHS_prepend := "${THISDIR}/weston-init:"

# Workaround for Qt HMI on LTS 4.4 for SKRZG1M
# In this environment, VSP mode performance is lower
#     than GPU mode. Thus temporary change to GPU mode
#     for better performance.
# Not apply this for SKRZG1E because GPU performance
#     still lower than VSP in SKRZG1E
FILESEXTRAPATHS_prepend_skrzg1m := "${THISDIR}/weston-init/gpu_mode:"
