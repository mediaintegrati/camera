#!/bin/bash
today=`date '+%Y_%m_%d__%H_%M_%S'`;
registra () {
	python /home/pi/Desktop/camera/usbreset1/reset.py /dev/video0 &&
	ffmpeg -thread_queue_size 2048 -f v4l2 -i /dev/video0 -f alsa -i plughw:CARD=/dev/snd/by-id/usb-C-Media_Electronics_Inc._USB_PnP_Sound_Device-00,DEV=0 -t 00:00:15 /home/pi/Desktop/camera/video/$today.mp4 || registra
	}

registra
