export XDG_RUNTIME_DIR=/run/user/root
export LD_PRELOAD=/usr/lib/libEGL.so
amixer set 'DVC Out' 100%
amixer set 'PCM' 100%
/home/root/qtpreload/qtpreload &
echo 2 > /proc/sys/kernel/printk
