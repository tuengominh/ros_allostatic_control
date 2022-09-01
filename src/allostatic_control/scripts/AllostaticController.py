#!/usr/bin/env python3
import sys, time
import rospy
import csv
import numpy as np
from scipy.signal import butter, lfilter
from allostatic_control.msg import HomeostaticState
from allostatic_control.msg import Blob
from allostatic_control.msg import Drive

## 0-interoceptive; 1-exteroceptive; 2-constant weighted
version = 0
## Modify the path to the folder where you log data in your machine
filename = "/home/usuario/ros_allostatic_control/src/allostatic_control/data/allostatic_data_v" + str(version) + ".csv"

next_t = 1000
time_init = time.time()

## Information from homeostatic systems
energy_aV = 0.0
water_aV = 0.0
temp_aV = 0.0
hunger_urgency = 0.0
thirst_urgency = 0.0
temp_urgency = 0.0

## Information from detected resources
Target = False
Target_x = 0
Target_color = ""
num_food = 0
num_water = 0

## Information to publish to motor systems
hunger_drive = 0.0
thirst_drive = 0.0
temp_drive = 0.0
adsign = 0.0
hsign = 0.0

class AllostaticController:
    def __init__(self):
        global filename
        # Subscribe to ROS topics
        self.sub = rospy.Subscriber("/allostasis/homeostasis/", HomeostaticState, self.stateCallback, queue_size=1)
        self.sub1 = rospy.Subscriber("/allostasis/perception/", Blob, self.blobCallback, queue_size=1)
        # ROS topics to publish to
        self.pub = rospy.Publisher("/allostasis/drive/", Drive, queue_size=1)     

        # Log homeostatic and allostatic data
        with open(filename, "w", encoding="UTF8") as csv_file:
            csv_writer = csv.DictWriter(csv_file, fieldnames=['Time', 'dVTemp', 'aVTemp', 'UTemp', 'kTemp', 'ALTemp', 'DTemp', 'dVEnergy', 'aVEnergy', 'UHunger', 'kHunger', 'ALHunger', 'DHunger', 'dVWater', 'aVWater', 'UThirst', 'kThirst', 'ALThirst', 'DThirst', 'NFood', 'NWater']) 
            csv_writer.writeheader()

    # Update information from detected resources
    def blobCallback(self, rosdata):
        global Target, Target_x, Target_color, num_food, num_water
        Target = rosdata.Target
        Target_x = rosdata.Target_x
        Target_color = rosdata.Target_color
        num_food = rosdata.num_food
        num_water = rosdata.num_water

        print("TARGET:", Target, Target_x, Target_color, num_food, num_water)

    # Update information from homeostatic systems
    def stateCallback(self, rosdata):
        global energy_aV, water_aV, temp_aV, hunger_urgency, thirst_urgency, temp_urgency, adsign, hsign, next_t, time_init
        energy_aV = rosdata.energy_aV
        water_aV = rosdata.water_aV
        temp_aV = rosdata.temp_aV
        hunger_urgency = rosdata.hunger_urgency
        thirst_urgency = rosdata.thirst_urgency
        temp_urgency = rosdata.temp_urgency
        adsign = rosdata.adsign
        hsign = rosdata.hsign
        
        print("ENERGY:", energy_aV, "WATER:", water_aV, "TEMP:", temp_aV)
        self.allostaticMechanism()

    def allostaticMechanism(self):
        global hunger_drive, thirst_drive, temp_drive, energy_aV, water_aV, temp_aV, hunger_urgency, thirst_urgency, temp_urgency, Target, Target_x, Target_color, num_food, num_water, adsign, hsign, filename, next_t, time_init
        
        # Initialize weighting factor
        hunger_k = 0.78
        thirst_k = 0.8
        temp_k = 0.85

        # TODO: Calculate allostatic load
        hunger_allo_load = 0.0
        thirst_allo_load = 0.0
        temp_allo_load = 0.0

        # TODO: Weighing drives of interoceptive adaptive agents based on allostatic load
        if version == 0:
            print("Dynamic weighing: to be implemented.") 

        # TODO: Weighing drives of exteroceptive adaptive agents based on detected resources
        elif version == 1:
            print("Dynamic weighing: to be implemented.") 

        # Calculate and publish drives
        hunger_drive = hunger_urgency * hunger_k 
        thirst_drive = thirst_urgency * thirst_k 
        temp_drive = temp_urgency * temp_k 

        print("HUNGER:", "k:", hunger_k, "AL:", hunger_allo_load, "Drive:", hunger_drive)
        print("THIRST:", "k:", thirst_k, "AL:", thirst_allo_load, "Drive:", thirst_drive)
        print("TEMP:", "k:", temp_k, "AL:", temp_allo_load, "Drive:", temp_drive)
        self.publishMsg(hunger_drive, thirst_drive, temp_drive, adsign, hsign)

        # Log homeostatic and allostatic data
        with open(filename, "a", newline="") as csv_file:
            csv_writer = csv.DictWriter(csv_file, fieldnames=['Time', 'dVTemp', 'aVTemp', 'UTemp', 'kTemp', 'ALTemp', 'DTemp', 'dVEnergy', 'aVEnergy', 'UHunger', 'kHunger', 'ALHunger', 'DHunger', 'dVWater', 'aVWater', 'UThirst', 'kThirst', 'ALThirst', 'DThirst', 'NFood', 'NWater']) 
            csv_writer.writerow({'Time': round(time.time()), 'dVTemp': 0.9, 'aVTemp': temp_aV, 'UTemp': temp_urgency, 'kTemp': temp_k, 'ALTemp': temp_allo_load, 'DTemp': temp_drive, 'dVEnergy': 0.9, 'aVEnergy': energy_aV, 'UHunger': hunger_urgency, 'kHunger': hunger_k, 'ALHunger': hunger_allo_load, 'DHunger': hunger_drive, 'dVWater': 0.9, 'aVWater': water_aV, 'UThirst': thirst_urgency, 'kThirst': thirst_k, 'ALThirst': thirst_allo_load, 'DThirst': thirst_drive, 'NFood': num_food, 'NWater': num_water})
    
    def publishMsg(self, hunger_drive_msg, thirst_drive_msg, temp_drive_msg, ad_msg, h_msg):
        self.msg = Drive()
        self.msg.hunger_drive = hunger_drive_msg
        self.msg.thirst_drive = thirst_drive_msg
        self.msg.temp_drive = temp_drive_msg
        self.msg.adsign = ad_msg
        self.msg.hsign = h_msg
        # Publish to ROS topic
        self.pub.publish(self.msg)
        
def main(args):
    # Initialize ROS node and receiver module
    rospy.init_node("allostatic_controller", anonymous=True)
    allostatic_class = AllostaticController()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS allostatic module")

if __name__ == '__main__':
    main(sys.argv)