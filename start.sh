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
echo "Sourcing ROS Melodic configuration..."
source /opt/ros/melodic/setup.bash

# Create workspace
cd /ros/catkin_ws/src
catkin_init_workspace

# Build workspace
cd /ros/catkin_ws
catkin_make
echo "Sourcing workspace configuration..."
source /ros/catkin_ws/devel/setup.bash
echo source /ros/catkin_ws/devel/setup.bash >> ~/.bashrc

# Start up the ROS server
echo -e 'ROS_HOSTNAME= ' $ROS_HOSTNAME
echo -e 'ROS_MASTER_URI= ' $ROS_MASTER_URI
echo "Starting roscore..."
roscore -p 80 &
sleep 3