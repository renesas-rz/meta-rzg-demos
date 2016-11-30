#!/bin/sh

CAM_DEV=$(cat /home/root/doorphone/CAM_DEV)

if [ -z $CAM_DEV ]; then
	CAM_DEV="/dev/video0"
fi
echo "streaming from Camera: "${CAM_DEV}

VIDEOLOCATION=/home/root/videos
SCRIPTLOCATION=/home/root/doorphone/    # Only effect in this file, remember to change other files as well

gst-launch-1.0 alsasrc do-timestamp=true ! alawenc ! rtppcmapay ! udpsink host=192.168.10.100 port=2000 sync=false &> /dev/null &
gst-launch-1.0 -v udpsrc port=2001 caps="application/x-rtp, media=(string)audio" typefind=1 ! rtppcmadepay ! queue ! alawdec ! alsasink &> /dev/null &

# Send video stream to Base phone and Out door
gst-launch-1.0 -e v4l2src device=${CAM_DEV} ! video/x-raw,format=UYVY,width=720,height=480 ! tee name=t t. ! vspmfilter outbuf-alloc=true ! video/x-raw,format=NV12,width=640,height=480 ! omxh264enc target-bitrate=10485760 num-p-frames=0 ! h264parse ! video/x-h264,stream-format=avc,alignment=au ! rtph264pay pt=96 config-interval=3 mtu=9000 ! udpsink host=192.168.10.255 port=1234 t. ! vspmfilter outbuf-alloc=true ! video/x-raw,format=NV12,width=736,height=480 ! omxh264enc target-bitrate=10485760 num-p-frames=0 ! h264parse ! video/x-h264,stream-format=avc,alignment=au ! rtph264pay pt=96 config-interval=3 ! udpsink host=192.168.10.101 port=5555 &> /dev/null &

# Send 3 video stream to Base phone
while true; do  gst-launch-1.0 filesrc location=$VIDEOLOCATION/vga1.h264 ! video/x-h264,framerate=30/1 ! h264parse ! rtph264pay config-interval=3 pt=96 mtu=9000 ! udpsink host=192.168.10.255 port=1235 &> /dev/null; done &
while true; do  gst-launch-1.0 filesrc location=$VIDEOLOCATION/vga2.h264 ! video/x-h264,framerate=30/1 ! h264parse ! rtph264pay config-interval=3 pt=96 mtu=9000 ! udpsink host=192.168.10.255 port=1236 &> /dev/null; done &
while true; do  gst-launch-1.0 filesrc location=$VIDEOLOCATION/vga3.h264 ! video/x-h264,framerate=30/1 ! h264parse ! rtph264pay config-interval=3 pt=96 mtu=9000 ! udpsink host=192.168.10.255 port=1237 &> /dev/null; done &

# Remove old image
rm $SCRIPTLOCATION/image* &> /dev/null

# Face detect and capture image
$SCRIPTLOCATION/guess-mess udpsrc port=5555 caps="application/x-rtp" ! rtph264depay ! \
  h264parse ! tee tee0. ! omxh264dec no-copy=true ! queue ! videorate ! \
  video/x-raw,framerate=1/1 ! jpegenc ! multifilesink post-messages=true \
  location=$SCRIPTLOCATION/image_capture.jpeg max-files=1 tee0. ! omxh264dec ! videorate ! \
  video/x-raw,framerate=1/1 ! vspmfilter ! \
  video/x-raw,format=RGB,width=256,height=200 ! facedetect updates=2 \
  profile=/usr/share/OpenCV/haarcascades/haarcascade_frontalface_default.xml \
  min-size-width=50 min-size-height=80 ! waylandsink qos=false &

# GPIO button
$SCRIPTLOCATION/GPIO_button &

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
       gst-launch-1.0 -e v4l2src device=${CAM_DEV} ! video/x-raw,format=UYVY,width=720,height=480 ! tee name=t t. ! vspmfilter outbuf-alloc=true ! video/x-raw,format=NV12,width=640,height=480 ! omxh264enc target-bitrate=10485760 num-p-frames=0 ! h264parse ! video/x-h264,stream-format=avc,alignment=au ! rtph264pay pt=96 config-interval=3 mtu=9000 ! udpsink host=192.168.10.255 port=1234 t. ! vspmfilter outbuf-alloc=true ! video/x-raw,format=NV12,width=736,height=480 ! omxh264enc target-bitrate=10485760 num-p-frames=0 ! h264parse ! video/x-h264,stream-format=avc,alignment=au ! rtph264pay pt=96 config-interval=3 ! udpsink host=192.168.10.101 port=5555 &> /dev/null &
   fi
   sleep 5
done &
