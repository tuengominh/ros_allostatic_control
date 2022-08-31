#!/usr/bin/env python3
import os, sys, time, random
import rospy
import cv2
import csv
from gazebo_msgs.msg import ModelStates
from gazebo_simulation.msg import Resource

## 0-interoceptive; 1-exteroceptive; 2-constant weighted
version = 0

## Modify the path to the folder where you log data in your machine
trajectory_filename = "/home/usuario/ros_allostatic_control/src/gazebo_simulation/data/trajectory_data_v" + str(version) + ".csv"

## Modify the path to the folder with SDF models in your machine
model_folder = "/home/usuario/ros_allostatic_control/src/gazebo_simulation/models/" 

num_blue = 0
num_green = 0
eco_index = 0
eco_x = 0
eco_y = 0
resource_x = 0
resource_y = 0
resource_color = "blue"
resource_list = []
resource_impact = 0
resource_type = ""
spawn_on = True
spawn_delay = 2
spawn_up = True
next_t = 5
time_init_spawn = time.time()
time_init = time.time()
num_eps = 0

class ResourceSpawner:
    def __init__(self):
        global trajectory_filename

        # Subscribe to ROS topics
        self.sub = rospy.Subscriber("/gazebo/model_states/", ModelStates, self.callback, queue_size=1)
        # ROS topics to publish to
        self.pub = rospy.Publisher("/allostasis/resource/", Resource, queue_size=1)

        # Log robot trajectory
        with open(trajectory_filename, "w", encoding="UTF8") as trajectory_csv_file:
            trajectory_csv_writer = csv.DictWriter(trajectory_csv_file, fieldnames=['Time', 'XPosition', 'YPosition']) 
            trajectory_csv_writer.writeheader()

    def callback(self, rosdata):
        global eco_x, eco_y, eco_index, trajectory_filename, num_eps, resource_type, resource_impact
        resource_type = ""
        resource_impact = 0
        
        for i in range(len(rosdata.name)):
            if rosdata.name[i] == "roseco":
                eco_index = i
        eco_x = rosdata.pose[eco_index].position.x
        eco_y = rosdata.pose[eco_index].position.y

        # Log robot trajectory
        with open(trajectory_filename, "a", newline="") as trajectory_csv_file:
            trajectory_csv_writer = csv.DictWriter(trajectory_csv_file, fieldnames=['Time', 'XPosition', 'YPosition'])
            trajectory_csv_writer.writerow({'Time': round(time.time()), 'XPosition': eco_x, 'YPosition': eco_y})

        self.spawnResource()
        self.removeResource()

        # Publish information about collided resources
        self.publishMsg(resource_type, resource_impact)

        # Shut down simulation after 500,000 callbacks
        num_eps += 1
        print("EPS:", num_eps)
        if num_eps >= 500000:
            rospy.signal_shutdown("Done simulation.")
              
    def spawnResource(self):
        global time_init_spawn, spawn_delay, spawn_on, resource_color, resource_x, resource_y, resource_list, num_blue, num_green, model_folder
        
        max_x = 2.6
        min_x = 0.1
        max_y = 2.2
        min_y = 0.1
        resource_xy = [0, 0]
        self.modifySpawnProb()

        current = time.time()
        if current - time_init_spawn > spawn_delay and spawn_on == True:
            time_init_spawn = current

            if resource_color == "green": 
                num_green += 1
                if num_green <= 100:
                    while resource_xy[0] > max_x or resource_xy[0] < min_x or resource_xy[1] > max_y or resource_xy[1] < min_y:
                        resource_xy = self.randomResourcePose(resource_color)
                    resource_x = resource_xy[0]
                    resource_y = resource_xy[1]
                    spawn_cmd = "rosrun gazebo_ros spawn_model -file " + model_folder + "resource_GREEN/model.sdf -sdf -model green" + str(num_green) + " -y " + str(resource_y) + " -x " + str(resource_x)
                    resource_list.append(["green" + str(num_green), resource_x, resource_y, "on"])
                    os.system(spawn_cmd)
                    resource_color = "blue"

            elif resource_color == "blue":
                num_blue += 1
                if num_blue <= 100:
                    while resource_xy[0] > max_x or resource_xy[0] < min_x or resource_xy[1] > max_y or resource_xy[1] < min_y:
                        resource_xy = self.randomResourcePose(resource_color)
                    resource_x = resource_xy[0]
                    resource_y = resource_xy[1]
                    spawn_cmd = "rosrun gazebo_ros spawn_model -file " + model_folder + "resource_BLUE/model.sdf -sdf -model blue" + str(num_blue) + " -y " + str(resource_y) + " -x " + str(resource_x)
                    resource_list.append(["blue" + str(num_blue), resource_x, resource_y, "on"])
                    os.system(spawn_cmd)
                    resource_color = "green"

    # Changing spawning speed/probability during the simulation
    def modifySpawnProb(self):
        global next_t, time_init, spawn_on, spawn_delay, spawn_up
        current_t = round(time.time() - time_init)

        # Speed/probability increases 5s at every 5s
        increment = 5
        # Speed/probability decreases 5s after reaching 50s per spawning
        ceiling = 50

        if current_t == next_t and spawn_on == True:
            if spawn_up == True and spawn_delay <= ceiling:
                spawn_delay += increment
                if spawn_delay == ceiling: 
                    spawn_up = False   
            else: 
                spawn_up = False
                spawn_delay -= increment
                if spawn_delay == 5:
                    spawn_up = True
            next_t = current_t + 5

    # Spawn resources to specific locations in the arena
    def randomResourcePose(self, resource_color):
        if resource_color == "blue":  # water
            rand_x = random.gauss(2.3, 0.3)
            rand_y = random.gauss(1.7, 0.3)

        if resource_color == "green": # food
            rand_x = random.gauss(0.3, 0.5)
            rand_y = random.gauss(2.0, 0.3)

        return(rand_x, rand_y)
    
    def removeResource(self):
        global eco_x, eco_y, resource_x, resource_y, resource_list, resource_type, resource_impact

        for i in range(len(resource_list)):
            if abs(eco_x - resource_list[i][1]) < 0.1 and abs(eco_y - resource_list[i][2]) < 0.1 and resource_list[i][3] == "on":
                os.system("rosservice call gazebo/delete_model '{model_name: " + resource_list[i][0] + "}'")
                resource_list[i][3] = "off"
                color_rm = resource_list[i][0] 

                # Send message only when the resource is removed
                if "green" in color_rm[:-1]:
                    resource_type = "Food"
                    resource_impact = 0.2      
                elif "blue" in color_rm[:-1]:
                    resource_type = "Water"
                    resource_impact = 0.4

    def publishMsg(self, resource_msg, impact_msg): 
        self.msg = Resource()
        self.msg.resource = resource_msg 
        self.msg.impact = impact_msg 
        # Publish msg to ROS topic
        self.pub.publish(self.msg)
        print(self.msg.resource + " consumed.")

def main(args):
    # Initialize ROS node and receiver module
    rospy.init_node("object_spawner", anonymous=True)
    spawner_class = ResourceSpawner()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down ROS spawner module")
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
