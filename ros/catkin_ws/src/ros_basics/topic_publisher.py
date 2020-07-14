#!/usr/bin/env python

# BEGIN IMPORT
import rospy
# END IMPORT

# BEGIN STD_MSGS
from std_msgs.msg import Int32
# END STD_MSGS

rospy.init_node('topic_publisher')

# BEGIN PUB
pub = rospy.Publisher('counter', Int32, queue_size=10)
# END PUB

# BEGIN LOOP
rate = rospy.Rate(0.277777778)  # = 1/(3600/1000) => gives 1000 ticks/hour 
                        # If set to 1 Hz it will be a counter of seconds

count = 0
while not rospy.is_shutdown():
    pub.publish(count)
    count += 1
    rate.sleep()
# END LOOP
# END ALL
