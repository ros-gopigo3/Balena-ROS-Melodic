# ROS Melodic in Single Board Computers
Forked from https://github.com/balena-io-playground/ros-kinetic-example

The original repository has been updated to ROS Melodic, and it is intendedt to run under BalenaOS.

The Docker launch script is `start.sh`, that starts a bash terminal after all ROS configuration and catkin build has finished. This lets you the container ready so that you can play with installed ROS packages or add more at your discretion.

## [What is balenaOS?](https://www.balena.io/os/docs/)
It's a Linux distribution for SBCs like Raspberry Pi, that has been designed to include the minimal set of required components to reliably support operation of the Docker engine in embedded scenarios. It uses the **Yocto** framework as a foundation, `systemd` as the *init system*.

# Sample ROS development environment
## Using Balena Cloud
### 1. Add the Balena remote of your app:
>`$ git remote add balena  g_bernardo_ronquillo@git.balena-cloud.com:g_bernardo_ronquillo/ros-melodic_bionic.git`
### 2. Then push the Docker container to the Balena device:
>`$ git push balena master`

## Using BalenaOS locally
>`$ git push balena <YOUR_DEVICE_NAME>.local`

# GoPiGo3 workspace (gopigo3 branch)
This branch adds to the Raspberry Pi the code used in the book "Hands on ROS for Robotics Programming" published by Packt Pub https://www.packtpub.com/iot-hardware/hands-on-ros-for-robotics-programming

- First checkout the branch:
>`$ git checkout gopigo3`

## Using Balena Cloud
To push the Docker container to the Balena device you have to specify the source branch:
>`$ git push balena gopigo3:master`

**NOTE:** *If you are switching the source repository for your Balena app, you have to force the push to avoid rejection:*
>`$ git push balena gopigo3:master -f`

## Using BalenaOS locally
In this case you don't need to specify any branch, just the target device from the folder of the local repository (it will take the branch you have checked out):
>`$ git push balena <YOUR_DEVICE_NAME>.local`

# Testing ROS environment with `roscore`
- Current version does not automatically launch ROS environment, it lands off to bash for easier development. So log into the container and play with the ROS code from inside:
>`$ balena ssh DEVICE_NAME.local main`

- From within the container launch `roscore` (default port 11311):
>`$ roscore`
- Or if master is at port 80:
>`$ roscore -p 80`

# Testing ROS and networking between Balena devices
- First device:
>`$ ros_basics basic.launch`

- Second device (you have to specify ROS_MASTER_URI to point to the first device):
There is another launch publishing in the same topic `counter` to test ROS networking between devices running under BalenaOS:
>`$ roslaunch ros_basics basic_interactive.launch`