# ROS Melodic in Single Board Computers
Forked from https://github.com/balena-io-playground/ros-kinetic-example

The original repository has been updated to ROS Melodic, and it is intendedt to run under BalenaOS.

**NOTE:** *Before pushing the image to your robot, make sure to put the current IP of the device in the script `start.sh`. For example:*
>`export HOST_IP=192.168.1.105`

The Docker launch script is `start.sh`, that runs `ros_basics basic.launch`

There is another launch publishing in the same topic `counter` to test ROS networking between devices running under BalenaOS:
>`$ roslaunch ros_basics basic_interactive.launch`

## [What is balenaOS?](https://www.balena.io/os/docs/)
It's a Linux distribution for SBCs like Raspberry Pi, that has been designed to include the minimal set of required components to reliably support operation of the Docker engine in embedded scenarios. It uses the **Yocto** framework as a foundation, `systemd` as the *init system*.

# Current scope of this repository

## `master` branch
>`$ git checkout master` (default)

The goal of this branch is to provide a `roscore` instance hosted in a SBC like Raspberry Pi, so that you always have ROS active in your LAN.
In this way:
- You can launch any robot. and control it from your laptop without needing to worry about configuring `ROS_MASTER_URI` (this means that for every device, you will only need to configure `ROS_MASTER_URI` once, in order to point to the SBC)
- You can safely run a multirobot configuration. Every new robot you launch will join the ROS network in your LAN

## `gopigo3` branch
Check out the branch:
>`$ git checkout gopigo3`

Then deploy to your robot given that it's powered with [BalenaOS](https://www.balena.io/os/docs/raspberrypi4-64/getting-started/):
>`$ balena push <YOUR_DEVICE_NAME>.local`

### GoPiGo3 code repository
https://github.com/ros-gopigo3/gopigo3-pi-code

Packages to be included in the Raspberry Pi of robot to run the examples in the book "Hands on ROS for Robotics Programming" published by Packt Pub https://www.packtpub.com/iot-hardware/hands-on-ros-for-robotics-programming