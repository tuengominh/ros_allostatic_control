#!/usr/bin/env python3
import sys, time, random
import rospy
from allostatic_control.msg import Drive
from allostatic_control.msg import Blob
from allostatic_control.msg import Action

## Modify the path to the behavior folder in ypur machine
sys.path.insert(1, "/home/usuario/ros_allostatic_control/src/allostatic_control/scripts/behaviors")
from CatchTarget import *
from RandomExplore import *
from AvoidObstacle import *
from SandDiving import *

blob_catching = True
hunger_drive = 0.0
thirst_drive = 0.0
temp_drive = 0.0

Target = False
Target_x = 0
Target_color = ""
R_obstacle = 0
L_obstacle = 0
R_obstacle_dist = 0
L_obstacle_dist = 0

adsign = 0.0
hsign = 0.0
x = 0.0
th = 0.0

class ActionSelector:
    def __init__(self):
        # Subscribe to ROS topics
        self.sub = rospy.Subscriber("/allostasis/drive/", Drive, self.driveCallback, queue_size=1)
        self.sub1 = rospy.Subscriber("/allostasis/perception/", Blob, self.blobCallback, queue_size=1)

        # ROS topics to publish to
        self.pub = rospy.Publisher("/allostasis/action/", Action, queue_size=1)

    # Receive information about internal drives of all homeostatic systems
    def driveCallback(self, rosdata):
        global hunger_drive, thirst_drive, temp_drive, adsign, hsign
        hunger_drive = rosdata.hunger_drive
        thirst_drive = rosdata.thirst_drive
        temp_drive = rosdata.temp_drive
        adsign = rosdata.adsign
        hsign = rosdata.hsign

    # Receive information about target and obstacles
    def blobCallback(self, rosdata):
        global Target, Target_x, Target_color, R_obstacle, L_obstacle, R_obstacle_dist, L_obstacle_dist, blob_catching, x, th, adsign, hsign, hunger_drive, thirst_drive, temp_drive
        
        Target = rosdata.Target
        Target_x = rosdata.Target_x
        Target_color = rosdata.Target_color
        R_obstacle = rosdata.R_obstacle
        L_obstacle = rosdata.L_obstacle
        R_obstacle_dist = rosdata.R_obstacle_dist
        L_obstacle_dist = rosdata.L_obstacle_dist

        # Avoiding obstacles as the most important goal
        if R_obstacle == True or L_obstacle == True:
            avoider = AvoidObstacle()
            x, th = avoider.avoid(R_obstacle_dist, L_obstacle_dist, R_obstacle, L_obstacle)

        # Compare drives of all homeostatic systems and call relevant behavior
        elif Target == True and blob_catching == True:
            if Target_color == "green" and hunger_drive > 0.0 and hunger_drive >= thirst_drive and hunger_drive >= temp_drive:
                catcher = CatchTarget(Target_x)
                x, th = catcher.catch(hunger_drive)

            elif Target_color == "blue" and thirst_drive > 0.0 and thirst_drive >= hunger_drive and thirst_drive >= temp_drive:
                catcher = CatchTarget(Target_x)
                x, th = catcher.catch(thirst_drive)

            # Only react if the temp. drive is too high
            elif temp_drive > 0.2 and temp_drive >= hunger_drive and temp_drive >= thirst_drive:
                driver = SandDiving()
                x, th = driver.dive(temp_drive, adsign, hsign)

            else:
                explorer = RandomExplore()
                x, th = explorer.explore()
        
        # Random exploration as the least important goal
        else:
            explorer = RandomExplore()
            x, th = explorer.explore()
        
        self.publishMsg(x, th)
        
    def publishMsg(self, x_msg, th_msg): 
        self.msg = Action()
        self.msg.x = x_msg
        self.msg.th = th_msg
        # Publish to ROS topic
        self.pub.publish(self.msg)

def main(args):
    # Initialize ROS node and receiver module
    rospy.init_node("action_selector", anonymous=True)
    action_class = ActionSelector()
   
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS action module")

if __name__ == '__main__':
    main(sys.argv)
