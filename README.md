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