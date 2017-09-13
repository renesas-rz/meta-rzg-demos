#!/bin/sh

cp /home/root/videos/vga*.h264 /tmp/

CAM_DEV=$(cat /home/root/doorphone/CAM_DEV)

if [ -z $CAM_DEV ]; then
	CAM_DEV="/dev/video0"
fi
echo "streaming from Camera: "${CAM_DEV}

VIDEOLOCATION=/tmp
SCRIPTLOCATION=/home/root/doorphone/    # Only effect in this file, remember to change other files as well

# Send video stream to Base phone and Out door
gst-launch-1.0 -e v4l2src device=${CAM_DEV} ! video/x-raw,format=UYVY,width=720,height=480 ! \
vspmfilter outbuf-alloc=true ! video/x-raw,format=NV12,width=640,height=480 ! omxh264enc \
target-bitrate=10485760 num-p-frames=0 ! h264parse ! video/x-h264,stream-format=avc,alignment=au ! \
rtph264pay pt=96 config-interval=3 mtu=9000 ! udpsink host=127.255.255.255 port=1234 &

while true; do  gst-launch-1.0 filesrc location=$VIDEOLOCATION/vga1.h264 ! video/x-h264,framerate=30/1 ! \
queue ! h264parse ! video/x-h264,stream-format=avc,alignment=au ! rtph264pay config-interval=3 pt=96 mtu=9000 ! udpsink host=127.255.255.255 port=1235 &> /dev/null; \
done &
while true; do  gst-launch-1.0 filesrc location=$VIDEOLOCATION/vga2.h264 ! video/x-h264,framerate=30/1 ! \
queue ! h264parse ! video/x-h264,stream-format=avc,alignment=au ! rtph264pay config-interval=3 pt=96 mtu=9000 ! udpsink host=127.255.255.255 port=1236 &> /dev/null; \
done &
while true; do  gst-launch-1.0 filesrc location=$VIDEOLOCATION/vga3.h264 ! video/x-h264,framerate=30/1 ! \
queue ! h264parse ! video/x-h264,stream-format=avc,alignment=au ! rtph264pay config-interval=3 pt=96 mtu=9000 ! udpsink host=127.255.255.255 port=1237 &> /dev/null; \
done &

# Detect and re-streaming if CAM_DEV is changed
FILE="/home/root/doorphone/CAM_DEV"
# Set initial time of file
LTIME=`stat -c %Z ${FILE}`
while true
do
   ATIME=`stat -c %Z ${FILE}`

   if [[ "$ATIME" != "$LTIME" ]]
   then
       echo "RUN COMMNAD"
       LTIME=$ATIME
       CAM_DEV=$(cat /home/root/doorphone/CAM_DEV)
       echo "streaming from Camera: "${CAM_DEV}

       GPID=$(ps | grep "gst-launch-1.0 -e v4l2src device=" | grep -v grep | awk '{print  $1}')
       kill ${GPID} &> /dev/null
       gst-launch-1.0 -e v4l2src device=${CAM_DEV} ! video/x-raw,format=UYVY,width=720,height=480 ! tee name=t t. ! vspmfilter outbuf-alloc=true ! video/x-raw,format=NV12,width=640,height=480 ! omxh264enc target-bitrate=10485760 num-p-frames=0 ! h264parse ! video/x-h264,stream-format=avc,alignment=au ! rtph264pay pt=96 config-interval=3 mtu=9000 ! udpsink host=192.168.10.255 port=1234 t. ! vspmfilter outbuf-alloc=true ! video/x-raw,format=NV12,width=640,height=480 ! omxh264enc target-bitrate=10485760 num-p-frames=0 ! h264parse ! video/x-h264,stream-format=avc,alignment=au ! rtph264pay pt=96 config-interval=3 ! udpsink host=192.168.10.101 port=5555 &> /dev/null &
   fi
   sleep 5
done &
