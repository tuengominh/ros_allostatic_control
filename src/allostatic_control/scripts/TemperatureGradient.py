#!/usr/bin/env python3
import sys, time, math, random
import numpy as np
import rospy
from gazebo_msgs.msg import ModelStates
from allostatic_control.msg import TemperatureState

temp_aV = 1.0
temp_dV = 0.9 # values 0-1 will be inversely mapped to 50-27.5 Celsius degree, maximum desired value will be around 30 Celsius degree
temp_err = 0.0
adsign = 0.0
hsign = 0.0

class TemperatureGradient:
    def __init__(self):
        self.eco_index = 0
        self.gradient = []
        self.createGradient()

        # Subscribe to ROS topics
        self.sub = rospy.Subscriber("/gazebo/model_states/", ModelStates, self.callback, queue_size=1)
        # ROS topics to publish to
        self.pub = rospy.Publisher("/allostasis/homeostasis/", TemperatureState, queue_size=1) 

    # Receive X,Y position and Z rotation of the robot
    def callback(self, rosdata):
        for i in range(len(rosdata.name)):
            if rosdata.name[i] == "roseco":
                self.eco_index = i
        self.eco_x = rosdata.pose[self.eco_index].position.x
        self.eco_y = rosdata.pose[self.eco_index].position.y
        self.eco_z = rosdata.pose[self.eco_index].orientation.z

        # Fit robot X,Y to the location of the gradient cells
        self.eco_x = max(min(self.eco_x, 2.2), 0.1)
        self.eco_y = max(min(self.eco_y, 2.2), 0.1)
        self.eco_x = int(self.valMap(self.eco_x, 0.1, 2.2, 0, 219))
        self.eco_y = int(self.valMap(self.eco_y, 0.1, 2.2, 0, 219))
        self.eco_x = max(min(self.eco_x, 215), 4)
        self.eco_y = max(min(self.eco_y, 215), 4)

        # Update temperature aV
        self.calculateAVs()

    # 220 x 220 grid with values from 0-1
    def createGradient(self):
        grad_row = np.arange(0.0, 1.0, 0.00455)
        for i in range(220):
            self.gradient.append(grad_row)
        self.gradient = np.array(self.gradient)
        self.gradient = self.gradient.reshape(220, 220)

    def calculateAVs(self):
        global temp_aV, temp_dV, temp_err, adsign, hsign
        temp_decay_factor = 0.00001
        temp_bonus = 0.1

        # 4 quadrants as local perception of the robot
        self.q0 = 0.0
        self.q1 = 0.0 
        self.q2 = 0.0
        self.q3 = 0.0
        for i in range(4):
            for j in range(3):
                self.q0 += self.gradient[self.eco_y + (j + 1), self.eco_x - (i + 1)]
                self.q1 += self.gradient[self.eco_y + (j + 1), self.eco_x + (i + 1)]
                self.q2 += self.gradient[self.eco_y - (j + 1), self.eco_x - (i + 1)]
                self.q3 += self.gradient[self.eco_y - (j + 1), self.eco_x + (i + 1)]
        self.q0 /= 12
        self.q1 /= 12
        self.q2 /= 12
        self.q3 /= 12

        # aV as the mean of 4 quadrants
        temp_aV = (self.q0 + self.q1 + self.q2 + self.q3)/4
        
        # Bonus as the robot reaching around 35 Celsius degree
        if abs(temp_dV - temp_aV) < 0.3:
            temp_aV = max(min(temp_aV + temp_bonus - temp_decay_factor, 1.0), 0.1)
        else:
            temp_aV = max(min(temp_aV - temp_decay_factor, 1.0), 0.1)
            
        temp_err = max(min(abs(temp_dV - temp_aV), 1.0), 0.0) if temp_aV < temp_dV else 0

        # Calculate adsign and hsign values
        self.adSign()
        self.hSign()
        self.publishMsg(temp_aV, temp_err, adsign, hsign)  

    def adSign(self):
        global adsign, temp_dV, temp_aV
        adsign = np.sign(temp_dV - temp_aV)    

    def hSign(self):
        global hsign
        if self.eco_z <= math.pi/8 and self.eco_z > (math.pi/8) * -1:
            hsign = np.sign(self.q0 - self.q2)
        elif self.eco_z >= math.pi/8 and self.eco_z < (math.pi/8) * 3:
            hsign = np.sign((self.q0 + self.q2)/2) - ((self.q2 + self.q3)/2)
        elif self.eco_z >= (math.pi/8) * 3 and self.eco_z < (math.pi/8) * 5:
            hsign = np.sign(self.q2 - self.q3)
        elif self.eco_z >= (math.pi/8) * 5 and self.eco_z < (math.pi/8) * 7:
            hsign = np.sign((self.q2 + self.q3)/2) - ((self.q3 + self.q1)/2)
        elif self.eco_z >= (math.pi/8) * 7 or self.eco_z < (math.pi/8) * (-7):
            hsign = np.sign(self.q3 - self.q1)
        elif self.eco_z >= (math.pi/8) * (-7) and self.eco_z < (math.pi/8) * (-5):
            hsign = np.sign((self.q3 + self.q1)/2) - ((self.q1 + self.q0)/2)
        elif self.eco_z >= (math.pi/8) * (-5) and self.eco_z < (math.pi/8) * (-3):
            hsign = np.sign(self.q1 - self.q0)
        elif self.eco_z >= (math.pi/8) * (-3) and self.eco_z < (math.pi/8) * (-1):
            hsign = np.sign((self.q1 + self.q0)/2) - ((self.q0 + self.q2)/2)

    def publishMsg(self, temp_aV_msg, temp_err_msg, ad_msg, h_msg):
        self.msg = TemperatureState()
        self.msg.temp_aV = temp_aV_msg
        self.msg.temp_err = temp_err_msg 
        self.msg.adsign = ad_msg
        self.msg.hsign = h_msg
        # Publish to ROS topic
        self.pub.publish(self.msg)

    def valMap(self, value, istart, istop, ostart, ostop):
        return ostart + (ostop - ostart) * ((value - istart) / (istop - istart))
        
def main(args):
    # Initialize ROS node and receiver module
    rospy.init_node("temperature_controller", anonymous=True)
    gradient_class = TemperatureGradient()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS gradient module")

if __name__ == '__main__':
    main(sys.argv)