#!/bin/bash

echo 127.0.0.1 `hostname` >> /etc/hosts

# Put here the local IP of the host device (robot)
export LANIFACE=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
export HOST_IP=$(ifconfig ${LANIFACE} | awk '/inet / {print $2}')

export ROS_HOSTNAME=${HOST_IP} 
echo export ROS_HOSTNAME=${HOST_IP} >> ~/.bashrc

# Default ROS master port is 11311
#  - You could use 80 if accessing over the internet: roscore -p 80
export ROS_MASTER_URI=http://${HOST_IP}:11311
echo export ROS_MASTER_URI=http://${HOST_IP}:11311 >> ~/.bashrc

# Source ROS configuration
echo "Sourcing ROS noetic configuration..."
source /opt/ros/noetic/setup.bash

# Create workspace
cd /ros/catkin_ws/src
catkin_init_workspace

# Clone the code # ONCE IT'S REMOVED THE LOCAL COPY IN THIS REPO
#git clone https://github.com/ros-gopigo3/gopigo3-pi-code

cd /ros/catkin_ws
# This line install the raspicam_node dependencies
rosdep install --from-paths src --ignore-src --rosdistro=noetic -y
# Build workspace
catkin_make

# RASPICAM ERROR

# /usr/bin/ld: /usr/lib/gcc/aarch64-linux-gnu/9/../../../aarch64-linux-# gnu/Scrt1.o: in function `_start':
# (.text+0x18): undefined reference to `main'
# /usr/bin/ld: (.text+0x1c): undefined reference to `main'
# collect2: error: ld returned 1 exit status
# make[2]: *** [gopigo3-pi-code/pkg_raspicam_node/CMakeFiles/raspicam_node.dir/build.make:186: /home/pi/catkin_ws/devel/lib/raspicam_node/raspicam_node] Error 1
# make[1]: *** [CMakeFiles/Makefile2:1756: gopigo3-pi-code/pkg_raspicam_node/CMakeFiles/raspicam_node.dir/all] Error 2
# make: *** [Makefile:141: all] Error 2

echo "Sourcing workspace configuration..."
source /ros/catkin_ws/devel/setup.bash
echo source /ros/catkin_ws/devel/setup.bash >> ~/.bashrc

# Log to console
echo 'My local IP address is '${HOST_IP}
echo -e 'ROS_HOSTNAME= ' $ROS_HOSTNAME
echo -e 'ROS_MASTER_URI= ' $ROS_MASTER_URI

# Enable drive for Pi camera
modprobe bcm2835-v4l2

## UNCOMMENT TO LAUNCH ROS & BE THE DOCKER PROCESS
# Sample roslaunch
# echo "Sample roslaunch basic.launch"
#roslaunch ros_basics basic.launch

# Exit to terminal
bash


