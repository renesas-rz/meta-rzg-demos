FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "${@'file://0001-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch' if 'Buster' in '${MACHINE_FEATURES}' else ' '}"

