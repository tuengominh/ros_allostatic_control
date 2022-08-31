cmake_minimum_required(VERSION 3.0.2)
project(allostatic_control)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  gazebo_plugins
  gazebo_ros
  gazebo_ros_control
  xacro
  sensor_msgs
  genmsg
  message_generation 
  std_msgs
)

## Generate messages in the 'msg' folder
 add_message_files(
   FILES
   Blob.msg
   HomeostaticState.msg
   TemperatureState.msg
   Action.msg
   Drive.msg
  )

## Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   std_msgs
  )

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES allostatic_control
#  CATKIN_DEPENDS roscpp rospy std_msgs
#  DEPENDS system_lib
)

catkin_package(
  # INCLUDE_DIRS include
  CATKIN_DEPENDS
  message_runtime 
)

include_directories(${catkin_INCLUDE_DIRS})


