FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://0001-example-test-multicast2-revise-pipeline-to-read-from.patch \
"
