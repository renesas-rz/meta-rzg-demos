require qt5.6.1_git.inc
#Revision to update qt5.6.1
SRCREV = "5d4014a135e76e2ae8c7d8a7bc2a9f0495b04e57"

#Remove patch file in meta-qt5
SRC_URI_remove = "file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch"

