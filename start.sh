#!/bin/bash

echo 127.0.0.1 `hostname` >> /etc/hosts

# Put here the local IP of the host device (robot)
export HOST_IP=192.168.61.209 # localhost # 7c85ba5

export ROS_HOSTNAME=${HOST_IP} 
echo export ROS_HOSTNAME=${HOST_IP} >> ~/.bashrc

# Default ROS master port is 11311. Use 80 to access over the internet
export ROS_MASTER_URI=http://${HOST_IP}:80
echo export ROS_MASTER_URI=http://${HOST_IP}:80 >> ~/.bashrc

# Source ROS configuration
echo "Sourcing ROS Melodic configuration..."
source /opt/ros/melodic/setup.bash

# Create workspace
cd /ros/catkin_ws/src
catkin_init_workspace

cd /ros/catkin_ws
# This line install the raspicam_node dependencies
rosdep install --from-paths src --ignore-src --rosdistro=melodic -y
# Build workspace
catkin_make
echo "Sourcing workspace configuration..."
source /ros/catkin_ws/devel/setup.bash
echo source /ros/catkin_ws/devel/setup.bash >> ~/.bashrc

# Start up the ROS server
#echo "Starting roscore..."
#roscore -p 80 &
#sleep 3

#sleep infinity

# Sample roslaunch
echo "Sample roslaunch basic.launch"
echo -e 'ROS_HOSTNAME= ' $ROS_HOSTNAME
echo -e 'ROS_MASTER_URI= ' $ROS_MASTER_URI
roslaunch ros_basics basic.launch