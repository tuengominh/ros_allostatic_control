#!/usr/bin/env python3
import sys, time
import numpy as np
from scipy.signal import butter, lfilter
import rospy
import csv
from allostatic_control.msg import HomeostaticState
from allostatic_control.msg import Blob
from allostatic_control.msg import Drive

## 0-interoceptive; 1-exteroceptive; 2-constant weighted
version = 0

## Modify the path to the folder where you log data in your machine
filename = "/home/usuario/ros_allostatic_control/src/allostatic_control/data/allostatic_data_v" + str(version) + ".csv"

energy_aV = 0.0
water_aV = 0.0
temp_aV = 0.0
hunger_err = 0.0
thirst_err = 0.0
temp_err = 0.0

hunger_stress = []
thirst_stress = []
temp_stress = []
num_food = 0
num_water = 0

hunger_drive = 0.0
thirst_drive = 0.0
temp_drive = 0.0
adsign = 0.0
hsign = 0.0

next_t = 1000
time_init = time.time()

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

    # Update number of resources detected
    # HINT: this could be the input of the Cerebellar Adaptive Filter
    def blobCallback(self, rosdata):
        global num_food, num_water
        num_food = rosdata.num_food
        num_water = rosdata.num_water

    # Update homeostatic states and drive intensities
    def stateCallback(self, rosdata):
        global next_t, time_init, energy_aV, water_aV, temp_aV, hunger_err, thirst_err, temp_err, hunger_stress, thirst_stress, temp_stress, adsign, hsign

        energy_aV = rosdata.energy_aV
        water_aV = rosdata.water_aV
        temp_aV = rosdata.temp_aV
        hunger_err = rosdata.hunger_err
        thirst_err = rosdata.thirst_err
        temp_err = rosdata.temp_err
        adsign = rosdata.adsign
        hsign = rosdata.hsign

        # Only measure allostatic load every 1000s
        # HINT: when we apply PID algo, we don't have to reset the lists of accumulative errors
        current_t = round(time.time() - time_init)
        if current_t == next_t:
            hunger_stress = []
            thirst_stress = []
            temp_stress = []
            next_t = current_t + 1000

        hunger_stress.append(hunger_err)
        thirst_stress.append(thirst_err)
        temp_stress.append(temp_err)
        
        self.allostaticMechanism()

    def allostaticMechanism(self):
        global hunger_drive, thirst_drive, temp_drive, energy_aV, water_aV, temp_aV, hunger_err, thirst_err, temp_err, hunger_stress, thirst_stress, temp_stress, num_food, num_water, adsign, hsign, filename
        
        # Initialize weighting factor 
        # HINT: they're the Kps in PID conntrol
        hunger_k = 0.78
        thirst_k = 0.8
        temp_k = 0.85

        # Apply lowpass filter
        hunger_stress_arr = np.array(hunger_stress)
        thirst_stress_arr = np.array(thirst_stress)
        temp_stress_arr = np.array(temp_stress)
        hunger_stress_arr_filtered = self.butterLowpassFilter(hunger_stress_arr, 0.2, 100, 3) 
        thirst_stress_arr_filtered = self.butterLowpassFilter(thirst_stress_arr, 0.2, 100, 3) 
        temp_stress_arr_filtered = self.butterLowpassFilter(temp_stress_arr, 0.2, 100, 3) 

        # Calculate allostatic load
        # HINT: they can be used as part of the Integral term in PID control
        hunger_allo_load = max(np.mean(hunger_stress_arr_filtered), 0.0)
        thirst_allo_load = max(np.mean(thirst_stress_arr_filtered), 0.0)
        temp_allo_load = max(np.mean(temp_stress_arr_filtered), 0.0) / 5

        # Interoceptive adaptive agent
        if version == 0:
            hunger_k = min(hunger_k * (1 + hunger_allo_load), 1.0) 
            thirst_k = min(thirst_k * (1 + thirst_allo_load), 1.0) 
            temp_k = min(temp_k * (1 + temp_allo_load), 1.0) 

        # Exteroceptive adaptive agent
        elif version == 1:
            num_food_mapped = self.valMap(num_food, 0, 10000, 0, 100) if num_food <= 10000 else 100
            num_water_mapped = self.valMap(num_water, 0, 10000, 0, 100) if num_water <= 10000 else 100
            hunger_k = min(hunger_k * (1 + 1/num_food_mapped), 1.0) if num_food_mapped > 0 else 1.0
            thirst_k = min(thirst_k * (1 + 1/num_water_mapped), 1.0) if num_water_mapped > 0 else 1.0

        # Calculate drives
        hunger_drive = hunger_err * hunger_k 
        thirst_drive = thirst_err * thirst_k 
        temp_drive = temp_err * temp_k 
        self.publishMsg(hunger_drive, thirst_drive, temp_drive, adsign, hsign)

        # Log homeostatic and allostatic data
        with open(filename, "a", newline="") as csv_file:
            csv_writer = csv.DictWriter(csv_file, fieldnames=['Time', 'dVTemp', 'aVTemp', 'UTemp', 'kTemp', 'ALTemp', 'DTemp', 'dVEnergy', 'aVEnergy', 'UHunger', 'kHunger', 'ALHunger', 'DHunger', 'dVWater', 'aVWater', 'UThirst', 'kThirst', 'ALThirst', 'DThirst', 'NFood', 'NWater']) 
            csv_writer.writerow({'Time': round(time.time()), 'dVTemp': 0.9, 'aVTemp': temp_aV, 'UTemp': temp_err, 'kTemp': temp_k, 'ALTemp': temp_allo_load, 'DTemp': temp_drive, 'dVEnergy': 0.85, 'aVEnergy': energy_aV, 'UHunger': hunger_err, 'kHunger': hunger_k, 'ALHunger': hunger_allo_load, 'DHunger': hunger_drive, 'dVWater': 0.95, 'aVWater': water_aV, 'UThirst': thirst_err, 'kThirst': thirst_k, 'ALThirst': thirst_allo_load, 'DThirst': thirst_drive, 'NFood': num_food, 'NWater': num_water})

    def butterLowpass(self, cutoff, fs, order=5):
        nyq = 0.5 * fs
        normal_cutoff = cutoff / nyq
        b, a = butter(order, normal_cutoff, btype='low', analog=False)
        return b, a

    def butterLowpassFilter(self, data, cutoff, fs, order=5):
        b, a = self.butterLowpass(cutoff, fs, order=order)
        y = lfilter(b, a, data)
        return y
    
    def valMap(self, value, istart, istop, ostart, ostop):
        return ostart + (ostop - ostart) * ((value - istart) / (istop - istart))
    
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