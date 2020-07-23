
# Enable the Pi camera
https://www.balena.io/docs/learn/develop/hardware/i2c-and-spi/#raspberry-pi-camera-module

Setup these Balena variables in the **fleet configuration** of the app (BalenaOS 1.16.0 and newer):
```
RESIN_HOST_CONFIG_gpu_mem to 128
RESIN_HOST_CONFIG_start_x to 1
```
Or directly within the Docker container in `/mnt/boot/config.txt`:
```
gpu_mem=128
start_x=1
```
Then reboot the device.

**NOTE:** *This folder `/mnt/boot/` is binded to `/boot` folder of the Balena host OS.*


## Test the camera
Using the basic utility that comes with the OS:
>`$ raspistill -o image_test.jpg`

After several second you should find the file in the folder from where you run the command.

## Test the camera with ROS

>`$ roslaunch raspicam_node camerav2_1280x720.launch`

In your laptop launch the rqt tool:
>`$ $ rqt_image_view`

In the upper-left drop-down list, select the topic of the image that you want to visualize. It needs to be in compressed format as it is published by raspicam_node. The following screenshot shows the result: