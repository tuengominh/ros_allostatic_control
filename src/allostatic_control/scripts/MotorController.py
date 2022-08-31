#!/usr/bin/env python3
import sys, random
import rospy
from allostatic_control.msg import Action
from geometry_msgs.msg import Twist

x = 0
th = 0

class MotorController:
    def __init__(self):
        # Subscribe to ROS topics
        self.sub = rospy.Subscriber("/allostasis/action/", Action, self.callback, queue_size=1)
        # ROS topics to publish to
        self.pub = rospy.Publisher("/roseco/roseco_mobile_base_controller/cmd_vel", Twist, queue_size=1)
        
        self.speed = 2.5
        self.turn = 3.5
        self.target_speed = 0
        self.target_turn = 0
        self.max_speed = 5.0
        self.max_turn = 5.0
        self.push = 0
        self.push2 = 0
        self.prev_twist = Twist()

    def callback(self, rosdata):
        global x, th

        x = rosdata.x
        th = rosdata.th
        self.target_speed = self.speed * x
        self.target_turn = self.turn * th

        if self.target_speed > self.max_speed:
            self.target_speed = self.max_speed
        elif self.target_speed < -self.max_speed:
            self.target_speed = -self.max_speed
        
        if self.target_turn > self.max_turn:
            self.target_turn = self.max_turn
        elif self.target_turn < -self.max_turn:
            self.target_turn = -self.max_turn
        
        twist = Twist()
        twist.linear.x = self.target_speed
        twist.linear.y = 0
        twist.linear.z = 0
        twist.angular.x = 0 
        twist.angular.y = 0 
        twist.angular.z = self.target_turn

        if twist != self.prev_twist or self.push2 > 5:
            # Publish to ROS topic
            self.pub.publish(twist)
            self.push += 1
            self.prev_twist = twist
            self.push2 = 0
        else:
            self.push2 += 1

def main(args):
    # Initialize ROS node and receiver module
    rospy.init_node("motor_controller", anonymous=True)
    motor_class = MotorController()
   
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS motor module")
    finally:
        twist = Twist()
        twist.linear.x = 0
        twist.linear.y = 0
        twist.linear.z = 0
        twist.angular.x = 0
        twist.angular.y = 0
        twist.angular.z = 0
        motor_class.pub.publish(twist)

if __name__ == '__main__':
    main(sys.argv)
