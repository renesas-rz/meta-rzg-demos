export XDG_RUNTIME_DIR=/run/user/root
export LD_PRELOAD=/usr/lib/libEGL.so
/home/root/qtpreload/qtpreload &>/dev/null &
echo 2 > /proc/sys/kernel/printk
