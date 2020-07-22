# SOURCE https://www.ics.com/blog/raspberry-pi-camera-module
# Get the source code for the V4L utilities
    git clone git://git.linuxtv.org/v4l-utils.git
    cd v4l-utils

## Install some packages needed to build it
    sudo apt-get install autoconf gettext libtool libjpeg62-dev

## Configure and build it.
    autoreconf -vfi
    ./configure
    make
    sudo make install


# SOME EXAMPLE COMMANDS
## Load the module
    sudo modprobe bcm2835-v4l2

## Control the viewfinder
    v4l2-ctl --overlay=1 # enable viewfinder
    v4l2-ctl --overlay=0 # disable viewfinder

# Record a video
    v4l2-ctl --set-fmt-video=width=1920,height=1088,pixelformat=4
    v4l2-ctl --stream-mmap=3 --stream-count=100 --stream-to=somefile.264

## Capture a JPEG image
    v4l2-ctl --set-fmt-video=width=2592,height=1944,pixelformat=3
    v4l2-ctl --stream-mmap=3 --stream-count=1 --stream-to=somefile.jpg

## Set the video bitrate
    v4l2-ctl --set-ctrl video_bitrate=10000000

## List the supported formats
    v4l2-ctl --list-formats

# A MORE ADVANCED EXAMPLE
## https://didier.io/post/raspberrypi-camera
