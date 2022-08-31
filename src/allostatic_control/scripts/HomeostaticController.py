#!/usr/bin/env python3
import sys, time
import rospy
from gazebo_simulation.msg import Resource
from allostatic_control.msg import HomeostaticState
from allostatic_control.msg import TemperatureState

energy_aV = 1.0
water_aV = 1.0
temp_aV = 1.0
hunger_urgency = 0.0
thirst_urgency = 0.0
temp_urgency = 0.0
adsign = 0.0
hsign = 0.0

class HomeostaticController:
    def __init__(self):
        # Subscribe to ROS topics
        self.sub = rospy.Subscriber("/allostasis/resource/", Resource, self.resCallback, queue_size=1)
        self.sub1 = rospy.Subscriber("/allostasis/homeostasis/", TemperatureState, self.tempCallback, queue_size=1)
        # ROS topics to publish to
        self.pub = rospy.Publisher("/allostasis/homeostasis/", HomeostaticState, queue_size=1)    

    # Get gradient information
    def tempCallback(self, rosdata):
        global temp_aV, temp_urgency, adsign, hsign
        temp_aV = rosdata.temp_aV
        temp_urgency = rosdata.temp_urgency
        adsign = rosdata.adsign
        hsign = rosdata.hsign

    # Get resource information
    def resCallback(self, rosdata):
        global energy_aV, water_aV
        resource_type = rosdata.resource
        resource_impact = rosdata.impact
        energy_decay_factor = 0.00001 
        water_decay_factor = 0.00002

        # Update aVs
        if resource_type == "Food": 
            energy_aV = max(min(energy_aV + resource_impact - energy_decay_factor, 1.0), 0.1)
            water_aV = max(min(water_aV - water_decay_factor, 1.0), 0.1)
        elif resource_type == "Water": 
            water_aV = max(min(water_aV + resource_impact - water_decay_factor, 1.0), 0.1)
            energy_aV = max(min(energy_aV - energy_decay_factor, 1.0), 0.1)
        elif resource_type == "":
            energy_aV = max(min(energy_aV - energy_decay_factor, 1.0), 0.1)
            water_aV = max(min(water_aV - water_decay_factor, 1.0), 0.1)

        self.homestaticMechanism()
        
    def homestaticMechanism(self):
        global energy_aV, water_aV, temp_aV, hunger_urgency, thirst_urgency, temp_urgency, adsign, hsign

        # Indicate desired values
        energy_min_dV = 0.9
        water_min_dV = 0.9
        # Check homeostatic states and calculate intensities |aV - dV|
        hunger_urgency = self.checkBalance(energy_aV, energy_min_dV)
        thirst_urgency = self.checkBalance(water_aV, water_min_dV)

        self.publishMsg(energy_aV, water_aV, temp_aV, hunger_urgency, thirst_urgency, temp_urgency, adsign, hsign)

    def checkBalance(self, aV, min_dV):
        urgency = abs(min_dV - aV) if aV < min_dV else 0.0
        return urgency

    def publishMsg(self, energy_aV_msg, water_aV_msg, temp_aV_msg, hunger_urgency_msg, thirst_urgency_msg, temp_urgency_msg, ad_msg, h_msg):
        self.msg = HomeostaticState()
        self.msg.energy_aV = energy_aV_msg
        self.msg.water_aV = water_aV_msg
        self.msg.temp_aV = temp_aV_msg
        self.msg.hunger_urgency = hunger_urgency_msg 
        self.msg.thirst_urgency = thirst_urgency_msg
        self.msg.temp_urgency = temp_urgency_msg
        self.msg.adsign = ad_msg
        self.msg.hsign = h_msg
        # Publish to ROS topic
        self.pub.publish(self.msg)
        
def main(args):
    # Initialize ROS node and receiver module
    rospy.init_node("homeostatic_controller", anonymous=True)
    homeostatic_class = HomeostaticController()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS homeostatic module")

if __name__ == '__main__':
    main(sys.argv)