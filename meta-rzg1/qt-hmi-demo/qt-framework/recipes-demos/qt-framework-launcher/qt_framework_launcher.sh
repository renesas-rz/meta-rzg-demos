export XDG_RUNTIME_DIR=/run/user/root
export LD_PRELOAD=/usr/lib/libEGL.so
export LD_LIBRARY_PATH="/usr/lib/gstreamer-1.0:/lib:/usr/lib:/usr/local/lib"
modprobe -a mmngr mmngrbuf s3ctl uvcs_cmn vspm fdpm
amixer set 'PCM' 70%
amixer set 'Headphone' 100%

/usr/share/qt-framework-launcher-1.0/launcher &
echo 2 > /proc/sys/kernel/printk
