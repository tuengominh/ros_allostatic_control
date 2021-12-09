#!/usr/bin/env python3
import sys, time, random
import numpy as np
import rospy
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import LaserScan
from sensor_msgs.msg import Image
from allostatic_control.msg import Blob

Target = False
Target_x = 0
Target_color = ""
num_food = 0
num_water = 0
pred_color = "red"
food_color = "green"
water_color = "blue"

R_obstacle = False
L_obstacle = False
R_obstacle_dist = 0
L_obstacle_dist = 0
obs_dist_th = 0.4

blob_list = []
visualize_blob = False 
debug = False 

next_t = 1000
time_init = time.time()

class StimuliDetector:
    def __init__(self):
        # Subscribe to ROS topics
        self.sub = rospy.Subscriber("/roseco/scan", LaserScan, self.lidarCallback, queue_size=1)
        self.sub1 = rospy.Subscriber("/roseco_sensor/camera/image_raw", Image, self.cameraCallback, queue_size=1)
        # ROS topics to publish to
        self.pub = rospy.Publisher("/allostasis/perception/", Blob, queue_size=1)
    
    # Create a list of blobs that will serve to detect a target
    def cameraCallback(self, ros_data):
        global blob_list, visualize_blob 
        blob_list = []

        bridge = CvBridge()
        cv_image = bridge.imgmsg_to_cv2(ros_data, desired_encoding='passthrough')
        rgb_image = cv2.cvtColor(cv_image, cv2.COLOR_BGR2RGB)
        gray = cv2.cvtColor(rgb_image, cv2.COLOR_BGR2GRAY)

        # Setup SimpleBlobDetector parameters
        params = cv2.SimpleBlobDetector_Params()
        params.maxThreshold = 100
        params.maxArea = 100000
        params.filterByConvexity = True
        params.minConvexity = 0.5
        detector = cv2.SimpleBlobDetector_create(params)
        keypoints = detector.detect(gray)
        num_keypoints = len(keypoints)

        for i in range(num_keypoints):
            blob_info_list=[]
            x_pos = round(keypoints[i].pt[0])
            y_pos = round(keypoints[i].pt[1])
            size = round(keypoints[i].size, 3)
            rgb = cv_image[y_pos][x_pos].tolist()
            
            color_blob = self.checkColor(cv_image[y_pos][x_pos])
            if debug == True:
                print("BLOB COLOR = " + color_blob)
                print("KEYPOINT " + str(i) + " X = " + str(x_pos) + " Y = " + str(y_pos))
                print("RGB = " + str(rgb))
                print("KEYPOINT " + str(i) + " Size = " + str(size))
            
            blob_info_list.append(i)
            blob_info_list.append(color_blob)
            blob_info_list.append(x_pos)
            blob_info_list.append(size)
            blob_list.append(blob_info_list)

        if visualize_blob == True:
            im_with_keypoints = cv2.drawKeypoints(gray, keypoints, np.array([]), (0,255,0), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
            cv2.imshow("Keypoints", im_with_keypoints)
            cv2.waitKey(0)

    def checkColor(self, colors):
        Red = colors[0]
        Green = colors[1]
        Blue = colors[2]
        color_th = 50
        color_blob = ""

        if Red - color_th > Green and Red - color_th > Blue:
            color_blob = "red"
        if Blue - color_th > Green and Blue - color_th > Red:
            color_blob = "blue"
        if Green - color_th > Blue and Green - color_th > Red:
            color_blob = "green"

        return color_blob
    
    # Detect obstacle relative position and distance
    def lidarCallback(self, ros_data):
        global obs_dist_th, R_obstacle_dist, L_obstacle_dist, R_obstacle, L_obstacle, Target, Target_x, Target_color, num_food, num_water

        R_obstacle = False
        L_obstacle = False
        R_obstacle_dist = 1000
        L_obstacle_dist = 1000
        R_obstacle_pos = 0
        L_obstacle_pos = 0
        lidar_data = ros_data.ranges

        for i in range (45):
            # Detect first R obstacle
            if lidar_data[i+135] < obs_dist_th and R_obstacle == False: 
                R_obstacle_dist = lidar_data[i+135]
                R_obstacle_pos = i + 135
                R_obstacle = True
            # Detect first L obstacle
            if lidar_data[i+180] < obs_dist_th and L_obstacle == False: 
                L_obstacle_dist = lidar_data[i+180]
                L_obstacle_pos = i + 180
                L_obstacle = True
            # Update R obstacle
            if lidar_data[i] < R_obstacle_dist and R_obstacle == True: 
                R_obstacle_dist = lidar_data[i]
                R_obstacle_pos = i
            # Update L obstacle
            if lidar_data[i] < L_obstacle_dist and L_obstacle == True: 
                L_obstacle_dist = lidar_data[i+180]
                L_obstacle_pos = i + 180

        self.findTarget() 
        self.publishMsg(Target, Target_x, Target_color, R_obstacle, L_obstacle, R_obstacle_dist, L_obstacle_dist, num_food, num_water)
        print("FOOD:", num_food, "WATER:", num_water)
        
    def findTarget(self):
        global next_t, time_init, blob_list, Target, Target_x, Target_color, pred_color, food_color, water_color, num_food, num_water

        Target = False
        Target_color = ""
        Target_x = 0
        Target_size = 0

        # Restart local perception after every 1000s
        current_t = round(time.time() - time_init)
        if current_t == next_t:
            num_food = 0
            num_water = 0
            next_t = current_t + 1000

        for i in range (len(blob_list)):
            if debug == True:
                print(blob_list[i])
            # Detect the target
            Target_color = blob_list[i][1]
            if Target_color == food_color or Target_color == water_color or Target_color == pred_color:
                if Target == False:
                    Target_x = blob_list[i][2]
                    Target_size = blob_list[i][3]
                    Target = True
                # Choose the bigger/closer target
                elif Target == True and Target_size < blob_list[i][3]: 
                    Target_x = blob_list[i][2]
                    Target_size = blob_list[i][3]
                    Target = True

            # Keep track on number of detected resources
            if Target_color == food_color:
                num_food += 1
            elif Target_color == water_color:
                num_water += 1

    def publishMsg(self, target_msg, tar_x_msg, tar_col_msg, r_msg, l_msg, r_dist_msg, l_dist_msg, n_food_msg, n_water_msg): 
        self.msg = Blob()
        self.msg.Target = target_msg
        self.msg.Target_x = tar_x_msg 
        self.msg.Target_color = tar_col_msg
        self.msg.R_obstacle = r_msg
        self.msg.L_obstacle = l_msg
        self.msg.R_obstacle_dist = r_dist_msg
        self.msg.L_obstacle_dist = l_dist_msg 
        self.msg.num_food = n_food_msg
        self.msg.num_water = n_water_msg
        # Publish to ROS topic
        self.pub.publish(self.msg)

def main(args):
    # Initialize ROS node and receiver module
    rospy.init_node("stimuli_detector", anonymous=True)
    detector_class = StimuliDetector() 
   
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS perception module")
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
